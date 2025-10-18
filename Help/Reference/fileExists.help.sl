# fileExists

- _fileExists(path)_

Answer `true` if there exists an ordinary file named _path_ at the time the method is invoked,
else `false`.

Test for a system file that usually exists:

```
>>> FilePath('/etc/passwd')
>>> .fileExists
true
```

A directory is not an ordinary file:

```
>>> FilePath('/etc')
>>> .fileExists
false
```

At a system file that usually does not exist:

```
>>> FilePath(
>>> 	'/FileDoesNotExist'
>>> ).fileExists
false
```

* * *

See also: directoryExists, fileInformation

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileExistsQ.html)

Categories: Files, System
