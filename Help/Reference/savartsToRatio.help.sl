# savartsToRatio

- _savartsToRatio(n)_

Answer the ratio represented by _n_ Savarts.
One savart is equal to one thousandth of a decade,
also called a millidecade.

```
>>> 1.savartsToRatio
1.0023

>>> 1.savartsToCents
3.9863

The octave:

```
>>> 301.03.savartsToRatio
2

>>> 2.ratioToSavarts
301.03

>>> 301.03.savartsToCents
1200
```

One hundred savarts is one decidecade, or one-third octave:

```
>>> 100.savartsToRatio.ratioToCents
398.6314
```

* * *

See also: centsToRatio, ratioToSavarts, savartsToCents

References:
_W_
[1](https://en.wikipedia.org/wiki/Savart)
[2](https://en.wikipedia.org/wiki/One-third_octave)
