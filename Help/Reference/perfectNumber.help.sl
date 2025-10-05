# perfectNumber

- _perfectNumber(n)_

Answer the _n_-the perfect number.
Only the first ten perfect numbers are answered.

The fourth, fifth and tenth perfect numbers:

```
>>> 4.perfectNumber
8128

>>> 8128.divisors.sum / 2
8128

>>> 5.perfectNumber
33550336

>>> 9.perfectNumber
2658455991569831744654692615953842176L
```

The integer lengths of the first ten perfect numbers:

```
>>> 1:10.collect { :n |
>>> 	n.perfectNumber
>>> 	.integerLength(10)
>>> }
[1 2 3 4 8 10 12 19 37 54]
```

* * *

See also: isPerfectNumber

Guides: Integer Functions,Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PerfectNumber.html)
[2](https://reference.wolfram.com/language/ref/PerfectNumber.html),
_OEIS_
[1](https://oeis.org/A000396),
_W_
[1](https://en.wikipedia.org/wiki/Perfect_number)
