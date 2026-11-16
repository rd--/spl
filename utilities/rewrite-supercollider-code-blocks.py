#!/usr/bin/env python3

import sys
from typing import List


def split_into_paragraphs(lines: List[str]) -> List[List[str]]:
    paragraphs: List[List[str]] = []
    current: List[str] = []

    for line in lines:
        if line.strip() == "":
            if current:
                paragraphs.append(current)
                current = []
            # keep blank line as its own block
            paragraphs.append([line])
        else:
            current.append(line)

    if current:
        paragraphs.append(current)

    return paragraphs


def is_code_block(paragraph: List[str]) -> bool:
    if len(paragraph) < 2:
        return False
    return paragraph[0].strip() == "```" and paragraph[-1].strip() == "```"


def is_doctest_block(paragraph: List[str]) -> bool:
    # a doctest block has a second line that begins with '>>'
    if len(paragraph) < 2:
        return False
    second = paragraph[1]
    return second.startswith(">>")


def replace_delimiters(paragraph: List[str], label: str) -> List[str]:
    start_line = paragraph[0]
    end_line = paragraph[-1]

    # preserve original newline style
    def newline_of(line: str) -> str:
        if line.endswith("\r\n"):
            return "\r\n"
        if line.endswith("\n"):
            return "\n"
        return ""

    start_nl = newline_of(start_line)
    end_nl = newline_of(end_line)

    new_start = f"~~~spl syn={label}{start_nl}"
    new_end = f"~~~{end_nl}"

    return [new_start] + paragraph[1:-1] + [new_end]


def label_for_index(idx: int) -> str:
    # idx is 0-based; A, B, C, ... Z, then AA, AB, ... if needed
    letters = []
    idx_local = idx
    while True:
        letters.append(chr(ord('A') + (idx_local % 26)))
        idx_local //= 26
        if idx_local == 0:
            break
        idx_local -= 1
    return "".join(reversed(letters))


def process_file(path: str) -> None:
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    paragraphs = split_into_paragraphs(lines)

    block_index = 0
    new_paragraphs: List[List[str]] = []

    for para in paragraphs:
        if is_code_block(para) and not is_doctest_block(para):
            label = label_for_index(block_index)
            block_index += 1
            new_paragraphs.append(replace_delimiters(para, label))
        else:
            new_paragraphs.append(para)

    new_lines: List[str] = []
    for para in new_paragraphs:
        new_lines.extend(para)

    if block_index > 0:
        print(path)

    with open(path, "w", encoding="utf-8") as f:
        f.writelines(new_lines)


def main(argv: List[str]) -> None:
    if len(argv) < 2:
        print(f"Usage: {argv[0]} FILE [FILE ...]", file=sys.stderr)
        sys.exit(1)

    for fname in argv[1:]:
        process_file(fname)


if __name__ == "__main__":
    main(sys.argv)
