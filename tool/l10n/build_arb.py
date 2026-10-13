"""Merge every tool/l10n/*.py string table into lib/l10n/app_<lang>.arb.

Each module defines S = {key: [en, ur, ar, hi, es, fr, de, pt, id, ru, ja, ko, tr, it, zh]} and optional
META = {key: {...arb metadata...}}. Run from the project root:
    python3 tool/l10n/build_arb.py && flutter gen-l10n
"""
import importlib.util
import json
import pathlib

here = pathlib.Path(__file__).parent
LANGS = ["en", "ur", "ar", "hi", "es", "fr", "de", "pt", "id", "ru", "ja", "ko", "tr", "it", "zh"]
strings, meta = {}, {}
for f in sorted(here.glob("*.py")):
    if f.name == "build_arb.py":
        continue
    spec = importlib.util.spec_from_file_location(f.stem, f)
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    for k, v in m.S.items():
        if k in strings:
            raise SystemExit(f"duplicate key {k} in {f.name}")
        if len(v) != len(LANGS):
            raise SystemExit(f"{f.name}:{k} has {len(v)} values, need {len(LANGS)}")
        strings[k] = v
    meta.update(getattr(m, "META", {}))

out = here.parent.parent / "lib" / "l10n"
out.mkdir(parents=True, exist_ok=True)
for i, lang in enumerate(LANGS):
    arb = {"@@locale": lang}
    for k, v in strings.items():
        arb[k] = v[i]
        if lang == "en" and k in meta:
            arb["@" + k] = meta[k]
    (out / f"app_{lang}.arb").write_text(json.dumps(arb, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
print(f"{len(strings)} keys x {len(LANGS)} languages")
