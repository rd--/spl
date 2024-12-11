# nextOrUpToEnd

- _nextOrUpToEnd(aStream, anInteger)_

Answer at most the next _anInteger_ number of objects accessible by _aStream_.
If the stream ends, the answer will contain fewer items than requested.

```
>>> 1:7.asStream
>>> .reject(isEven:/1)
>>> .nextOrUpToEnd(5)
[1 3 5 7]
```

_Note:_
Squeak calls this _take_.
However _take_ is defined at _Collection_,
and should answer a value of the same type, here a stream.

* * *

See also: contents, next, reset, Stream, take

Categories: Accessing
