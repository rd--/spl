# endIndex

- _endIndex(aSlice)_

The index of the end of _aSlice_ at the underlying sequence.

```
>>> let s = [1 .. 9].sliceFromTo(3, 7);
>>> (s.endIndex, s.asList, s.size)
(7, [3 .. 7], 5)
```

* * *

See also: startIndex, size, Slice, sliceFromTo

Categories: Accessing
