#!/usr/bin/env python3
"""Sort method blocks by name.

Check that each file follows the format:

1. Optional "Requires header", begins "/* Requires:", ends " */", followed by blank line.
2. One or more "Definition blocks", separated by blank lines.
3. Optional trailing text that begins "LibraryItem("

A "Definition block" is:

1. "Definition header", begins [A-Z@+], ends " {", followed by blank line.
2. Optional "Slot list", begins "\t| ", ends " |", followed by blank line.
3. Zero or more "Method blocks", separated by blank lines.

A "Method block" is:

1. "Method header", begins "\t\t", then "Method name", then " {", optional text ending " |".
2. Zero or more "Method body" lines, begin "\t\t\t".
3. "End method", begins "\t\t}"

A "Method name" is:

1. Taken from the beginning of its header line, up to " {".
2. If that segment is a list in square brackets, the first name is used as the sort key.

Sort the "Method blocks" by "Method name".
Do not change any other aspect of the structure.
Only rewrite file if it was out of order.
Ignore files that begin "/* Meta:"
"""

import re
import sys
from typing import List


class FormatError(Exception):
    """File does not match the expected structure."""


def is_meta(line: str) -> bool:
    return line.strip().startswith("/* Meta:")


def is_blank(line: str) -> bool:
    return line.strip() == ""


def is_requires_header(line: str) -> bool:
    s = line.strip()
    return s.startswith("/* Requires:") and s.endswith("*/")


def is_library_item_start(line: str) -> bool:
    return line.lstrip().startswith("LibraryItem(")


def is_slot_line(line: str) -> bool:
    stripped = line.rstrip("\n")
    return stripped.startswith("\t| ") and stripped.endswith(" |")


def get_method_sort_key_from_header(header_line: str) -> str:
    """Extract sort key from a method header line.

    The header line is expected to start with a tab and contain " {".
    The name segment is everything from the first non-whitespace
    character up to " {". If that segment is a bracketed list,
    the first element of the list is used as the key.
    """
    s = header_line.lstrip()
    pos = s.find(" {")
    if pos == -1:
        raise FormatError(f"Method header missing ' {{': {header_line!r}")
    name_seg = s[:pos].strip()
    if name_seg.startswith("[") and name_seg.endswith("]"):
        inner = name_seg[1:-1]
        parts = [p.strip() for p in inner.split(",")]
        if not parts:
            raise FormatError(f"Empty name list in method header: {header_line!r}")
        key = parts[0]
    else:
        key = name_seg
    return key # To sort case-sensitively add .lower()


def parse_method_blocks(method_region: List[str]) -> List[List[str]]:
    """Split the method_region lines into individual method blocks.

    Each block starts with a method header line (indented with a tab
    and containing " {") and ends with a line starting "\t}".
    Trailing blank lines after each block are kept with that block.
    """
    blocks: List[List[str]] = []
    pos = 0
    L = len(method_region)
    while pos < L:
        # Skip blanks before a method
        while pos < L and is_blank(method_region[pos]):
            pos += 1
        if pos >= L:
            break
        start = pos
        header = method_region[start]
        if not header.startswith("\t"):
            raise FormatError(f"Method header must begin with a tab: {header!r}")
        if " {" not in header:
            raise FormatError(f"Method header must contain ' {{': {header!r}")
        pos += 1
        # Consume body until end-of-method line
        while pos < L and not method_region[pos].startswith("\t}"):
            pos += 1
        if pos >= L:
            raise FormatError(
                f"Method starting at {header!r} not closed with '\\t}}'"
            )
        # Include the end-of-method line
        end = pos
        pos += 1
        # Include trailing blanks as part of this block
        while pos < L and is_blank(method_region[pos]):
            end = pos
            pos += 1
        blocks.append(method_region[start:end + 1])
    return blocks


