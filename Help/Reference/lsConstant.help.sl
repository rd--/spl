# lsConstant

- _lsConstant(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ forever.

```
>>> lsConstant(1).next(3)
[1 1 1]

>>> lsConstant(lsSeries(1, 1, 3)).upToEnd
[1 2 3]
```

* * *

See also: lsForever, lsOnce

Guides: Patterns and Streams

Categories: Stream
