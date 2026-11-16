#!/usr/bin/env python3

import argparse
import pathlib

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Check consecutive newlines."
    )
    parser.add_argument("files", nargs="+", type=pathlib.Path)
    args = parser.parse_args()
    for path in args.files:
        try:
            data = path.read_bytes()
        except OSError:
            print(path)
            continue
        if b"\n\n\n" in data:
            print(path)

if __name__ == "__main__":
    main()
