# next

- _next(s)_
- _next(s, n)_

In the unary case, answer the next object accessible by the stream _s_.
If the stream is positioned at its end, or if the position is out of bounds in the collection, answer `nil`.

In the binary case, answer the next _n_ number of objects accessible by _s_.
If the stream ends before _n_ items are read it is an `error`, see `nextOrUpToEnd`.

At an infinite stream:

```
>>> (1 .. Infinity).asStream
>>> .reject(isEven:/1)
>>> .next(5)
[1 3 5 7 9]
```

At a random number generator,
which is likewise an infinite stream:

```
>>> Sfc32(367214)
>>> .next(5)
[
	0.123869952745736
	0.782355992356315
	0.117176339263096
	0.701100001111627
	0.140467990655452
]
```

* * *

See also: atEnd, contents, nextOrUpToEnd, nextPut, nextSatisfy, nextUntil, nextWhile, reset, Stream

Guides: Stream Functions

References:
_Python_
[1](https://docs.python.org/3/library/functions.html#next),
_Smalltalk_
5.9.2.3
5.9.2.4

Categories: Accessing, Stream
