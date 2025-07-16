# isPseudoperfectNumber

- _isPseudoperfectNumber(n)_

Answer `true` if the integer _n_ is a pseudoperfect number,
also called a semiperfect number,
and `false` otherwise.

A pseudoperfect number:

```
>>> 20.isPseudoperfectNumber
true

>>> [1 4 5 10].sum
20
```

The first few pseudoperfect numbers:

```
>>> 1:40.select(
>>> 	isPseudoperfectNumber:/1
>>> )
[6 12 18 20 24 28 30 36 40]
```

* * *

See also: isPerfectNumber, isWeirdNumber

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PseudoperfectNumber.html),
_OEIS_
[1](https://oeis.org/A005835),
_W_
[1](https://en.wikipedia.org/wiki/Semiperfect_number)
