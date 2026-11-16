#!/usr/bin/env python3

import argparse
import pathlib
import re

Allowed_Name = re.compile(r'^# [A-Za-z][A-Za-z0-9!]*$')
Allowed_Token = re.compile(r'^# [!#$%&*+\-/<=>?@\\^|~"\'(),:;.\[\]_`{}]+ \([A-Za-z…]+\)$')

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Check reference names."
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
        if not Allowed_Name.match(lines[0]) and not Allowed_Token.match(lines[0]):
            print(path)

if __name__ == "__main__":
    main()
