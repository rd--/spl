# makeDirectory

- _makeDirectory(p, allowRecursive, fileMode)_

Create a directory at the path _p_.
If _allowRecursive_ is `true` intermediate directories are created.
_fileMode_ specifies the file mode, ordinarily it is set to 8r755.

```
>>> '/tmp/spl'.makeDirectory(false, 8r755)
nil

>>> '/tmp/spl'.fileInformation['isDirectory']
true

>>> '/tmp/spl'.removeDirectory(false)
nil
```

* * *

See also: directoryExists, fetchText, fileInformation, removeDirectory, writeTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CreateDirectory.html)

Categories: Files