def sort_methods_in_def(def_lines: List[str]) -> List[str]:
    """Validate and sort method blocks within a definition block.

    def_lines contains the lines from the definition header down to and
    including the closing "}" line (but not the blank lines that
    separate this definition from the next one).
    """
    m = len(def_lines)
    if m < 2:
        raise FormatError("Definition block too short")

    header = def_lines[0]
    s = header.lstrip()
    if not s:
        raise FormatError("Empty definition header")
    if not re.match(r"[A-Z@+]", s[0]):
        raise FormatError(
            f"Definition header must start with [A-Z@+]: {header!r}"
        )
    if not s.rstrip("\n").endswith(" {"):
        raise FormatError(
            f"Definition header must end with ' {{': {header!r}"
        )

    # Blank line after header
    if not is_blank(def_lines[1]):
        raise FormatError("Definition header must be followed by blank line")

    j = 2
    slot_present = False
    slot_lines: List[str] = []
    blank_after_slot: str | None = None

    # Optional slot list
    if j < m and is_slot_line(def_lines[j]):
        slot_present = True
        slot_lines.append(def_lines[j])
        if j + 1 >= m:
            raise FormatError("Slot list not followed by blank line")
        if not is_blank(def_lines[j + 1]):
            raise FormatError("Slot list must be followed by blank line")
        blank_after_slot = def_lines[j + 1]
        j += 2

    # Last line must be the definition-closing '}'
    if def_lines[-1].strip() != "}":
        raise FormatError("Definition must end with '}' line")

    # Method region: everything between slot/header section and closing '}'
    method_region = def_lines[j : m - 1]

    # Preserve leading blanks before the first method
    pre_method_blanks: List[str] = []
    pos = 0
    while pos < len(method_region) and is_blank(method_region[pos]):
        pre_method_blanks.append(method_region[pos])
        pos += 1

    blocks = parse_method_blocks(method_region[pos:])

    # Sort blocks by extracted name key
    def block_key(block: List[str]) -> str:
        header_line = block[0]
        return get_method_sort_key_from_header(header_line)

    sorted_blocks = sorted(blocks, key=block_key)

    # Reconstruct definition block
    new_def: List[str] = []
    new_def.append(header)
    new_def.append(def_lines[1])  # blank after header

    if slot_present:
        new_def.extend(slot_lines)
        if blank_after_slot is not None:
            new_def.append(blank_after_slot)

    new_def.extend(pre_method_blanks)

    for block in sorted_blocks:
        new_def.extend(block)

    new_def.append(def_lines[-1])  # closing '}'
    return new_def


def find_def_end(lines: List[str], start: int) -> int:
    """Locate the closing '}' line for a definition starting at index start.

    The definition-closing '}' is expected to be on a line whose
    stripped text is exactly '}' and which does not start with a tab.
    """
    n = len(lines)
    for j in range(start + 1, n):
        if lines[j].strip() == "}" and not lines[j].startswith("\t"):
            return j
    raise FormatError(
        f"Could not find closing '}}' for definition starting at line {start + 1}"
    )


def process_file(path: str) -> None:
    """Process a single file: validate and sort its method blocks in place."""
    try:
        with open(path, "r", encoding="utf-8") as f:
            lines = f.readlines()
    except OSError as e:
        raise FormatError(f"Could not read file: {e}")

    if is_meta(lines[0]):
        return

    new_lines: List[str] = []
    n = len(lines)
    i = 0

    # Preserve leading blank lines
    while i < n and is_blank(lines[i]):
        new_lines.append(lines[i])
        i += 1

    # Optional requires header
    if i < n and is_requires_header(lines[i]):
        new_lines.append(lines[i])
        if i + 1 >= n or not is_blank(lines[i + 1]):
            raise FormatError("Requires header must be followed by blank line")
        new_lines.append(lines[i + 1])
        i += 2

    definitions_count = 0

    # Parse and rewrite definition blocks
    while i < n:
        # Copy blank lines between blocks
        while i < n and is_blank(lines[i]):
            new_lines.append(lines[i])
            i += 1
        if i >= n:
            break

        # Check for beginning of trailing LibraryItem section
        if is_library_item_start(lines[i]):
            break

        # Definition block starting at i
        def_start = i
        def_end = find_def_end(lines, def_start)
        def_lines = lines[def_start : def_end + 1]
        new_def_lines = sort_methods_in_def(def_lines)
        new_lines.extend(new_def_lines)
        i = def_end + 1
        definitions_count += 1

    if definitions_count == 0:
        raise FormatError("No definition blocks found")

    # Trailing text (optional LibraryItem section)
    j = i
    while j < n and is_blank(lines[j]):
        new_lines.append(lines[j])
        j += 1

    if j < n:
        if not is_library_item_start(lines[j]):
            raise FormatError("Trailing text must begin with 'LibraryItem'")
        new_lines.extend(lines[j:])

    # Write back to the file, if edited.
    if not (new_lines == lines):
        print(path)
        new_text = "".join(new_lines)
        try:
            with open(path, "w", encoding="utf-8") as f:
                f.write(new_text)
        except OSError as e:
            raise FormatError(f"Could not write file: {e}")


def main(argv: List[str] | None = None) -> None:
    if argv is None:
        argv = sys.argv[1:]

    if not argv:
        print(f"Usage: {sys.argv[0]} FILE [FILE ...]", file=sys.stderr)
        sys.exit(1)

    for path in argv:
        try:
            process_file(path)
        except FormatError as e:
            print(f"{path}: format error: {e}", file=sys.stderr)
            sys.exit(1)


if __name__ == "__main__":
    main()
