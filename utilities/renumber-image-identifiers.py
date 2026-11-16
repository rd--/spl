#!/usr/bin/env python3
import sys
import re


def process_file(path: str) -> None:
    try:
        with open(path, "r", encoding="utf-8") as f:
            lines = f.readlines()
    except OSError as e:
        print(f"{path}: cannot read ({e})", file=sys.stderr)
        return

    image_blocks = []
    i = 0
    n_lines = len(lines)

    # Scan for code blocks starting with "~~~"
    while i < n_lines:
        line = lines[i]
        if line.startswith("~~~"):
            start = i

            # Parse properties on the first line of the block, after "~~~"
            property_text = line[3:].strip()
            image_keys = {}  # key -> id (svg / png)

            if property_text:
                tokens = property_text.split()
                for tok in tokens:
                    if "=" in tok:
                        key, val = tok.split("=", 1)
                        if key in ("svg", "png"):
                            image_keys[key] = val

            # Find the end of the block (line containing only "~~~")
            j = i + 1
            while j < n_lines and lines[j].strip() != "~~~":
                j += 1
            if j >= n_lines:
                # Unterminated block; stop scanning
                break

            # If there is at least one image type property, this is an image code block
            ref_index = None
            ref_id = None

            if image_keys:
                # Find the first non-empty line after the block as the potential image reference
                k = j + 1
                while k < n_lines and lines[k].strip() == "":
                    k += 1

                if k < n_lines and lines[k].lstrip().startswith("!["):
                    ref_index = k
                    ref_line = lines[ref_index]

                    # Image reference: begins "![", ends "-N.typ)"
                    m = re.search(
                        r"-(?P<id>[A-Z]|\d{3})\.(?P<typ>svg|png)\)$",
                        ref_line,
                    )
                    if m:
                        ref_id = m.group("id")

                image_blocks.append(
                    {
                        "start": start,
                        "end": j,
                        "image_keys": image_keys,
                        "ref_index": ref_index,
                        "ref_id": ref_id,
                    }
                )

            # Skip to first line after this code block
            i = j + 1
        else:
            i += 1

    n = len(image_blocks)
    if n == 0:
        # No image code blocks: nothing to do
        return

    if n > 999:
        # Specification only allows 001–999
        print(f"{path}: more than 999 image code blocks; not modified", file=sys.stderr)
        return

    # Compute canonical IDs per block and check consistency between properties and reference
    canonical_ids = []
    sequence_ok = True

    for block in image_blocks:
        ids = set(block["image_keys"].values())
        if block["ref_id"]:
            ids.add(block["ref_id"])

        if len(ids) == 1:
            canonical_id = ids.pop()
            canonical_ids.append(canonical_id)
        else:
            canonical_ids.append(None)
            sequence_ok = False  # conflicting IDs within the same block

    # Determine the desired identifier sequence for this file
    if n <= 26:
        expected_ids = [chr(ord("A") + k) for k in range(n)]  # A, B, C, ...
    else:
        expected_ids = [f"{k + 1:03d}" for k in range(n)]  # 001, 002, ...

    # Check if current canonical IDs already match the desired sequence
    if sequence_ok and all(cid is not None for cid in canonical_ids):
        if canonical_ids == expected_ids:
            # Already in sequence: do not modify or print file name
            return
        else:
            sequence_ok = False

    # Rewrite IDs if not already in sequence
    changed = False
    for idx, block in enumerate(image_blocks):
        new_id = expected_ids[idx]

        # Rewrite image type properties on the block's first line
        start = block["start"]
        line = lines[start]
        for key, old_id in block["image_keys"].items():
            old = f"{key}={old_id}"
            new = f"{key}={new_id}"
            line = line.replace(old, new, 1)
        lines[start] = line

        # Rewrite the image reference line (the first non-empty paragraph after the block)
        ref_index = block["ref_index"]
        if ref_index is not None:
            ref_line = lines[ref_index]
            ref_line = re.sub(
                r"-(?:[A-Z]|\d{3})\.(svg|png)\)$",
                lambda m: f"-{new_id}.{m.group(1)})",
                ref_line,
            )
            lines[ref_index] = ref_line

        changed = True

    if not changed:
        return

    # Print the filename and write the updated contents back
    print(path)
    try:
        with open(path, "w", encoding="utf-8") as f:
            f.writelines(lines)
    except OSError as e:
        print(f"{path}: cannot write ({e})", file=sys.stderr)


def main() -> None:
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} FILE...", file=sys.stderr)
        sys.exit(1)

    for path in sys.argv[1:]:
        process_file(path)


if __name__ == "__main__":
    main()
