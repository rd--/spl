# startIndex

- _startIndex(aSlice)_

The index of the start of _aSlice_ at the underlying sequence.

```
>>> let s = [1 .. 9].sliceFromTo(3, 7);
>>> (s.startIndex, s.asList, s.size)
(3, [3 .. 7], 5)
```

* * *

See also: endIndex, size, Slice, sliceFromTo

Categories: Accessing
