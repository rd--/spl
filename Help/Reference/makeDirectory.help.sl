# makeDirectory

- _makeDirectory(path, recursive, mode)_

Create a directory at the path _path_.
If _recursive_ is `true` intermediate directories are created.
The integer _mode_ specifies the file mode, ordinarily it is set to 8r755.

```
>>> FilePath('/tmp/spl')
>>> .makeDirectory(
>>> 	false,
>>> 	8r755
>>> )
nil

>>> FilePath('/tmp/spl')
>>> .fileInformation
>>> .at('isDirectory')
true

>>> FilePath('/tmp/spl')
>>> .removeDirectory(false)
nil
```

* * *

See also: directoryExists, fetchText, fileInformation, removeDirectory, writeTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CreateDirectory.html)

Categories: Files
