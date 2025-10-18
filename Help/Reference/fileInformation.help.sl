# fileInformation

- _fileInformation(path)_

Answer a `Record` holding information about the named file.
The will be at least entries for _isFile_, _isDirectory_, _size_ and _mtime_.

```
>>> let p = FilePath('/tmp');
>>> let i = p.fileInformation;
>>> (
>>> 	i['isFile'],
>>> 	i['isDirectory'],
>>> 	i['size'].isInteger,
>>> 	i['mtime'].isDate
>>> )
(false, true, true, true)
```

It is an `error` if the file does not exist:

```
>>> {
>>> 	FilePath(
>>> 		'/FileDoesNotExist'
>>> 	).fileInformation
>>> }.hasError
true
```

* * *

See also: directoryExists, fileExists, modificationTime

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileType.html)
[2](https://reference.wolfram.com/language/ref/FileDate.html)
[3](https://reference.wolfram.com/language/ref/FileByteCount.html)
[4](https://reference.wolfram.com/language/ref/FileSize.html)

Categories: Files, System
