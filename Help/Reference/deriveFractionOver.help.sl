# deriveFractionOver

- _deriveFractionOver(x, n)_

Derive a `Fraction` where _n_ is the unreduced denominator.

At `SmallFloat`,
where _x_ is not close to a simple fraction:

```
>>> 1.pi.deriveFractionOver(1E2)
314/100

>>> 1.pi.deriveFractionOver(1E5)
314159/100000

>>> 1.pi.deriveFractionOver(1E11)
314159265359/100000000000
```

Where _x_ is close to a simple fraction:

```
>>> 6.75.deriveFractionOver(1E11)
27/4

>>> 23.deriveFractionOver(1E11)
23/1
```

At `Fraction`:

```
>>> 1/7.deriveFractionOver(1E12)
142857142857/1000000000000

>>> 1/3.deriveFractionOver(1E7)
3333333/10000000

>>> 355/113.deriveFractionOver(50)
157/50

>>> 355/113.deriveFractionOver(10)
31/10

>>> 355/113.deriveFractionOver(5)
16/5
```

* * *

See also: Fraction, Decimal, deriveDecimalFraction, convergents, limitDenominator, rationalize, semiconvergents

Categories: Converting, Math
