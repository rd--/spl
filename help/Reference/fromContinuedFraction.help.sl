# fromContinuedFraction

_fromContinuedFraction(aSequence)_

Reconstructs a number from the list of its continued fraction terms.

```
>>> [2 1 3 4].fromContinuedFraction
(47 / 17)

>>> 2 + (1 / (1 + (1 / (3 + (1 / 4)))))
(47 / 17)
```

Rational approximations to golden ratio:

```
>>> 1:9.collect { :k | (1 # k).fromContinuedFraction }
[1 2 3/2 5/3 8/5 13/8 21/13 34/21 55/34]

>>> (55 / 34).roundTo(0.001)
1.618

>>> 1.goldenRatio.roundTo(0.001)
1.618
```

* * *

See also: goldenRatio

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromContinuedFraction.html)
