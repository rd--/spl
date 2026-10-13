# pathBaseName

- _pathBaseName(p)_

Answer the last component of path _p_.
Components are ordinarily separated by _solidus_ characters.

```
>>> '/p/q/r.s'
>>> .pathBaseName
'r.s'
```

If there is a trailing directory separator:

```
>>> '/p/q/'
>>> .pathBaseName
'q'
```

* * *

See also: pathExtension, pathIsAbsolute, pathJoin, pathNormalize, pathStem

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileBaseName.html)
[2](https://reference.wolfram.com/language/ref/FileNameTake.html),
_W_
[1](https://en.wikipedia.org/wiki/BaseName)

Categories: System
