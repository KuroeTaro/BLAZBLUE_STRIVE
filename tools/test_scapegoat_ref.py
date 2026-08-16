# -*- coding: utf-8 -*-
"""Validate the scapegoat pushbox_interact_update reference implementation
extracted from _work_plan.txt using a real LuaJIT (lupa) interpreter.

Scenarios:
  1. 边缘1 场景A: opponent pinned at corner between wall and scapegoat -> no push
  2. P1 basic push: scapegoat pushes opponent out (sufficient gap)
  3. 边缘2 dual scapegoat, sufficient gap -> chars absorb into own scapegoats
  4. 边缘2.1 deadlock (insufficient gap) -> no overlap, no identical x, deterministic
"""
import re
import lupa

LUA_RUNTIME = lupa.LuaRuntime(unpack_returned_tuples=True)
LUA = LUA_RUNTIME

STUBS = r"""
-- ---- real collision helpers (mirror of collision.lua) ----
function collision_box_to_real_world_box(obj,box)
    local res = {
        box[1]*obj[5] + obj["x"],
        box[2]*obj[6] + obj["y"],
        box[3],
        box[4]
    }
    return res
end
function collision_box_aabb_detection(box_a,box_b)
    local box_a_L = box_a[1]-box_a[3]/2
    local box_a_R = box_a[1]+box_a[3]/2
    local box_a_T = box_a[2]-box_a[4]/2
    local box_a_B = box_a[2]+box_a[4]/2
    local box_b_L = box_b[1]-box_b[3]/2
    local box_b_R = box_b[1]+box_b[3]/2
    local box_b_T = box_b[2]-box_b[4]/2
    local box_b_B = box_b[2]+box_b[4]/2
    local x_overlap = ( box_a_R >= box_b_L and box_b_R >= box_a_L )
    local y_overlap = ( box_a_T <= box_b_B and box_b_T <= box_a_B )
    return (x_overlap and y_overlap)
end

-- ---- globals the closure references ----
COLLSION_CONER_OUT_STATE = {}
obj_char_game_scene_char_RP = nil

-- ---- helpers ----
local function make_char(pid)
    return {
        id = pid,
        x = 0, y = 0,
        [5] = 1, [6] = 1,                    -- obj[5]=facing, obj[6]=yscale
        pushbox = {0, 0, 100, 200},          -- {cx, cy, w, h}
        collision_move_available = {1,1},
        collision_ground_height_offset = 0,
        wallhurt_wallstick_on_side = 0,
        state = "idle",
        projectile_table = {}
    }
end
local function make_sc(x)
    return {
        x = x, y = 0, [5] = 1, [6] = 1,
        pushbox = {0, 0, 40, 300},
        pushbox_opponent_collision_active = true
    }
end
local function chars_overlap(ca, cb)
    local ba = collision_box_to_real_world_box(ca, ca["pushbox"])
    local bb = collision_box_to_real_world_box(cb, cb["pushbox"])
    return collision_box_aabb_detection(ba, bb)
end
-- x 方向穿透量: >0 真实重叠; <=0 相切或分离
local function chars_penetration(ca, cb)
    local ba = collision_box_to_real_world_box(ca, ca["pushbox"])
    local bb = collision_box_to_real_world_box(cb, cb["pushbox"])
    local aL, aR = ba[1]-ba[3]/2, ba[1]+ba[3]/2
    local bL, bR = bb[1]-bb[3]/2, bb[1]+bb[3]/2
    local y_overlap = ( (ba[2]-ba[4]/2) <= (bb[2]+bb[4]/2) ) and ( (bb[2]-bb[4]/2) <= (ba[2]+ba[4]/2) )
    if not y_overlap then return -1 end
    return math.max(0, math.min(aR, bR) - math.max(aL, bL))
end
function _make_char(id) return make_char(id) end
function _make_sc(x) return make_sc(x) end
function _chars_overlap(ca, cb) return chars_overlap(ca, cb) end
function _chars_penetration(ca, cb) return chars_penetration(ca, cb) end
function _set_RP(rp) obj_char_game_scene_char_RP = rp end
function _set_move(c, l, r)
    c["collision_move_available"] = {l, r}
end
function _set_active(sc, v)
    sc["pushbox_opponent_collision_active"] = v
end
"""


def extract_function(path):
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()
    start = next(i for i, ln in enumerate(lines)
                 if "function collision_pushbox_create_scapegoat_interact_update(" in ln)
    end = next(i for i, ln in enumerate(lines)
               if ln.strip().startswith("4.2 边缘情况专项"))
    return "".join(lines[start:end])


