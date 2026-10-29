# lsForever

- _lsForever(anObject)_

If _anObject_ is a stream, answer a stream that will reset and continue whenever it ends,
else answer a stream that will answer _anObject_ forever.

```
>>> lsForever(1).next(9)
[1 1 1 1 1 1 1 1 1]

>>> lsForever(lsSeries(1, 1, 3)).next(9)
[1 2 3 1 2 3 1 2 3]
```

* * *

See also: lsConstant, lsOnce

Guides: Patterns and Streams

Categories: Stream
