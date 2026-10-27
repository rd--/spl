#!/usr/bin/env python3

import sys
import string
from typing import List

PREFIX = "See also: "


def classify_token(token: str) -> int:
    """Return group index for sorting.

    0: capitalised words (e.g. "Integer", "Float")
    1: punctuation-only tokens (e.g. "+", "-")
    2: everything else (e.g. "minus", "plus")
    """
    if token and token[0].isupper() and token.isalpha():
        # Capitalised word: first letter uppercase, all letters
        return 0
    if token and all(c in string.punctuation for c in token):
        # Punctuation-only token
        return 1
    # Un-capitalised / other tokens
    return 2


def sort_tokens(tokens: List[str]) -> List[str]:
    # Sort by (group, lexicographic value)
    return sorted(tokens, key=lambda t: (classify_token(t), t))


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

        # Split on ", " as specified and strip each token
        tokens = [tok.strip() for tok in content.split(", ") if tok.strip()]

        if not tokens:
            continue

        sorted_tokens = sort_tokens(tokens)
        if tokens != sorted_tokens:
            modified = True
            new_line_body = ", ".join(sorted_tokens)
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
