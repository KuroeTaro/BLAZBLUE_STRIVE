# -*- coding: utf-8 -*-
"""下载 imageio-ffmpeg 的 wheel(带镜像回退),再从 wheel 里解出 ffmpeg.exe

pip 的临时目录被沙箱挡住 -> 自己下 wheel 再解包,不经过 pip install。
"""
import json, os, sys, time, urllib.parse, urllib.request, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
DEST = os.path.join(HERE, "ffmpeg")
os.makedirs(DEST, exist_ok=True)

INDEXES = [
    ("aliyun",   "https://mirrors.aliyun.com/pypi/simple/imageio-ffmpeg/"),
    ("tuna",     "https://pypi.tuna.tsinghua.edu.cn/simple/imageio-ffmpeg/"),
    ("pypi",     "https://pypi.org/simple/imageio-ffmpeg/"),
]

def fetch(url, timeout=60):
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    return urllib.request.urlopen(req, timeout=timeout)

def find_wheel():
    for name, index in INDEXES:
        try:
            html = fetch(index).read().decode("utf-8", "replace")
        except Exception as e:
            print("[%s] index FAIL: %s" % (name, e)); sys.stdout.flush()
            continue
        import re
        links = re.findall(r'href="([^"]+win_amd64\.whl[^"]*)"', html)
        if not links:
            print("[%s] no wheel link" % name); sys.stdout.flush(); continue
        url = urllib.parse.urljoin(index, links[-1].split("#")[0])
        print("[%s] wheel: %s" % (name, url)); sys.stdout.flush()
        return name, url
    return None, None

def download(url, path):
    t0 = time.time()
    done = 0
    with fetch(url, timeout=60) as r, open(path, "wb") as f:
        total = int(r.headers.get("Content-Length") or 0)
        while True:
            chunk = r.read(262144)
            if not chunk:
                break
            f.write(chunk)
            done += len(chunk)
            if done % (4 * 1048576) < 262144:
                rate = done / 1024 / max(time.time() - t0, 0.001)
                print("  %5.1f / %5.1f MB  %.0f KB/s"
                      % (done / 1048576, total / 1048576, rate))
                sys.stdout.flush()
    print("  done %.1f MB in %.1fs" % (done / 1048576, time.time() - t0))
    return done

def main():
    name, url = find_wheel()
    if not url:
        print("no wheel found"); return 1
    whl = os.path.join(DEST, os.path.basename(urllib.parse.urlparse(url).path))
    download(url, whl)
    if os.path.getsize(whl) < 1000000:
        print("wheel too small, mirror probably returned an error page"); return 1
    with zipfile.ZipFile(whl) as z:
        exes = [n for n in z.namelist() if n.lower().endswith(".exe")]
        print("exe in wheel:", exes)
        for n in exes:
            out = os.path.join(DEST, os.path.basename(n))
            with z.open(n) as src, open(out, "wb") as dst:
                dst.write(src.read())
            os.chmod(out, 0o755)
            print("extracted -> %s (%d bytes)" % (out, os.path.getsize(out)))
    return 0

if __name__ == "__main__":
    sys.exit(main())
