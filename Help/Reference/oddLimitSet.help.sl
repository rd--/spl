# oddLimitSet

- _oddLimitSet(anInteger)_

Answer the odd limit set of _anInteger_,
which is the set of all fractions with are within this odd-limit.

The answer is given `octaveReduced` and `sorted`.

```
>>> 7.oddLimitSet
[
	1/1 8/7 7/6 6/5 5/4
	4/3 7/5 10/7 3/2 8/5
	5/3 12/7 7/4
]

>>> 7.oddLimitSet.ratioToCents.rounded
[
	0 231 267 316 386
	498 583 617 702 814
	884 933 969
]
```

* * *

See also: octaveReduced, oddLimit, sorted

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Odd_limit)

Categories: Tuning
