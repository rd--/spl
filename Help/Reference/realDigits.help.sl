# realDigits

- _realDigits(n, base=10, size=15)_

Answer a list of the digits in the approximate real number _n_,
together with the number of digits that are to the left of the decimal point.

Answer list of digits and exponent:

```
>>> 123.55555.realDigits(10, 10)
[[1 2 3 5 5 5 5 5 0 0], 3]
```

A number that answers the same list of digits,
with a different exponent:

```
>>> 0.000012355555.realDigits(10, 10)
[[1 2 3 5 5 5 5 5 0 0], -4]
```

Digits of π in base ten:

```
>>> 1.pi.realDigits(10, 15)
[[3 1 4 1 5 9 2 6 5 3 5 8 9 7 9], 1]
```

Digits of 19/7 in base ten:

```
>>> (19 / 7).realDigits(10, 15)
[[2 7 1 4 2 8 5 7 1 4 2 8 5 7 1], 1]
```

At `Decimal`:

```
>>> 3.14159D.realDigits
[[3 1 4 1 5 9], 1]

>>> 3.14159.realDigits(10, 6)
[[3 1 4 1 5 9], 1]

>>> 0.00100D.realDigits
[[1 0 0], -2]

>>> 0.00100.realDigits(10, 3)
[[1 0 0], -2]
```

* * *

See also: integerDigits

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RealDigits.html)
