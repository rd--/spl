# isDeficientNumber

- _isDeficientNumber(n)_

Predicate to decide if _n_ is an deficient number.

```
>>> 21.isDeficientNumber
true

>>> 21.divisors.sum
32
```

The first few deficient numbers:

```
>>> 1:50.select(isDeficientNumber:/1)
[
	 1  2  3  4  5  7  8  9 10 11
	13 14 15 16 17 19 21 22 23 25
	26 27 29 31 32 33 34 35 37 38
	39 41 43 44 45 46 47 49 50
]
```

* * *

See also: aliquotSum, divisorSigma, isAbundantNumber, isPerfectNumber

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DeficientNumber.html),
_OEIS_
[1](https://oeis.org/A005100),
_W_
[1](https://en.wikipedia.org/wiki/Deficient_number)
