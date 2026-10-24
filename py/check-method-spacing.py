#!/usr/bin/env python3

import argparse
import pathlib
import re

Forbidden_Next_Line = re.compile(r"^\t(?:[A-Za-z\[])")

def forbidden_lines(text: str) -> list[int]:
    lines = text.splitlines()
    return [
        line_number + 1
        for line_number, (current, following) in enumerate(zip(lines, lines[1:]), 1)
        if current.endswith("}") and Forbidden_Next_Line.match(following)
    ]

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Check method spacing."
    )
    parser.add_argument("-v", "--verbose", action="store_true", help="print line numbers")
    parser.add_argument("files", nargs="+", type=pathlib.Path)
    args = parser.parse_args()
    for path in args.files:
        try:
            data = path.read_bytes()
            lines = forbidden_lines(data.decode("utf-8"))
        except OSError:
            print(path)
            continue
        if lines:
            if args.verbose:
                for line_number in lines:
                    print(f"{path}: line {line_number}")
            else:
                print(path)

if __name__ == "__main__":
    main()
