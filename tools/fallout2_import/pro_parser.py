"""Best-effort Fallout 2 .pro (prototype) binary header reader.

The full Fallout 2 PRO layout is complex and type-specific; this module does
NOT claim lossless decoding. It records the authoritative PID from the file
name, a set of leading little-endian 32-bit header words, the exact byte
length, and a raw hex prefix. This is enough to preserve original IDs and to
cross-reference .msg name/description tables without inventing stats.

Licensed data: reads local files only; JSON output stays in gitignored .local/.
"""
import struct
from pathlib import Path


def parse(path, header_words=12):
    data = Path(path).read_bytes()
    stem = Path(path).stem          # e.g. "00000455"
    pid = None
    try:
        pid = int(stem, 16) if len(stem) == 8 else int(stem)
    except ValueError:
        pass
    words = []
    for i in range(min(header_words, len(data) // 4)):
        words.append(struct.unpack_from("<I", data, i * 4)[0])
    return {
        "pid": pid,
        "pid_hex": stem,
        "size": len(data),
        "header_words": words,
        "raw_hex": data[:64].hex(),
    }


def parse_dir(path, glob="*.pro"):
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
