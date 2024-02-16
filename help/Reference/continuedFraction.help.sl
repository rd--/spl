# continuedFraction

_continuedFraction(aNumber, anInteger)_

Answer a list of the first _anInteger_ terms in the continued fraction representation of _aNumber_.

Rational number as SmallFloat:

```
>>> (47 / 17).continuedFraction(9)
[2 1 3 4]
```

Rational number as Fraction:

```
>>> 47/17.continuedFraction(9)
[2 1 3 4]
```

Quadratic irrational (recurring continued fraction):

```
>>> 13.sqrt.continuedFraction(16)
[3 1 1 1 1 6 1 1 1 1 6 1 1 1 1 6]
```

The continued fractions for _n-th_ roots of _e_ are very regular:

```
>>> e.sqrt.continuedFraction(17)
[1 1 1 1 5 1 1 9 1 1 13 1 1 17 1 1 21]
```

_fromContinuedFraction_ is effectively the inverse of _continuedFraction_:

```
>>> pi.continuedFraction(13)
[3 7 15 1 292 1 1 1 2 1 3 1 14]

>>> [3 7 15 1 292 1 1 1 2 1 3 1 14].fromContinuedFraction
pi
```

The continued fraction of the _goldenRatio_ is uninformly one:

```
>>> 1.goldenRatio.continuedFraction(9)
[1 1 1 1 1 1 1 1 1]
```

Objects showing regularity in their continued fractions:

```
>>> 1.coth.continuedFraction(8)
[1 3 5 7 9 11 13 15]
```

See also: fromContinuedFraction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ContinuedFraction.html)
[2](https://reference.wolfram.com/language/ref/ContinuedFraction.html)
