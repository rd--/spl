# pathDirectory

- _pathDirectory(aPath)_

Answer the directory component of the `String` _aPath_.

```
>>> '/p/q/r.s'.pathDirectory
'/p/q'
```

If there is no directory:

```
>>> 'r.s'.pathDirectory
'.'
```

* * *

See also: pathBasename, pathExtension, pathIsAbsolute, pathJoin, pathNormalize

Guides: File Functions

Categories: System
