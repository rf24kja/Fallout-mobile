"""Best-effort Fallout 2 .map binary header reader.

Observed header (from patch000/Maps/denbus1.map):
  [LE u32 name_len = 0x14][name bytes, e.g. "DENBUS1.MAP\0..."][...]
This module records the authoritative map name, file size, and a bounded set
of leading header words. It does NOT claim to reconstruct tile objects or
script instances — that requires the full FO2 MAP spec and is out of scope
for a defensive importer. Consumers must degrade gracefully.

Licensed data: reads local files only; JSON stays in gitignored .local/.
"""
import struct
from pathlib import Path


def parse(path):
    data = Path(path).read_bytes()
    name = ""
    name_len = 0
    if len(data) >= 4:
        name_len = struct.unpack_from("<I", data, 0)[0]
        if 3 <= name_len <= 256 and 4 + name_len <= len(data):
            raw = data[4:4 + name_len].split(b"\0")[0]
            name = raw.decode("latin1", errors="replace")
    words = []
    for i in range(min(16, max(0, (len(data) - 4) // 4))):
        words.append(struct.unpack_from("<I", data, 4 + i * 4)[0])
    return {
        "map_id": name.lower().replace(".map", ""),
        "name": name,
        "name_len": name_len,
        "size": len(data),
        "header_words": words,
        "source_file": Path(path).name,
    }


def parse_dir(path, glob="*.map"):
    out = []
    for p in sorted(Path(path).glob(glob)):
        try:
            out.append(parse(p))
        except Exception:
            continue
    return out


if __name__ == "__main__":
    import sys
    print(parse(sys.argv[1]))
