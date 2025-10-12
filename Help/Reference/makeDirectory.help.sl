# makeDirectory

- _makeDirectory(system, path, allowRecursive, fileMode)_

Create a directory at the path _path_.
If _allowRecursive_ is `true` intermediate directories are created.
_fileMode_ specifies the file mode, ordinarily it is set to 8r755.

```
>>> system.makeDirectory(
>>> 	'/tmp/spl',
>>> 	false,
>>> 	8r755
>>> )
nil

>>> system.fileInformation('/tmp/spl')
>>> .at('isDirectory')
true

>>> system.removeDirectory(
>>> 	'/tmp/spl',
>>> 	false
>>> )
nil
```

* * *

See also: directoryExists, fetchText, fileInformation, removeDirectory, writeTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CreateDirectory.html)

Categories: Files
