# isAbundantNumber

- _isAbundantNumber(n)_

Predicate to decide if _n_ is an abundant number.

```
>>> 1:120.select(isAbundantNumber:/1)
[
	12  18  20  24  30  36  40  42  48  54
	56  60  66  70  72  78  80  84  88  90
	96 100 102 104 108 112 114 120
]
```

The first odd abundant number is 945:

```
>>> 945.isAbundantNumber
true
```

* * *

See also: aliquotSum, divisorSigma, isPerfectNumber

Guides: Integer Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AbundantNumber.html),
_OEIS_
[1](https://oeis.org/A005101),
_W_
[1](https://en.wikipedia.org/wiki/Abundant_number)
