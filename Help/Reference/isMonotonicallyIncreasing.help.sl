# isMonotonicallyIncreasing

- _isMonotonicallyIncreasing(aSequence)_

Answers `true` if _aSequence_ is monotonically increasing,
that is if it `isFinite` and `isSortedBy` `<=`.

A strictly increasing sequence is also monotonically increasing:

```
>>> [1 2 3 4].isMonotonicallyIncreasing
true

>>> [1 2 3 4].isStrictlyIncreasing
true
```

A monotonically increasing sequence is not necessarily also strictly increasing:

```
>>> [1 2 2 3].isMonotonicallyIncreasing
true

>>> [1 2 2 3].isStrictlyIncreasing
false
```

The sequence must not contain infinities:

```
>>> [1 2 3 Infinity]
>>> .isMonotonicallyIncreasing
false
```

A non increasing sequence:

```
>>> [4 3 2 1].isMonotonicallyIncreasing
false
```

* * *

See also: <=, isFinite, isSortedBy, isStrictlyIncreasing

Guides: Sort Functions
