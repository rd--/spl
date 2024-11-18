# removeDirectory

- _removeDirectory(aPath, allowRecursive)_

Remove the directory at _aPath_.
If _allowRecursive_ is `true` the directory and all of its contents are removed,
else only the named directory is removed and it must be empty.

```
>>> '/tmp/spl'.makeDirectory(false, 8r755)
nil

>>> '/tmp/spl'.removeDirectory(false)
nil
```

* * *

See also: fetchText, makeDirectory, removeFile, writeTextFile

Guides: File Functions

Categories: Files
