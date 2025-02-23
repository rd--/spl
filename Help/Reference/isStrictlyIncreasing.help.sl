# isStrictlyIncreasing

- _isStrictlyIncreasing(aSequence)_

Answers `true` if _aSequence_ is strictly increasing,
that is if it `isFinite` and `isSortedBy` `<`.

```
>>> [1 2 3 4].isStrictlyIncreasing
true

>>> [1 2 2 3].isStrictlyIncreasing
false

>>> [1 2 3 Infinity].isStrictlyIncreasing
false

>>> [4 3 2 1].isStrictlyIncreasing
false
```

* * *

See also: <, isFinite, isMonotonicallyIncreasing, isSortedBy
