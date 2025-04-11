# atAllPin

- _atAllPin(aSequence, anotherSequence)_

Answer the elements of _aSeqence_ at each _index_ in _anotherSequence_ if possible.
Answer the first or last element if _index_ is out of bounds.

```
>>> [1 .. 5].atAllPin([-1 .. 9])
[1 1 1 2 3 4 5 5 5 5 5]
```

* * *

See also: at, atAll, atAllWrap, atFold, atPin, atWrap, clip

Categories: Accessing
