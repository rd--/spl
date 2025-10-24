# asDecimalFraction

- _asDecimalFraction(x, n)_

Derive a `Fraction` for the `SmallFloat` _x_ where the integer _n_ is the number of decimal places.

```
>>> 1.pi.asDecimalFraction(2)
157/50

>>> Fraction(
>>> 	(1.pi * (10 ^ 2)).round,
>>> 	10 ^ 2
>>> )
157/50

>>> 6.75.asDecimalFraction(2)
27/4

>>> 23.asFractionOver(2)
23/1

>>> [1 2 3].collect { :n |
>>> 	(2.01 / 2).asDecimalFraction(n)
>>> }
[1/1 1/1 201/200]
```

* * *

See also: asFraction, Decimal, limitDenominator, rationalize

Categories: Converting, Math
