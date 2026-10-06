# limitDenominator

- _limitDenominator(n/d, i)_

Find the nearest approximation to the fraction _n/d_ that has a denominator less than or equal to the integer _i_.

Limit the denominator of a fraction that is not very close to a simple fraction:

```
>>> let r = 1.pi.asFractionOver(10L ^ 6);
>>> (r, r.limitDenominator(10L ^ 4))
(3141593/1000000, 355/113)

>>> 355/113.limitDenominator(10L)
22/7
```

Limit the denominator of a fraction that is very close to a simple fraction:

```
>>> 5960464477539063/11920928955078125
>>> .limitDenominator(10L ^ 15)
1/2

>>> 13113021850585938/11920928955078125
>>> .limitDenominator(10L ^ 15)
11/10
```

* * *

See also: Fraction, asFractionOver, rationalize

References:
_Python_
[1](https://docs.python.org/3/library/fractions.html#fractions.Fraction.limit_denominator)

Categories: Math
