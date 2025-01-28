# nextUntil

- _nextUntil(aStream, aBlock:/1)_

Answer a `List` of the next items in _aStream_ for as long as _aBlock_, applied to each item, answers `false`.

```
>>> (1 .. Infinity)
>>> .asStream
>>> .reject(isEven:/1)
>>> .nextUntil { :x |
>>> 	x > 9
>>> }
[1 3 5 7 9 11]
```

* * *

See also: next, nextWhile, takeWhile, Stream

Categories: Accessing
