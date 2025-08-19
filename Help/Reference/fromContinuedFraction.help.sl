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

>>> [2 1 3 4]
>>> .prefixes
>>> .collect(fromContinuedFraction:/1)
[2 3 11/4 47/17]
```

Rational approximations to golden ratio:

```
>>> 1:14.collect { :k |
>>> 	(1 # k).fromContinuedFraction
>>> }
[
	1 2 3/2 5/3 8/5
	13/8 21/13 34/21 55/34 89/55
	144/89 233/144 377/233 610/377
]

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

Construct continued fractions:

```
>>> 1:5.collect { :n |
>>> 	1:n.collect { :k |
>>> 		k ^ 6
>>> 	}.fromContinuedFraction
>>> }
[
	1/1
	65/64
	47386/46657
	194093121/191107136
	3032705063011/2986049046657
]
```

Trott’s constant:

```
>>> [0 1 0 8 4 1 0 1 5 1 2 2 3 1 1 1 3 6 1]
>>> .fromContinuedFraction
0.108410151223
```

* * *

See also: convergents, continuedFraction, goldenRatio

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ContinuedFractionConstants.html)
[2](https://reference.wolfram.com/language/ref/FromContinuedFraction.html)
_OEIS_
[1](https://oeis.org/A039662)
