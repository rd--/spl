# directoryExists

- _directoryExists(path)_

Answer `true` if there exists an directory named _path_ at the time the method is invoked,
else `false`.

On a Unix-like system directory the _etc_ directory usually exists:

```
>>> FilePath('/etc')
>>> .directoryExists
true
```

An ordinary file is not a directory:

```
>>> FilePath('/etc/passwd')
>>> .directoryExists
false
```

A directory that usually does not exist:

```
>>> FilePath(
>>> 	'/DirectoryDoesNotExist'
>>> ).directoryExists
false
```

* * *

See also: fileExists, fileInformation

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirectoryQ.html)

Categories: Files, System
