# decimalPeriod

- _decimalPeriod(n/d)_

Answer the decimal period of the `Fraction` _n/d_.

```
>>> 1/3.decimalPeriod
1

>>> 1/11.decimalPeriod
2

>>> 1/37.decimalPeriod
3

>>> 1/101.decimalPeriod
4

>>> 1/41.decimalPeriod
5

>>> 1/7.decimalPeriod
6

>>> 1/73.decimalPeriod
8
```

Cyclic numbers,
OEIS [A001913](https://oeis.org/A001913):

```
>>> [7 17 19 23 29 47 51 59 61 97]
>>> .collect { :d |
>>> 	Fraction(1, d).decimalPeriod
>>> }
[6 16 18 22 28 46 16 58 60 96]
```

* * *

See also: Fraction, multiplicativeOrder

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DecimalPeriod.html),
_OEIS_
[1](https://oeis.org/A001913),
_W_
[1](https://en.wikipedia.org/wiki/Repeating_decimal)
