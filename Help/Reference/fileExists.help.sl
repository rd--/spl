# fileExists

- _fileExists(system, path)_

Answer `true` if there exists an ordinary file named _path_ at the time the method is invoked,
else `false`.

Test for a system file that usually exists:

```
>>> system.fileExists('/etc/passwd')
true
```

A directory is not an ordinary file:

```
>>> system.fileExists('/etc')
false
```

At a system file that usually does not exist:

```
>>> system.fileExists(
>>> 	'/FileDoesNotExist'
>>> )
false
```

* * *

See also: directoryExists, fileInformation

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileExistsQ.html)

Categories: Files, System
