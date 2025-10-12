# removeFile

- _removeFile(system, path)_

Remove the file at _path_.
Signal an `error` if no such file exists,
or if it exists but cannot be removed.
Removes ordinary files only,
see `removeDirectory` to remove a directory.

```
>>> system.writeTextFile(
>>> 	'/tmp/spl.text',
>>> 	'Sᴘʟ'
>>> )
nil

>>> system.fileExists('/tmp/spl.text')
true

>>> system.removeFile('/tmp/spl.text')
nil

>>> system.fileExists('/tmp/spl.text')
false
```

* * *

See also: fetchText, makeDirectory, removeDirectory, writeTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteFile.html)

Categories: Files
