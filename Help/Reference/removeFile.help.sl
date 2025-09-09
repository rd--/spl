# removeFile

- _removeFile(p)_

Remove the file at the path _p_.
Signal an `error` if no such file exists,
or if it exists but cannot be removed.
Removes ordinary files only,
see `removeDirectory` to remove a directory.

```
>>> '/tmp/spl.text'.writeTextFile('Sᴘʟ')
nil

>>> '/tmp/spl.text'.fileExists
true

>>> '/tmp/spl.text'.removeFile
nil

>>> '/tmp/spl.text'.fileExists
false
```

* * *

See also: fetchText, makeDirectory, removeDirectory, writeTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteFile.html)

Categories: Files
