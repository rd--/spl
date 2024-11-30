# continuedFraction

- _continuedFraction(aNumber, anInteger)_
- _continuedFraction(alpha)_ ⟹ _continuedFraction(alpha, 24)_

Answer a list of at most the first _anInteger_ terms in the continued fraction representation of _aNumber_.

Rational number as `SmallFloat`:

```
>>> (47 / 17).continuedFraction(4)
[2 1 3 4]

>>> 2 + (1 / (1 + (1 / (3 + 1/4))))
47/17

>>> 0.84375.continuedFraction
[0 1 5 2 2]

>>> (22 / 45).continuedFraction
[0 2 22]
```

Does not simplify final term:

```
>>> (13 / 27).continuedFraction
[0 2 12 1]

>>> 0 + (1 / (2 + (1 / (12 + 1/1))))
13/27

>>> 0 + (1 / (2 + (1/13)))
13/27

>>> [0 2 12 1].fromContinuedFraction
[0 2 13].fromContinuedFraction
```

Rational number as `Fraction`:

```
>>> 47/17.continuedFraction
[2 1 3 4]

>>> 27/32.continuedFraction
[0 1 5 2 2]
```

Quadratic irrational (recurring continued fraction):

```
>>> 13.sqrt.continuedFraction(16)
[3 1 1 1 1 6 1 1 1 1 6 1 1 1 1 6]
```

The continued fractions for _n-th_ roots of `e` are very regular:

```
>>> e.sqrt.continuedFraction(17)
[1 1 1 1 5 1 1 9 1 1 13 1 1 17 1 1 21]
```

`fromContinuedFraction` is effectively the inverse of `continuedFraction`:

```
>>> pi.continuedFraction(13)
[3 7 15 1 292 1 1 1 2 1 3 1 14]

>>> [
>>> 	3 7 15 1 292 1 1 1 2 1 3 1 14
>>> ].fromContinuedFraction
pi
```

The continued fraction of the `goldenRatio` is uniformly one:

```
>>> 1.goldenRatio.continuedFraction(9)
[1 1 1 1 1 1 1 1 1]
```

The continued fractions of integer square roots:

```
>>> [2 14 42].collect { :n |
>>> 	n.sqrt.continuedFraction(9)
>>> }
[
	1 2 2 2 2 2 2 2 2;
	3 1 2 1 6 1 2 1 6;
	6 2 12 2 12 2 12 2 12
]
```

Objects showing regularity in their continued fractions:

```
>>> 1.coth.continuedFraction(8)
[1 3 5 7 9 11 13 15]
```

Examples of rational and irrational numbers:

```
>>> [123 12.3 1.23 0.123].collect {
>>> 	:n | n.continuedFraction(6)
>>> }
[123; 12 3 3; 1 4 2 1 6 1; 0 8 7 1 2 5]

>>> ((1 + 5.sqrt) / 2).continuedFraction(24)
[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]

>>> [3.sqrt, 1 / 3.sqrt].collect { :n |
>>> 	n.continuedFraction(11)
>>> }
[1 1 2 1 2 1 2 1 2 1 2; 0 1 1 2 1 2 1 2 1 2 1]

>>> e.continuedFraction(21)
[2 1 2 1 1 4 1 1 6 1 1 8 1 1 10 1 1 12 1 1 11]

>>> 1.tan.continuedFraction(21)
[1 1 1 3 1 5 1 7 1 9 1 11 1 13 1 15 1 16 1 17 1]
```

* * *

See also: fromContinuedFraction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ContinuedFraction.html)
[2](https://reference.wolfram.com/language/ref/ContinuedFraction.html),
_W_
[1](https://en.wikipedia.org/wiki/Continued_fraction)
