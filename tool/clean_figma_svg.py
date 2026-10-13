"""Strip the parent-frame background that Figma adds when exporting a nested node as SVG.

Figma's SVG export of a node inside a frame includes a grey canvas rect and the
ancestor frame's gradient rect. Both sit before the real artwork and would paint
an opaque box behind the illustration, so remove them.

Usage: python3 tool/clean_figma_svg.py assets/svg/file.svg [more.svg ...]
"""
import re
import sys

CANVAS_RECT = re.compile(r'<rect width="[\d.]+" height="[\d.]+" fill="#E2E2E2"/>\s*')
# ancestor frame background: a full-frame rect (375 wide) translated into place
FRAME_RECT = re.compile(
    r'<rect width="375" height="[\d.]+"(?: rx="[\d.]+")? transform="translate\([^)]*\)" fill="[^"]*"/>\s*'
)

for path in sys.argv[1:]:
    src = open(path, encoding="utf-8").read()
    out, n1 = CANVAS_RECT.subn("", src, count=1)
    out, n2 = FRAME_RECT.subn("", out, count=1)
    open(path, "w", encoding="utf-8").write(out)
    print(f"{path}: removed canvas={n1} frame={n2}")
