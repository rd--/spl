# isStrictlyIncreasing

- _isStrictlyIncreasing([x₁ x₂ …])_

Answers `true` if the sequence _x_ is strictly increasing,
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

Guides: Sort Functions
