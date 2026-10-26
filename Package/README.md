# Package

This directory contains the Spl library files,
organised into categories.

Each file is a `Package`.
Each uncategorised package name must be unique.

Compilation of _.sl_ package files to _.js_ is slow.
Loading compiled (_.js_) files is fast.

The files at `Package/Meta` are not ordinary package files.
They are rather programs that load sets of packages.
