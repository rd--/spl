# isMonotonicallyIncreasing

- _isMonotonicallyIncreasing(aSequence)_

Answers `true` if _aSequence_ is monotonically increasing,
that is if it `isFinite` and `isSortedBy` `<=`.

```
>>> [1 2 3 4].isMonotonicallyIncreasing
true

>>> [1 2 2 3].isMonotonicallyIncreasing
true

>>> [1 2 3 Infinity].isMonotonicallyIncreasing
false

>>> [4 3 2 1].isMonotonicallyIncreasing
false
```

* * *

See also: <=, isFinite, isSortedBy
