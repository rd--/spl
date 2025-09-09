# removeDirectory

- _removeDirectory(p, allowRecursive)_

Remove the directory at the path _p_.
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

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteDirectory.html)

Categories: Files
