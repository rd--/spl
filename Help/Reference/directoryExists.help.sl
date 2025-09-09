# directoryExists

- _directoryExists(p)_

Answer `true` if there exists an directory named _p_ at the time the method is invoked,
else `false`.

At a system directory usually exists:

```
>>> '/etc'.directoryExists
true
```

An ordinary file is not a directory:

```
>>> '/etc/passwd'.directoryExists
false
```

At a system directory that usually does not exist:

```
>>> '/DirectoryDoesNotExist'.directoryExists
false
```

* * *

See also: fileExists, fileInformation

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirectoryQ.html)

Categories: Files, System
