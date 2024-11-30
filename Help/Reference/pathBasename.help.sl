# pathBasename

- _pathBasename(aPath)_

Answer the last component of the `String` _aPath_.

```
>>> '/p/q/r.s'.pathBasename
'r.s'
```

If there is a trailing directory spearator:

```
>>> '/p/q/'.pathBasename
'q'
```

* * *

See also: pathExtension, pathIsAbsolute, pathJoin, pathNormalize

Guides: File Functions

Categories: System