def main():
    path = r"h:\_love\BLAZBLUE_STRIVE\_work_plan.txt"
    fn_src = extract_function(path)
    LUA.execute(STUBS)
    LUA.execute(fn_src)
    make_char = LUA.globals()._make_char
    make_sc = LUA.globals()._make_sc
    overlap = LUA.globals()._chars_overlap
    penetration = LUA.globals()._chars_penetration
    set_rp = LUA.globals()._set_RP
    set_move = LUA.globals()._set_move
    set_active = LUA.globals()._set_active
    factory = LUA.globals().collision_pushbox_create_scapegoat_interact_update

    results = []

    # ---- S1: corner pin (边缘1 场景A) ----
    sc = make_sc(2030)          # spans 2010..2050
    lp = make_char("LP"); lp.x = 0
    rp = make_char("RP"); rp.x = 2050
    set_move(rp, 1, 0)          # pinned at right wall
    set_rp(rp)
    factory(sc, lp, rp)()
    results.append(("S1 corner pin: RP stays pinned", abs(rp.x - 2050) < 0.001))

    # ---- S2: basic push (P1), sufficient gap ----
    sc2 = make_sc(0)            # spans -20..20
    lp2 = make_char("LP"); lp2.x = -200
    rp2 = make_char("RP"); rp2.x = 0
    set_rp(rp2)
    factory(sc2, lp2, rp2)()
    results.append(("S2 basic push: RP.x==70", abs(rp2.x - 70) < 0.001))
    results.append(("S2 no LP-RP penetration", penetration(lp2, rp2) <= 0.001))

    # ---- S3: dual squeeze, sufficient gap (边缘2) ----
    A = make_sc(200)            # LP's, blocks RP (right)
    B = make_sc(-200)           # RP's, blocks LP (left)
    lp3 = make_char("LP"); lp3.x = -150
    rp3 = make_char("RP"); rp3.x = 150
    set_rp(rp3)
    fnA = factory(A, lp3, rp3)
    fnB = factory(B, rp3, lp3)
    fnA(); fnB()
    results.append(("S3 RP pushed out of A (x~130)", abs(rp3.x - 130) < 0.001))
    results.append(("S3 LP pushed out of B (x~-130)", abs(lp3.x - (-130)) < 0.001))
    results.append(("S3 no LP-RP penetration", penetration(lp3, rp3) <= 0.001))
    results.append(("S3 no identical x", lp3.x != rp3.x))

    # ---- S4: deadlock, insufficient gap (边缘2.1) ----
    A4 = make_sc(30)            # LP's, blocks RP (right)
    B4 = make_sc(-30)           # RP's, blocks LP (left)
    lp4 = make_char("LP"); lp4.x = 0
    rp4 = make_char("RP"); rp4.x = 0
    set_rp(rp4)
    fnA4 = factory(A4, lp4, rp4)
    fnB4 = factory(B4, rp4, lp4)
    fnA4(); fnB4()
    results.append(("S4 deadlock: no LP-RP penetration", penetration(lp4, rp4) <= 0.001))
    results.append(("S4 deadlock: no identical x", lp4.x != rp4.x))
    results.append(("S4 deadlock: deterministic (LP side)", abs(lp4.x - 200) < 0.001))
    results.append(("S4 deadlock: deterministic (RP side)", abs(rp4.x - 100) < 0.001))

    # ---- S5: gate off -> no movement ----
    sc5 = make_sc(0)
    lp5 = make_char("LP"); lp5.x = -200
    rp5 = make_char("RP"); rp5.x = 0
    set_rp(rp5)
    set_active(sc5, False)
    factory(sc5, lp5, rp5)()
    results.append(("S5 gate off: RP unmoved", abs(rp5.x - 0) < 0.001))

    # ---- S6: owner passes through (owner inside scapegoat, no push) ----
    sc6 = make_sc(0)
    lp6 = make_char("LP"); lp6.x = 0          # owner INSIDE scapegoat
    rp6 = make_char("RP"); rp6.x = -200       # opponent far away
    set_rp(rp6)
    factory(sc6, lp6, rp6)()
    results.append(("S6 owner passes through: LP unmoved", abs(lp6.x - 0) < 0.001))

    for name, ok in results:
        print(("PASS  " if ok else "FAIL  ") + name)
    failed = [n for n, ok in results if not ok]
    print("\n%d/%d passed" % (len(results) - len(failed), len(results)))
    if failed:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
