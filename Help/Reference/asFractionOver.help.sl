# asFractionOver

- _asFractionOver(x, n)_

Derive a `Fraction` where _n_ is the unreduced denominator.

At `SmallFloat`:

```
>>> 1.pi.asFractionOver(1E2)
314/100

>>> 1.pi.asFractionOver(1E5)
314159/100000

>>> 1.pi.asFractionOver(1E11)
314159265359/100000000000

>>> 6.75.asFractionOver(1E11)
27/4

>>> 23.asFractionOver(1E11)
23/1
```

At `Fraction`:

```
>>> 355/113.asFractionOver(1E2)
157/50

>>> 1/3.asFractionOver(1E3)
333/1000

>>> 1/7.asFractionOver(1E12)
142857142857/1000000000000

>>> 23/1.asFractionOver(1)
23/1
```

* * *

See also: asDecimalFraction, asFraction, Decimal, limitDenominator, rationalize

Categories: Converting, Math
