# removeFile

- _removeFile(aPath)_

Remove the file at _aPath_.
Signal an `error` if no such file exists,
or if exists but cannot be removed.
Removes ordinary files only,
see `removeDirectory` to remove a directory.

```
>>> '/tmp/spl.text'.writeTextFile('Sᴘʟ')
nil

>>> '/tmp/spl.text'.removeFile
nil
```

* * *

See also: fetchText, makeDirectory, removeDirectory, writeTextFile

Guides: File Functions

Categories: Files
