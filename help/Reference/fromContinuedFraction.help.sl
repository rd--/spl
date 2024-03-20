# fromContinuedFraction

- _fromContinuedFraction(aSequence)_

Reconstructs a number from the list of its continued fraction terms.

```
>>> 47/17.continuedFraction(4)
[2 1 3 4]

>>> [2 1 3 4].fromContinuedFraction
47/17

>>> 2 + (1 / (1 + (1 / (3 + (1 / 4)))))
47/17

>>> [2 1 3 4].prefixes.collect(fromContinuedFraction:/1)
[2 3 11/4 47/17]
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

A continued fraction may begin with a zero, where the answer is less than 1/2:

```
>>> 7/17.continuedFraction(4)
[0 2 2 3]

>>> [0 2 2 3].fromContinuedFraction
7/17

>>> 7 / 17
0.41176

>>> [0].fromContinuedFraction
0
```

* * *

See also: goldenRatio

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromContinuedFraction.html)
