# pathJoin

- _pathJoin(aList)_

Join a `List` of `String` together as a file path.

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

See also: pathDirectory, pathExtension, pathIsAbsolute, pathNormalize

Guides: File Functions

Categories: System
