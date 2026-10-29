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
    ticked = paragraph[0].strip() == "```" and paragraph[-1].strip() == "```"
    tilded = paragraph[0].strip() == "~~~" and paragraph[-1].strip() == "~~~"
    return ticked or tilded

def is_doctest_block(paragraph: List[str]) -> bool:
    # a doctest block has a second line that begins with '>>'
    if len(paragraph) < 2:
        return False
    second = paragraph[1]
    return second.startswith(">>")

def process_file(path: str) -> None:
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()
    paragraphs = split_into_paragraphs(lines)
    for para in paragraphs:
        if is_code_block(para) and not is_doctest_block(para):
            print(path)

def main(argv: List[str]) -> None:
    if len(argv) < 2:
        print(f"Usage: {argv[0]} FILE [FILE ...]", file=sys.stderr)
        sys.exit(1)
    for fname in argv[1:]:
        process_file(fname)

if __name__ == "__main__":
    main(sys.argv)
