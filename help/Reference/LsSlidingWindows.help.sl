# LsSlidingWindows

- _LsSlidingWindows(aStream, windowSize, stepSize)_

Answer a stream of arrays of _windowSize_ places,
each is a subsequence of _aStream_,
starting _stepSize_ places after the last.

```
>>> LsSlidingWindows(LsSeries(1, 1, 9), 3, 2).upToEnd
[1 2 3; 3 4 5; 5 6 7; 7 8 9]

>>> LsSlidingWindows(LsSeries(1, 1, 9), 3, 4).upToEnd
[1 2 3; 5 6 7]

>>> LsSlidingWindows(LsSeries(1, 1, 9), 3, 3).upToEnd
[1 2 3; 4 5 6; 7 8 9]

>>> LsSlidingWindows(LsSeries(1, 1, inf), 4, 2).next(3)
[1 2 3 4; 3 4 5 6; 5 6 7 8]

>>> LsSlidingWindows(LsSeries(1, 1, 9), 3, 2).equalUpToEndOnReset
true
```

* * *

See also: slidingWindows, windowedReduce
