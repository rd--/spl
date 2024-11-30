# nextWhile

- _nextWhile(aStream, aBlock:/1)_

Answer a `List` of the next items in _aStream_ for as long as _aBlock_, applied to each item, answers `true`.

```
>>> let s = 1:inf.asStream.reject(isEven:/1);
>>> s.nextWhile { :x | x < 11 }
[1 3 5 7 9 11]
```

* * *

See also: next, nextUntil, takeWhile, Stream

Categories: Accessing, Stream
