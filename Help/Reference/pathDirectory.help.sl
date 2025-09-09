# pathDirectory

- _pathDirectory(p)_

Answer the directory component of the filename path _p_.

```
>>> '/p/q/r.s'.pathDirectory
'/p/q'
```

If there is no directory, answers a full stop:

```
>>> 'r.s'.pathDirectory
'.'
```

* * *

See also: pathBasename, pathExtension, pathIsAbsolute, pathJoin, pathNormalize

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirectoryName.html)

Categories: System
