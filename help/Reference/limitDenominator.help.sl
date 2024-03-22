# limitDenominator

- _limitDenominator(aFraction, anInteger)_

Find the nearest approximation to _aFraction_ that has a denominator less than or equal to the indicated maximum, _anInteger_.

```
>>> let r = Fraction(3141592653589793, 1E15);
>>> r.limitDenominator(1E4)
355/113

>>> 355/113.limitDenominator(1E1)
22/7
```

Recover a rational number that’s represented as a float:

```
>>> let n = (pi / 3).cos;
>>> let r = n.asFraction(1E32);
>>> (r, r.limitDenominator(1E6))
(3469446951953615/6938893903907229, 1/2)

>>> let r = 1.1.asFraction(1E32);
>>> (r, r.limitDenominator(1E6))
(693889390390723/630808536718839, 11/10)
```

* * *

See also: asFraction

References:
_Python_
[1](https://docs.python.org/3/library/fractions.html#fractions.Fraction.limit_denominator)

Categories: Math
