# removeFile

- _removeFile(path)_

Remove the file at _path_.
Signal an `error` if no such file exists,
or if it exists but cannot be removed.
Removes ordinary files only,
see `removeDirectory` to remove a directory.

```
>>> FilePath('/tmp/spl.text')
>>> .writeTextFile('Sᴘʟ')
nil

>>> FilePath('/tmp/spl.text')
>>> .fileExists
true

>>> FilePath('/tmp/spl.text')
>>> .removeFile
nil

>>> FilePath('/tmp/spl.text')
>>> .fileExists
false
```

* * *

See also: fetchText, makeDirectory, removeDirectory, writeTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteFile.html)

Categories: Files
