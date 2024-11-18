# fileInformation

- _fileInformation(aPath | aUrl)_

Answer a `Record` holding information about the named file.
The will be at least entries for _isFile_, _isDirectory_, _size_ and _mtime_.

```
>>> let x = '/tmp'.fileInformation;
>>> (x::isFile, x::isDirectory, x::size.isInteger, x::mtime.isDate)
(false, true, true, true)
```

* * *

See also: modificationTime

Guides: File Functions

Categories: System
