# deriveDecimalFraction

- _deriveDecimalFraction(x, n)_

Derive a `Fraction` for the number _x_ where the integer _n_ is the number of decimal places.

At `Float`:

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

>>> 10000000000000000/7000000000000000
>>> .deriveDecimalFraction(3)
1429 / 1000

>>> 1/23.deriveDecimalFraction(19L)
217391304347826087/5000000000000000000
```

At integer fractions,
the `identity` function:

```
>>> 23/1.deriveDecimalFraction(0)
23/1
```

* * *

See also: Decimal, Fraction, limitDenominator, rationalize

Guides: Fraction Functions

Categories: Converting, Math
