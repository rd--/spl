# nextWhile

- _nextWhile(s, f:/1)_

Answer a `List` of the next items in the stream _s_ for as long as the block _f_,
applied to each item,
answers `true`.

```
>>> (1 .. Infinity)
>>> .asStream
>>> .reject(isEven:/1)
>>> .nextWhile { :x |
>>> 	x < 11
>>> }
[1 3 5 7 9 11]
```

* * *

See also: next, nextUntil, takeWhile, Stream

Guides: Stream Functions

Categories: Accessing, Stream
