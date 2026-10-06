# decimalFraction

- _decimalFraction(x, n)_

Derive a `Fraction` for the number _x_ where the integer _n_ is the number of decimal places.

At `SmallFloat`:

```
>>> 1.pi.decimalFraction(2)
157/50

>>> Fraction(
>>> 	(1.pi * (10 ^ 2)).round,
>>> 	10 ^ 2
>>> )
157/50

>>> 6.75.decimalFraction(2)
27/4

>>> 23.fractionOver(2)
23/1

>>> [1 2 3].collect { :n |
>>> 	(2.01 / 2).decimalFraction(n)
>>> }
[1/1 1/1 201/200]
```

At `Fraction`:

```
>>> 1/7.decimalFraction(10)
1428571429/10000000000

>>> 23/1.decimalFraction(0)
23/1
```

* * *

See also: Decimal, Fraction, limitDenominator, rationalize

Categories: Converting, Math
