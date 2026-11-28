"""Fallout 2 .msg text parser.

Entries are `{id}{}{Text}` (multi-line supported), `#` starts a comment.
Used for pro_item.msg (item names/descriptions), pro_crit.msg (NPC names),
quests.msg (original quest descriptions by city), and dialogue .msg files.

Licensed data: this module parses local files only; its JSON output goes
into gitignored .local/generated/ and must never be committed with content.
"""
import re
from pathlib import Path

# {123}{}{Some text} possibly spanning lines until the next {n}{}{ or EOF
_ENTRY = re.compile(r"\{(-?\d+)\}\{\}\{(.*?)\}\s*(?=\n\{-?\d+\}\{\}\{|\Z)", re.S)


def parse(path):
    """Return dict of int id -> str text (CRLF normalized, comments dropped)."""
    text = Path(path).read_bytes().decode("latin1")
    # Drop full-line comments (keep '{' lines intact).
    lines = [ln for ln in text.splitlines() if not ln.lstrip().startswith("#")]
    cleaned = "\n".join(lines)
    out = {}
    for m in _ENTRY.finditer(cleaned):
        msg_id = int(m.group(1))
        body = m.group(2)
        body = body.replace("\r", " ").replace("\n", " ").strip()
        out[msg_id] = body
    return out


def parse_many(paths):
    merged = {}
    for p in paths:
        try:
            merged.update(parse(p))
        except Exception:
            continue
    return merged


if __name__ == "__main__":
    import sys
    d = parse(sys.argv[1])
    print(f"entries={len(d)} sample={list(d.items())[:3]}")
