#!/usr/bin/env python3

import os
import sys


def find_non_unique_within_dirs(root_dir: str):
    for dirpath, dirnames, filenames in os.walk(root_dir):
        # Map lowercased file name to list of original names in this directory
        name_map = {}
        for filename in sorted(filenames):
            key = filename.lower()
            name_map.setdefault(key, []).append(filename)

        # For this directory, print files whose names are not unique ignoring case
        for key, names in name_map.items():
            if len(names) > 1:
                for name in names:
                    print(f"{dirpath}/{name}")


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <directory>")
        sys.exit(1)

    root_dir = sys.argv[1]

    if not os.path.isdir(root_dir):
        print(f"Error: '{root_dir}' is not a directory or does not exist.")
        sys.exit(1)

    find_non_unique_within_dirs(root_dir)


if __name__ == "__main__":
    main()
