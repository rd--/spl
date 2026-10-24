#!/usr/bin/env python3

import argparse
import pathlib

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Check doctest prefixes."
    )
    parser.add_argument("files", nargs="+", type=pathlib.Path)
    args = parser.parse_args()
    for path in args.files:
        try:
            data = path.read_bytes()
        except OSError:
            print(path)
            continue
        if b">>>\t" in data:
            print(path)

if __name__ == "__main__":
    main()
