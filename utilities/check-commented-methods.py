#!/usr/bin/env python3

import argparse
import pathlib
import re

Disallowed_Comment = re.compile(r'^\t/\*$')

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Check commented methods."
    )
    parser.add_argument("files", nargs="+", type=pathlib.Path)
    args = parser.parse_args()
    for path in args.files:
        try:
            text = path.read_bytes().decode("utf-8")
            lines = text.splitlines()
        except OSError:
            print(path)
            continue
        if any(Disallowed_Comment.match(x) for x in lines):
            print(path)

if __name__ == "__main__":
    main()
