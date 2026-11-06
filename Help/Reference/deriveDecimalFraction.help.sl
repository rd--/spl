# deriveDecimalFraction

- _deriveDecimalFraction(x, n)_

Derive a `Fraction` for the number _x_ where the integer _n_ is the number of decimal places.

At `SmallFloat`:

```
>>> 1.pi.deriveDecimalFraction(2)
157/50

>>> Fraction(
>>> 	(1.pi * (10 ^ 2)).round,
>>> 	10 ^ 2
>>> )
157/50

>>> 6.75.deriveDecimalFraction(2)
27/4

>>> [1 2 3].collect { :n |
>>> 	(2.01 / 2).deriveDecimalFraction(n)
>>> }
[1/1 1/1 201/200]
```

At `Fraction`:

```
>>> 1/7.deriveDecimalFraction(10)
1428571429/10000000000
```

At `Integer`,
the `identity` function:

```
>>> 23.deriveDecimalFraction(0)
23

>>> 23L.deriveDecimalFraction(0)
23L
```

* * *

See also: Decimal, Fraction, limitDenominator, rationalize

Guides: Fraction Functions

Categories: Converting, Math
