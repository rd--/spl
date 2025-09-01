# nextOrUpToEnd

- _nextOrUpToEnd(s, n)_

Answer at most the next _n_ number of objects accessible by the stream _s_.
If the stream ends, the answer will contain fewer items than requested.

```
>>> 1:7.asStream
>>> .reject(isEven:/1)
>>> .nextOrUpToEnd(5)
[1 3 5 7]
```

_Note:_
Squeak calls this `take`,
however `take` is defined at `Collection`,
and should answer a value of the same type, here a stream.

* * *

See also: contents, next, reset, Stream, take

Guides: Stream Functions

Categories: Accessing
