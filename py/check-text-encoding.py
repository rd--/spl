#!/usr/bin/env python3

import sys


def check_file(path: str) -> bool:
    """Return True if file is valid UTF-8 text and not considered binary.

    Conditions:
    - Decodes as UTF-8 without errors.
    - Contains no NUL (\x00) bytes, which git and Emacs treat as binary.
    """
    try:
        with open(path, "rb") as f:
            data = f.read()
    except OSError as e:
        print(f"{path}: cannot read file ({e})", file=sys.stderr)
        return False

    try:
        data.decode("utf-8")
    except UnicodeDecodeError as e:
        print(f"{path}: not valid UTF-8 ({e})", file=sys.stderr)
        return False

    if b"\x00" in data:
        print(f"{path}: contains NUL bytes, likely treated as binary by git/Emacs", file=sys.stderr)
        return False

    #print(f"{path}: OK (UTF-8 text)")
    return True


def main(argv):
    if len(argv) < 2:
        print(f"Usage: {argv[0]} FILE [FILE ...]", file=sys.stderr)
        return 1

    ok = True
    for path in argv[1:]:
        if not check_file(path):
            ok = False

    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv))
