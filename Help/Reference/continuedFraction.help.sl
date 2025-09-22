# continuedFraction

- _continuedFraction(n, k=24)_

Answer a list of at most the first _k_ terms in the continued fraction representation of the number _n_.

All rational number have finite continued fractions,
at `Fraction`:

```
>>> 47/17.continuedFraction
[2 1 3 4]

>>> 27/32.continuedFraction
[0 1 5 2 2]

>>> 22/45.continuedFraction
[0 2 22]

>>> 13/27.continuedFraction
[0 2 13]
```

At negative _x_:

```
>>> -17/12.continuedFraction
[-2 1 1 2 2]

>>> [-2 1 1 2 2].fromContinuedFraction
-17/12

>>> -151/77.continuedFraction
[-2 25 1 2]

>>> [-2 25 1 2].fromContinuedFraction
-151/77
```

At larger fraction:

```
>>> 789213/479713.continuedFraction
[1 1 1 1 4 1 1 63 1 13 8 2]
```

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

>>> (-151 / 77).continuedFraction
[-2 25 1 2]
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

Quadratic irrational (recurring continued fraction):

```
>>> 3.sqrt.continuedFraction(5)
[1 1 2 1 2]

>>> 5.sqrt.continuedFraction(3)
[2 4 4]

>>> 6.sqrt.continuedFraction(5)
[2 2 4 2 4]

>>> 7.sqrt.continuedFraction(9)
[2 1 1 1 4 1 1 1 4]

>>> 13.sqrt.continuedFraction(16)
[3 1 1 1 1 6 1 1 1 1 6 1 1 1 1 6]
```

The continued fractions for _n-th_ roots of `e` are very regular:

```
>>> 1.e.sqrt.continuedFraction(17)
[1 1 1 1 5 1 1 9 1 1 13 1 1 17 1 1 21]
```

`fromContinuedFraction` is effectively the inverse of `continuedFraction`:

```
>>> 1.pi.continuedFraction(13)
[3 7 15 1 292 1 1 1 2 1 3 1 14]

>>> [
>>> 	3 7 15 1 292 1 1 1 2 1 3 1 14
>>> ].fromContinuedFraction
1.pi
```

The continued fraction of the `goldenRatio` is uniformly one:

```
>>> 1.goldenRatio.continuedFraction(9)
[1 1 1 1 1 1 1 1 1]

>>> (5.sqrt / 1.goldenRatio)
>>> .continuedFraction(9)
[1 2 1 1 1 1 1 1 1]
```

Other low order repeating continued fractions:

```
>>> ((1 + 3.sqrt) / 2)
>>> .continuedFraction(16)
[1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2]

>>> (1 + 2.sqrt)
>>> .continuedFraction(17)
[2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2]

>>> ((9 + 221.sqrt) / 10)
>>> .continuedFraction(17)
[2 2 1 1 2 2 1 1 2 2 1 1 2 2 1 1 2]

>>> ((23 + 1517.sqrt) / 26)
>>> .continuedFraction(19)
[2 2 1 1 1 1 2 2 1 1 1 1 2 2 1 1 1 1 2]

>>> ((5 + 7565.sqrt) / 58)
>>> .continuedFraction(19)
[1 1 1 2 2 2 2 1 1 2 2 2 2 1 1 2 2 2 2]

>>> ((4 + 37.sqrt) / 7)
>>> .continuedFraction(18)
[1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3]

>>> ((9 + (2 * 39.sqrt)) / 15)
>>> .continuedFraction(16)
[1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4]
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
>>> [123 12.3 1.23 0.123].collect { :n |
>>> 	n.continuedFraction(6)
>>> }
[123; 12 3 3; 1 4 2 1 6 1; 0 8 7 1 2 5]

>>> ((1 + 5.sqrt) / 2)
>>> .continuedFraction(24)
[
	1 1 1 1 1 1 1 1 1 1
	1 1 1 1 1 1 1 1 1 1
	1 1 1 1
]

>>> [3.sqrt, 1 / 3.sqrt].collect { :n |
>>> 	n.continuedFraction(11)
>>> }
[
	1 1 2 1 2 1 2 1 2 1 2;
	0 1 1 2 1 2 1 2 1 2 1
]

>>> 1.e.continuedFraction(21)
[
	2 1 2 1 1 4 1 1 6 1
	1 8 1 1 10 1 1 12 1 1
	11
]

>>> 1.tan.continuedFraction(21)
[
	1 1 1 3 1 5 1 7 1 9
	1 11 1 13 1 15 1 16 1 17
	1
]

>>> (5 / 4).log2.reciprocal
>>> .continuedFraction(9)
[3 9 2 2 4 6 2 1 1]

>>> 1.gausssConstant
>>> .continuedFraction(16)
[0 1 5 21 3 4 14 1 1 1 1 1 3 1 15 1]
```

Threads over lists:

```
>>> [
>>> 	1/2
>>> 	3/1
>>> 	23/8
>>> 	13/11
>>> 	22/7
>>> 	-151/77
>>> 	14142/10000
>>> 	141421/100000
>>> 	1414214/1000000
>>> 	14142136/10000000
>>> ].continuedFraction
[
	0 2;
	3;
	2 1 7;
	1 5 2;
	3 7;
	-2 25 1 2;
	1 2 2 2 2 2 1 1 29;
	1 2 2 2 2 2 2 3 1 1 3 1 7 2;
	1 2 2 2 2 2 2 2 3 6 1 2 1 12;
	1 2 2 2 2 2 2 2 2 2 6 1 2 4 1 1 2
]
```

At `zero`:

```
>>> 0.continuedFraction
[0]

[0].fromContinuedFraction
0
```

* * *

See also: fromContinuedFraction, metallicMean

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ContinuedFraction.html)
[2](https://reference.wolfram.com/language/ref/ContinuedFraction.html),
_W_
[1](https://en.wikipedia.org/wiki/Continued_fraction)
[2](https://en.wikipedia.org/wiki/Simple_continued_fraction)
