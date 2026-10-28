#!/usr/bin/env python3

import os
import sys
import re
import string
from typing import Dict, List, Tuple


def load_replacements(path: str) -> List[Tuple[str, str]]:
    """Load word replacement pairs from a file.

    Each non-empty, non-comment line should contain two whitespace-separated
    tokens: old new
    """
    replacements: List[Tuple[str, str]] = []
    try:
        with open(path, "r", encoding="utf-8") as f:
            for line in f:
                stripped = line.strip()
                if not stripped or stripped.startswith("#"):
                    continue
                parts = stripped.split()
                if len(parts) != 2:
                    continue
                old, new = parts
                replacements.append((old, new))
    except OSError as e:
        print(f"Error reading replacement list '{path}': {e}", file=sys.stderr)
        sys.exit(1)
    return replacements


def build_pattern(old: str, punct_class: str) -> re.Pattern:
    """Build a regex pattern for a free-standing occurrence of 'old'.

    Free-standing means:
    - at start of line, or preceded by whitespace, '.' or '_' or '`' or '(' '['
    - and followed by whitespace, any punctuation, or end of line
    """
    escaped_old = re.escape(old)
    pattern = rf"(^|(?<=[\s._`(\[]))({escaped_old})(?=(\s|[{punct_class}]|$))"
    return re.compile(pattern)


def process_content(content: str, replacements: List[Tuple[str, str]]) -> str:
    """Apply all replacements to the given file content."""
    if not replacements:
        return content

    punct_class = re.escape(string.punctuation)
    patterns: List[Tuple[re.Pattern, str]] = [
        (build_pattern(old, punct_class), new) for old, new in replacements
    ]

    lines = content.splitlines(keepends=True)
    new_lines: List[str] = []

    for line in lines:
        new_line = line
        for pattern, new in patterns:
            # Preserve the leading boundary (group 1) and replace the word (group 2)
            new_line = pattern.sub(lambda m, repl=new: m.group(1) + repl, new_line)
        new_lines.append(new_line)

    return "".join(new_lines)


def maybe_rename_file(path: str, replacements: List[Tuple[str, str]]) -> str:
    """Rename the file if its base name is one of the old spellings.

    The base name is taken as the file name up to the first '.'.
    Example: 'SinOsc.help.sl' -> base name 'SinOsc'.
    """
    if not replacements:
        return path

    repl_map: Dict[str, str] = {old: new for old, new in replacements}

    directory, filename = os.path.split(path)
    if not filename:
        return path

    base, rest = (filename.split(".", 1) + [""])[0:2]
    suffix = f".{rest}" if rest else ""

    if base in repl_map:
        new_base = repl_map[base]
        new_filename = new_base + suffix
        new_path = os.path.join(directory, new_filename)

        if new_path != path:
            try:
                os.rename(path, new_path)
                return new_path
            except OSError as e:
                print(f"Error renaming '{path}' to '{new_path}': {e}", file=sys.stderr)
                # If rename fails, keep the original path
                return path

    return path


def process_file(path: str, replacements: List[Tuple[str, str]]) -> None:
    """Process a single target file: replace words and maybe rename it."""
    try:
        with open(path, "r", encoding="utf-8") as f:
            original_content = f.read()
    except OSError as e:
        print(f"Error reading file '{path}': {e}", file=sys.stderr)
        return

    new_content = process_content(original_content, replacements)
    content_changed = new_content != original_content

    if content_changed:
        try:
            with open(path, "w", encoding="utf-8") as f:
                f.write(new_content)
        except OSError as e:
            print(f"Error writing file '{path}': {e}", file=sys.stderr)
            return

    # Possibly rename the file based on its base name
    new_path = maybe_rename_file(path, replacements)
    renamed = new_path != path

    if content_changed or renamed:
        print(new_path)


def main(argv: List[str]) -> None:
    if len(argv) < 3:
        print(
            "Usage: word_replacer.py <word_list_file> <target_file1> [<target_file2> ...]",
            file=sys.stderr,
        )
        sys.exit(1)

    word_list_path = argv[1]
    target_files = argv[2:]

    replacements = load_replacements(word_list_path)

    for path in target_files:
        process_file(path, replacements)


if __name__ == "__main__":  # pragma: no cover
    main(sys.argv)
