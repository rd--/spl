# limitDenominator

- _limitDenominator(n/d, i)_

Find the nearest approximation to the fraction _n/d_ that has a denominator less than or equal to the integer _i_.

```
>>> let r = 1.pi.asFractionOver(1E6);
>>> (r, r.limitDenominator(1E4))
(3141593/1000000, 355/113)

>>> 355/113.limitDenominator(1E1)
22/7
```

Recover a rational number that is represented as a float:

```
>>> let n = 1/3.pi.cos;
>>> let r = n.asFractionOver(10L ^ 23);
>>> (r, r.limitDenominator(1E6))
(
	5960464477539063/11920928955078125,
	1/2
)

>>> let r = 1.1.asFractionOver(10L ^ 23);
>>> (r, r.limitDenominator(1E6))
(
	13113021850585938/11920928955078125,
	11/10
)
```

* * *

See also: asFraction, asFractionOver, rationalize

References:
_Python_
[1](https://docs.python.org/3/library/fractions.html#fractions.Fraction.limit_denominator)

Categories: Math
