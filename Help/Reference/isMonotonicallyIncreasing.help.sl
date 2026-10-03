# isMonotonicallyIncreasing

- _isMonotonicallyIncreasing([x₁ x₂ …])_

Answers `true` if the sequence _x_ is monotonically increasing,
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

Numbers with prime exponents not increasing,
OEIS [A112769](https://oeis.org/A112769):

```
>>> 1:100.select { :p |
>>> 	p.factorInteger
>>> 	.column(2)
>>> 	.isMonotonicallyIncreasing
>>> 	.not
>>> }
[
	12 20 24 28 40 44 45 48 52 56
	60 63 68 72 76 80 84 88 90 92
	96 99
]
```

* * *

See also: <=, isFinite, isSortedBy, isStrictlyIncreasing

Guides: Sort Functions
