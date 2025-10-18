# removeDirectory

- _removeDirectory(path, recursive)_

Remove the directory at _path_.
If _recursive_ is `true` the directory and all of its contents are removed,
else only the named directory is removed and it must be empty.

```
>>> FilePath('/tmp/spl')
>>> .makeDirectory(
>>> 	false,
>>> 	8r755
>>> )
nil

>>> FilePath('/tmp/spl')
>>> .removeDirectory(false)
nil
```

* * *

See also: fetchText, makeDirectory, removeFile, writeTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteDirectory.html)

Categories: Files
