# makeDirectory

- _makeDirectory(aPath, allowRecursive, fileMode)_

Create a directory at _aPath_.
If _allowRecursive_ is `true` intermediate directories are created.
_fileMode_ specifies the file mode, ordinarily it is set to 8r755.

```
>>> '/tmp/spl'.makeDirectory(false, 8r755)
nil

>>> '/tmp/spl'.fileInformation::isDirectory
true

>>> '/tmp/spl'.removeDirectory(false)
nil
```

* * *

See also: fetchText, removeDirectory, writeTextFile

Guides: File Functions

Categories: Files
