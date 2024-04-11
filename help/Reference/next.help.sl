# next

- _next(aStream)_
- _next(aStream, anInteger)_

In the unary case, answer the next object accessible by _aStream_.
If the stream is positioned at its end, or if the position is out of bounds in the collection, answer `nil`.

In the binary case, answer the next _anInteger_ number of objects accessible by _aStream_.
If the stream ends before _anInteger_ items are read it is an `error`, see `nextOrUpToEnd`.

```
>>> 1:inf.asStream.reject(isEven:/1).next(5)
[1 3 5 7 9]
```

* * *

See also: atEnd, contents, nextPut, nextUntil, nextWhile, reset, Stream

References:
_Smalltalk_
5.9.2.3
5.9.2.4

Categories: Accessing
