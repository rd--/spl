#!/usr/bin/env python3

import sys


def main(argv):
    if len(argv) < 2:
        print(f"Usage: {argv[0]} FILE [FILE ...]", file=sys.stderr)
        sys.exit(1)

    categories = set()

    for filename in argv[1:]:
        try:
            with open(filename, "r", encoding="utf-8") as f:
                for line in f:
                    if line.startswith("Categories: "):
                        rest = line[len("Categories: "):].strip()
                        for part in rest.split(","):
                            item = part.strip()
                            if item:
                                categories.add(item)
        except OSError as e:
            print(f"Error reading {filename}: {e}", file=sys.stderr)

    for item in sorted(categories):
        print(item)


if __name__ == "__main__":
    main(sys.argv)
