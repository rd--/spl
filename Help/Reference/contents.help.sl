# contents

- _contents(x)_

Answer the contents of _x_,
ordinarily a `Stream`.

At `CollectionStream`:

```
>>> Stream[1 2 3].contents
[1 2 3]
```

At `Box`:

```
>>> Box(23).contents
23
```

* * *

See also: List, Stream, join, next, reset, splitOn, stringList

Guides: Stream Functions

References:
_Smalltalk_
5.9.1.2

Categories: Accessing, String
