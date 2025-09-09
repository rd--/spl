# fileExists

- _fileExists(p)_

Answer `true` if there exists an ordinary file named _p_ at the time the method is invoked,
else `false`.

At a system file that usually exists:

```
>>> '/etc/passwd'.fileExists
true
```

A directory is not an ordinary file:

```
>>> '/etc'.fileExists
false
```

At a system file that usually does not exist:

```
>>> '/FileDoesNotExist'.fileExists
false
```

* * *

See also: directoryExists, fileInformation

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileExistsQ.html)

Categories: Files, System
