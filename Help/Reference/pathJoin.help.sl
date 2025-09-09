# pathJoin

- _pathJoin([p₁ p₂ …])_

Join a `List` of `String` items together as a file path.

```
>>> ['/p', 'q', 'r.s'].pathJoin
'/p/q/r.s'
```

The empty path:

```
>>> [].pathJoin
'.'
```

* * *

See also: pathBasename, pathDirectory, pathExtension, pathIsAbsolute, pathNormalize

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileNameJoin.html)

Categories: System
