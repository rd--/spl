# modificationTime

- _modificationTime(p)_

Answer the modification time of the filename path _p_ as milliseconds since the Unix epoch.

```
>>> '/tmp'.modificationTime > 0
true
```

If _p_ does not exist, the modification time will be reported as `zero`.

```
>>> '/DirectoryDoesNotExist'
>>> .modificationTime
0
```

* * *

See also: fileInformation

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileDate.html)

Categories: System
