# limitDenominator

- _limitDenominator(aFraction, anInteger)_

Find the nearest approximation to _aFraction_ that has a denominator less than or equal to _anInteger_.

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
>>> let r = n.asFractionOver(1E23);
>>> (r, r.limitDenominator(1E6))
(
	1490116119384765/2980232238769531,
	1/2
)

>>> let r = 1.1.asFractionOver(1E23);
>>> (r, r.limitDenominator(1E6))
(
	6556510925292969/5960464477539062,
	11/10
)
```

* * *

See also: asFraction, asFractionOver, rationalize

References:
_Python_
[1](https://docs.python.org/3/library/fractions.html#fractions.Fraction.limit_denominator)

Categories: Math
