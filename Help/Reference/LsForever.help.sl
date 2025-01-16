# LsForever

- _LsForever(anObject)_

If _anObject_ is a stream, answer a stream that will reset and continue whenever it ends,
else answer a stream that will answer _anObject_ forever.

```
>>> LsForever(1).next(9)
[1 1 1 1 1 1 1 1 1]

>>> LsForever(LsSeries(1, 1, 3)).next(9)
[1 2 3 1 2 3 1 2 3]
```

* * *

See also: LsConstant, LsOnce

Guides: Patterns and Streams

Categories: Stream
