# -*- coding: utf-8 -*-
"""
Analyze the TRM character state machine in scenes/game_scene/characters/TRM/left.lua
(and right.lua) and dump a structured report of:

  * dispatch switch states (the "obj state" registry)
  * state gate functions (state_gate_..._from_<state> / _to_<state>)
  * common helper gate functions (state_gate_..._common_*)
  * direct self-state writes inside each gate
  * which sub-gates / common helpers each gate calls
  * transitive reachable self-states (following the call graph)

Run:  python tools/analyze_state_machine.py  (from repo root)
Output: a JSON file next to the input + printed summary
"""
import io, os, re, sys, json

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, "scenes", "game_scene", "characters", "TRM")

FUNC_RE = re.compile(r"^function\s+([A-Za-z0-9_]+)", re.M)
# self side char state write (direct literal target)
SELF_WRITE_RE = re.compile(r'self_side_obj_char\s*\[\s*"state"\s*\]\s*=\s*"([A-Za-z0-9_]+)"')
SELF_WRITE_NONLIT_RE = re.compile(r'self_side_obj_char\s*\[\s*"state"\s*\]\s*=\s*(?!")')
ANY_STATE_WRITE_RE = re.compile(r'\[\s*"state"\s*\]\s*=\s*"([A-Za-z0-9_]+)"')
# opponent write
OPP_WRITE_RE = re.compile(r'opponent_side_obj_char\s*\[\s*"state"\s*\]\s*=\s*"([A-Za-z0-9_]+)"')
# sub-gate / common helper calls
GATE_CALL_RE = re.compile(
    r"state_gate_game_scene_char_(?:LP|RP)_(from|to|common)_([A-Za-z0-9_]+)\s*\(")

GATE_PREFIX = "state_gate_game_scene_char_"


def split_functions(text):
    """Return ordered list of (name, body) for top-level functions."""
    out = []
    matches = list(FUNC_RE.finditer(text))
    for i, m in enumerate(matches):
        name = m.group(1)
        start = m.end()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(text)
        out.append((name, text[start:end]))
    return out


def dispatch_states(body):
    """From a state_machine dispatch body, return ordered list of switch keys."""
    keys = []
    for m in re.finditer(r'\[\s*"([A-Za-z0-9_]+)"\s*\]\s*=\s*function', body):
        keys.append(m.group(1))
    return keys


def analyze_side(side):
    """side = 'LP' or 'RP'"""
    fname = "left.lua" if side == "LP" else "right.lua"
    path = os.path.join(SRC, fname)
    with io.open(path, "r", encoding="utf-8") as f:
        text = f.read()

    funcs = split_functions(text)
    rec = {name: {"body": body, "kind": None, "state": None} for name, body in funcs}

    # classify state machine functions
    dispatch_name = None
    for name in funcs:
        if name[0].startswith("state_machine_char_game_scene_char_") and "_" not in name[0][len("state_machine_char_game_scene_char_"):]:
            dispatch_name = name[0]
    for name, body in funcs:
        k = None
        st = None
        if name.startswith(GATE_PREFIX + side + "_from_"):
            k, st = "from", name[len(GATE_PREFIX + side + "_from_"):]
        elif name.startswith(GATE_PREFIX + side + "_to_"):
            k, st = "to", name[len(GATE_PREFIX + side + "_to_"):]
        elif name.startswith(GATE_PREFIX + side + "_common_"):
            k, st = "common", name[len(GATE_PREFIX + side + "_common_"):]
        rec[name]["kind"], rec[name]["state"] = k, st

    def extract(body):
        self_writes = [m.group(1) for m in SELF_WRITE_RE.finditer(body)]
        opp_writes = [m.group(1) for m in OPP_WRITE_RE.finditer(body)]
        # non-literal self writes (e.g. = state_cache) count them
        nonlit = len(SELF_WRITE_NONLIT_RE.findall(body))
        calls = []
        for m in GATE_CALL_RE.finditer(body):
            kk, stt = m.group(1), m.group(2)
            calls.append((kk, stt))
        # every literal state write on any receiver
        any_lit = [m.group(1) for m in ANY_STATE_WRITE_RE.finditer(body)]
        return {"self_writes": self_writes, "opp_writes": opp_writes,
                "nonlit": nonlit, "any_lit": any_lit, "calls": calls}

    info = {}
    for name, body in funcs:
        info[name] = extract(body)

    # call graph among gate functions of this side
    graph = {}
    for name, body in funcs:
        if not name.startswith(GATE_PREFIX + side):
            continue
        calls = []
        for m in GATE_CALL_RE.finditer(body):
            kk, stt = m.group(1), m.group(2)
            target = "%s%s_%s_%s" % (GATE_PREFIX, side, kk, stt)
            if target in rec:
                calls.append(target)
        graph[name] = {"calls": calls, "direct": info[name]["self_writes"]}

    # transitive closure: reachable direct writes through called gates
    from functools import lru_cache
    memo = {}
    def reach(name):
        if name in memo:
            return memo[name]
        memo[name] = None  # guard cycle
        res = set(graph.get(name, {}).get("direct", []))
        for t in graph.get(name, {}).get("calls", []):
            res |= reach(t)
        memo[name] = res
        return res

    result = {
        "side": side,
        "file": fname,
        "dispatch_name": dispatch_name,
        "dispatch_states": dispatch_states(rec[dispatch_name]["body"]) if dispatch_name else [],
        "functions": [],
    }
    for name, body in funcs:
        e = info[name]
        if not name.startswith(GATE_PREFIX + side) and name != dispatch_name:
            continue
        entry = {
            "name": name,
            "kind": rec[name]["kind"],
            "state": rec[name]["state"],
            "line": None,
            "self_writes": sorted(set(e["self_writes"])),
            "opp_writes": sorted(set(e["opp_writes"])),
            "any_lit": sorted(set(e["any_lit"])),
            "nonlit_self_write": e["nonlit"],
            "calls": sorted(set(e["calls"])),
        }
        if name.startswith(GATE_PREFIX + side):
            entry["reach"] = sorted(reach(name))
        result["functions"].append(entry)
    return result


