# pathBasename

- _pathBasename(aPath)_

Answer the last component of the `String` _aPath_.
Components are ordinarily separated by _solidus_ characters.

```
>>> '/p/q/r.s'.pathBasename
'r.s'
```

If there is a trailing directory separator:

```
>>> '/p/q/'.pathBasename
'q'
```

* * *

See also: pathExtension, pathIsAbsolute, pathJoin, pathNormalize

Guides: File Functions

Categories: System
