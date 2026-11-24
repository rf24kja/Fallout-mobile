"""Fallout 2 DAT archive reader (master.dat / critter.dat / patch000.dat).

Format (reverse-engineered from a GOG Fallout 2 installation):
  Each file is a stream of zlib-compressed (or raw) blobs followed by a dense
  chain of directory entries near EOF:

    [LE u32 name_len][name bytes][flag byte][LE u32 uncompressed_size]
    [LE u32 compressed_size][LE u32 offset]

  flag == 1 -> zlib.decompress(blob), flag == 0 -> raw blob.
  Names use '\\' path separators.

Licensed data: this module only reads local archives. It is never committed
with extracted game data (output goes into the gitignored .local/ folder).
"""
import struct
import zlib
from pathlib import Path


def read_entries(path):
    """Return list of dicts: name, flag, uncompressed, compressed, offset."""
    data = Path(path).read_bytes()
    n = len(data)
    sep = b"\\"
    found = []
    # Directory chain lives at EOF; scan the last ~600 KB for entry headers.
    start = max(0, n - 600_000)
    for p in range(start, n - 20):
        if p + 5 > n:
            break
        L = struct.unpack_from("<I", data, p)[0]
        if not (3 <= L <= 200):
            continue
        q = p + 4
        name = data[q:q + L]
        if not name or not all(32 <= c < 127 for c in name):
            continue
        q += L
        if q + 13 > n:
            continue
        flag = data[q]
        us, cs, ofs = struct.unpack_from("<III", data, q + 1)
        if not (0 <= ofs < n) or cs == 0 or cs > n or us > 100_000_000:
            continue
        if sep not in name:  # directory entries always contain a path
            continue
        found.append({
            "name": name.decode("latin1"), "flag": flag,
            "uncompressed": us, "compressed": cs, "offset": ofs,
        })
    # De-duplicate by name (two overlapping chains were observed).
    uniq = {}
    for e in found:
        uniq[e["name"]] = e
    return list(uniq.values()), data


def extract(path, out_dir, verify=True):
    """Extract all files to out_dir, return (extracted_count, error_count)."""
    entries, data = read_entries(path)
    out_dir = Path(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    ok = err = 0
    for e in entries:
        blob = data[e["offset"]:e["offset"] + e["compressed"]]
        try:
            raw = zlib.decompress(blob) if e["flag"] == 1 else blob
        except zlib.error:
            err += 1
            continue
        if verify and len(raw) != e["uncompressed"]:
            err += 1
            continue
        rel = e["name"].replace("\\", "/")
        target = out_dir / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(raw)
        ok += 1
    return ok, err


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 3:
        raise SystemExit("usage: python dat_reader.py <archive.dat> <out_dir>")
    ok, err = extract(*sys.argv[1:])
    print(f"extracted={ok} errors={err}")