def short(nm, side):
    return nm[len(GATE_PREFIX + side + "_"):]


def write_report(lp, path):
    side = lp["side"]
    P = GATE_PREFIX + side
    lines = []
    lines.append("== COMMON HELPER GATES (%s) ==" % side)
    for f in lp["functions"]:
        if f["kind"] != "common":
            continue
        lines.append("common_%-58s direct->{%s} calls{%s}" % (
            f["state"],
            ",".join(f["self_writes"]),
            ",".join(sorted(set(x[1] for x in f["calls"]))),
        ))
    lines.append("")
    lines.append("== PER-STATE GATES (%s) ==" % side)
    for f in lp["functions"]:
        if f["kind"] not in ("from", "to"):
            continue
        tag = "%s_%s" % (f["kind"], f["state"])
        lines.append("[%s]" % tag)
        if f["self_writes"]:
            lines.append("    direct_self_state -> " + ", ".join(f["self_writes"]))
        if f["opp_writes"]:
            lines.append("    opp_state -> " + ", ".join(f["opp_writes"]))
        if f["nonlit_self_write"]:
            lines.append("    (has non-literal self state write, e.g. = state_cache)")
        calls = sorted(set(f["calls"]))
        if calls:
            by = {}
            for kk, st in calls:
                by.setdefault(kk, []).append(st)
            parts = []
            for kk in ("common", "from", "to"):
                if kk in by:
                    parts.append("%s:{%s}" % (kk, ", ".join(sorted(set(by[kk])))))
            lines.append("    calls -> " + " ; ".join(parts))
    txt = "\n".join(lines)
    with io.open(path, "w", encoding="utf-8") as f:
        f.write(txt)
    return txt


def main():
    lp = analyze_side("LP")
    out = os.path.join(ROOT, "tools", "state_machine_analysis.json")
    with io.open(out, "w", encoding="utf-8") as f:
        json.dump({"LP": lp}, f, ensure_ascii=False, indent=1)
    rep = os.path.join(ROOT, "tools", "state_machine_report.txt")
    write_report(lp, rep)
    print("wrote", out)
    print("wrote", rep)
    print("LP dispatch states:", len(lp["dispatch_states"]))
    print("LP gate funcs:", len([f for f in lp["functions"] if f["name"].startswith(GATE_PREFIX + "LP")]))


if __name__ == "__main__":
    main()
