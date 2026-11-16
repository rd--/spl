#!/usr/bin/env python3

import sys
from typing import List

PREFIX = "Guides: "


def sort_phrases(phrases: List[str]) -> List[str]:
    # Simple lexicographic (alphabetical) sort
    return sorted(phrases)


def process_file(path: str) -> bool:
    """Process a single file.

    Returns True if the file was modified.
    """
    try:
        with open(path, "r", encoding="utf-8") as f:
            lines = f.readlines()
    except OSError as e:
        print(f"Error reading {path}: {e}", file=sys.stderr)
        return False

    modified = False

    for i, line in enumerate(lines):
        if not line.startswith(PREFIX):
            continue

        has_newline = line.endswith("\n")
        content = line[len(PREFIX):].rstrip("\n")

        # Split on ", " and strip each phrase
        phrases = [p.strip() for p in content.split(", ") if p.strip()]

        if not phrases:
            continue

        sorted_phrases = sort_phrases(phrases)
        if phrases != sorted_phrases:
            modified = True
            new_line_body = ", ".join(sorted_phrases)
            new_line = PREFIX + new_line_body + ("\n" if has_newline else "")
            lines[i] = new_line

    if modified:
        try:
            with open(path, "w", encoding="utf-8") as f:
                f.writelines(lines)
        except OSError as e:
            print(f"Error writing {path}: {e}", file=sys.stderr)
            return False

    return modified


def main() -> None:
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <file> [<file> ...]")
        sys.exit(1)

    for path in sys.argv[1:]:
        if process_file(path):
            print(path)


if __name__ == "__main__":
    main()
