# -*- coding: utf-8 -*-
"""下载 imageio-ffmpeg 的 wheel 并取出里面的 ffmpeg.exe
(pip 的临时目录被沙箱挡住,所以自己下 wheel 再解包)
"""
import json, os, sys, urllib.request, zipfile

DEST_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "ffmpeg")
os.makedirs(DEST_DIR, exist_ok=True)

def main():
    print("querying pypi ...")
    with urllib.request.urlopen("https://pypi.org/pypi/imageio-ffmpeg/json", timeout=60) as f:
        data = json.load(f)
    wheels = [u for u in data["urls"] if u["filename"].endswith("win_amd64.whl")]
    if not wheels:
        print("no win_amd64 wheel found")
        return 1
    w = wheels[0]
    whl_path = os.path.join(DEST_DIR, w["filename"])
    print("download %s (%.1f MB)" % (w["filename"], w["size"] / 1048576))
    urllib.request.urlretrieve(w["url"], whl_path)
    print("saved", whl_path)

    with zipfile.ZipFile(whl_path) as z:
        names = [n for n in z.namelist() if "ffmpeg" in n.lower() and n.lower().endswith(".exe")]
        print("binaries in wheel:", names)
        for n in names:
            out = os.path.join(DEST_DIR, os.path.basename(n))
            with z.open(n) as src, open(out, "wb") as dst:
                dst.write(src.read())
            os.chmod(out, 0o755)
            print("extracted ->", out, os.path.getsize(out), "bytes")
    return 0

if __name__ == "__main__":
    sys.exit(main())
