# isHighlyAbundantNumber

- _isHighlyAbundantNumber(n)_

Predicate to decide if _n_ is a highly abundant number.

```
>>> 1:60.select(
>>> 	isHighlyAbundantNumber:/1
>>> )
[
	 1  2  3  4  6  8 10 12 16 18
	20 24 30 36 42 48 60
]
```

The only odd highly abundant numbers are one and three:

```
>>> [1, 3 .. 99].select(
>>> 	isHighlyAbundantNumber:/1
>>> )
[1 3]
```

* * *

See also: aliquotSum, divisorSigma, isAbundantNumber, isPerfectNumber

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AbundantNumber.html),
_OEIS_
[1](https://oeis.org/A005101),
_W_
[1](https://en.wikipedia.org/wiki/Abundant_number)
