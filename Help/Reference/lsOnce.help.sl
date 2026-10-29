# lsOnce

- _lsOnce(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ once and then end.

```
>>> lsOnce(1).upToEnd
[1]

>>> lsOnce(lsSeries(1, 1, 3)).upToEnd
[1 2 3]
```

* * *

See also: lsConstant, lsForever

Guides: Patterns and Streams

Categories: Stream
