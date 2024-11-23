# asScale

- _asScale(aList)_

Answer a `Scale` given _aList_ of intervals.
The _startIndex_ is set to `one` and the description is set to 'Undescribed scale'.

```
>>> [2 2 1 2 2 2 1].asScale.tuningIndices
[1 3 5 6 8 10 12]

>>> [2 1 2 2 1 2 2].asScale.tuningIndices
[1 3 4 6 8 9 11]
```

* * *

See also: Scale, tuningIndices

Categories: Converting
