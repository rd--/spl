# pathBasename

- _pathBasename(path)_

Answer the last component of _path_.
Components are ordinarily separated by _solidus_ characters.

```
>>> '/p/q/r.s'
>>> .pathBasename
'r.s'
```

If there is a trailing directory separator:

```
>>> '/p/q/'
>>> .pathBasename
'q'
```

* * *

See also: pathExtension, pathIsAbsolute, pathJoin, pathNormalize

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileBaseName.html)
[2](https://reference.wolfram.com/language/ref/FileNameTake.html),
_W_
[1](https://en.wikipedia.org/wiki/Basename)

Categories: System
