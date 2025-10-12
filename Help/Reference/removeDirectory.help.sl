# removeDirectory

- _removeDirectory(system, path, allowRecursive)_

Remove the directory at _path_.
If _allowRecursive_ is `true` the directory and all of its contents are removed,
else only the named directory is removed and it must be empty.

```
>>> system.makeDirectory(
>>> 	'/tmp/spl',
>>> 	false,
>>> 	8r755
>>> )
nil

>>> system.removeDirectory(
>>> 	'/tmp/spl',
>>> 	false
>>> )
nil
```

* * *

See also: fetchText, makeDirectory, removeFile, writeTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteDirectory.html)

Categories: Files
