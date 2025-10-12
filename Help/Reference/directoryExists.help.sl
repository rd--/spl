# directoryExists

- _directoryExists(system, path)_

Answer `true` if there exists an directory named _path_ at the time the method is invoked,
else `false`.

On a Unix-like system directory the _etc_ directory usually exists:

```
>>> system.directoryExists('/etc')
true
```

An ordinary file is not a directory:

```
>>> system.directoryExists('/etc/passwd')
false
```

A directory that usually does not exist:

```
>>> system.directoryExists(
>>> 	'/DirectoryDoesNotExist'
>>> )
false
```

* * *

See also: fileExists, fileInformation

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirectoryQ.html)

Categories: Files, System
