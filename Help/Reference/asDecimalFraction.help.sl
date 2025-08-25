# asDecimalFraction

- _asDecimalFraction(aSmallFloat, anInteger)_

Derive a `Fraction` where _anInteger_ is the number of decimal places.

```
>>> 1.pi.asDecimalFraction(2)
157/50

>>> Fraction((1.pi * (10 ^ 2)).round, 10 ^ 2)
157/50

>>> 6.75.asDecimalFraction(2)
27/4

>>> 23.asFractionOver(2)
23/1
```

* * *

See also: asFraction, Decimal, limitDenominator, rationalize

Categories: Converting, Math
