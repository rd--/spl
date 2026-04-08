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

>>> 1/3.continuedFraction
[0 3]

>>> 17/24.continuedFraction
[0 1 2 2 3]

>>> 37/112.continuedFraction
[0 3 37]

>>> 1 / (3 + 1/37)
37/112

>>> 11/37.continuedFraction
[0 3 2 1 3]
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

Quadratic irrationals have recurring continued fractions.

Continued fraction of _√3_,
OEIS [A040001](https://oeis.org/A040001):

```
>>> 3.sqrt.continuedFraction(5)
[1 1 2 1 2]
```

Compare with reciprocal:

```
>>> [3.sqrt, 1 / 3.sqrt].collect { :n |
>>> 	n.continuedFraction(11)
>>> }
[
	  1 1 2 1 2 1 2 1 2 1 2;
	0 1 1 2 1 2 1 2 1 2 1
]
```

Continued fraction of _√5_,
OEIS [A040002](https://oeis.org/A040002):

```
>>> 5.sqrt.continuedFraction(3)
[2 4 4]
```

Continued fraction of _√6_,
OEIS [A040003](https://oeis.org/A040003):

```
>>> 6.sqrt.continuedFraction(5)
[2 2 4 2 4]
```

Continued fraction of _√7_,
OEIS [A010121](https://oeis.org/A010121):

```
>>> 7.sqrt.continuedFraction(9)
[2 1 1 1 4 1 1 1 4]
```

Continued fraction of _√13_,
OEIS [A010122](https://oeis.org/A010122):

```
>>> 13.sqrt.continuedFraction(16)
[3 1 1 1 1 6 1 1 1 1 6 1 1 1 1 6]
```

Continued fraction of _√23_,
OEIS [A010127](https://oeis.org/A010127):

```
>>> 23.sqrt.continuedFraction(16)
[4 1 3 1 8 1 3 1 8 1 3 1 8 1 3 1]
```

Continued fraction of _√109_,
OEIS [A010175](https://oeis.org/A010175):

```
>>> 109.sqrt.continuedFraction(16)
[10 2 3 1 2 4 1 6 6 1 4 2 1 3 2 20]
```

The continued fractions for _n-th_ roots of `e` are very regular.
Continued fraction for square root of _e_,
OEIS [A058281](https://oeis.org/A058281):

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

The continued fraction of the `goldenRatio` is uniformly one,
OEIS [A000012](https://oeis.org/A000012):

```
>>> 1.goldenRatio.continuedFraction(9)
[1 1 1 1 1 1 1 1 1]

>>> (5.sqrt / 1.goldenRatio)
>>> .continuedFraction(9)
[1 2 1 1 1 1 1 1 1]
```

Other low order repeating continued fractions.

_1,2_ repeated,
OEIS [A000034](https://oeis.org/A000034):

```
>>> ((1 + 3.sqrt) / 2)
>>> .continuedFraction(16)
[1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2]
```

Constant two,
OEIS [A007395](https://oeis.org/A007395):

```
>>> (1 + 2.sqrt)
>>> .continuedFraction(17)
[2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2]
```

_1,1,2,2_ repeat,
OEIS [A130658](https://oeis.org/A130658):

```
>>> ((9 + 221.sqrt) / 14)
>>> .continuedFraction(17)
[1 1 2 2 1 1 2 2 1 1 2 2 1 1 2 2 1]

>>> ((9 + 221.sqrt) / 10)
>>> .continuedFraction(17)
[2 2 1 1 2 2 1 1 2 2 1 1 2 2 1 1 2]
```

_1,2,3_ repeat,
OEIS [A010882](https://oeis.org/A010882):

```
>>> ((4 + 37.sqrt) / 7)
>>> .continuedFraction(18)
[1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3]
```

_1,2,3,4_ repeat,
OEIS [A010883](https://oeis.org/A010883):

```
>>> ((9 + (2 * 39.sqrt)) / 15)
>>> .continuedFraction(16)
[1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4]
```

Other simple repeats:

```
>>> ((23 + 1517.sqrt) / 26)
>>> .continuedFraction(19)
[2 2 1 1 1 1 2 2 1 1 1 1 2 2 1 1 1 1 2]

>>> ((5 + 7565.sqrt) / 58)
>>> .continuedFraction(19)
[1 1 1 2 2 2 2 1 1 2 2 2 2 1 1 2 2 2 2]
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

Continued fraction for _e_,
OEIS [A003417](https://oeis.org/A003417):

```
>>> 1.e.continuedFraction(20)
[
	2 1 2 1 1 4 1 1 6 1
	1 8 1 1 10 1 1 12 1 1
]
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

>>> 1.tan.continuedFraction(21)
[
	1 1 1 3 1 5 1 7 1 9
	1 11 1 13 1 15 1 16 1 17
	1
]

>>> (5 / 4).log2.reciprocal
>>> .continuedFraction(9)
[3 9 2 2 4 6 2 1 1]
```

Continued fraction for _log₂(5)_,
OEIS [A028508](https://oeis.org/A028508):

```
>>> 5.log2
>>> .continuedFraction(17)
[2 3 9 2 2 4 6 2 1 1 3 1 18 1 6 1 2]
```

Continued fraction for Gauss’s constant,
OEIS [A053002](https://oeis.org/A053002):

```
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

At `Decimal`,
OEIS [A003417](https://oeis.org/A003417):

```
>>> 1.e(104)
>>> .continuedFraction(72)
[
	2 1  2 1 1  4 1 1  6
	1 1  8 1 1 10 1 1 12
	1 1 14 1 1 16 1 1 18
	1 1 20 1 1 22 1 1 24
	1 1 26 1 1 28 1 1 30
	1 1 32 1 1 34 1 1 36
	1 1 38 1 1 40 1 1 42
	1 1 44 1 1 46 1 1 48
]
```

Repeating _123432_,
OEIS [A028356](https://oeis.org/A028356):

```
>>> ((28 + 2730.sqrt) / 56)
>>> .continuedFraction(17)
[1 2 3 4 3 2 1 2 3 4 3 2 1 2 3 4 3]
```

Continued fraction of twelfth root of two,
the frequency ratio of a semitone in equal temperament,
OEIS [A103922](https://oeis.org/A103922):

```
>>> (2 ^ 1/12).continuedFraction(15)
[1 16 1 4 2 7 1 1 2 2 7 4 1 2 1]
```

Continued fraction of `exp` of one ninth:

```
>>> 1/9.exp.continuedFraction(13)
[1 8 1 1 26 1 1 44 1 1 62 1 1]
```

Scatter plot of the
least number _k<n_ and coprime to _n_ such that the largest term of the continued fraction of _k/n_ is as small as possible,
OEIS [A141821](https://oeis.org/A141821):

~~~spl svg=A oeis=A141821
2:108.collect { :n |
	let k = (1 .. n - 1).select { :x |
		x.isCoprime(n)
	};
	let c = (k \ n).continuedFraction;
	let m = c.collect(max:/1);
	let i = m.indexOf(m.min);
	k[i]
}.scatterPlot
~~~

![](Help/Image/continuedFraction-A.svg)

The least maxima of
the least number _k<n_ and coprime to _n_ such that the largest term of the continued fraction of _k/n_ is as small as possible,
OEIS [A141822](https://oeis.org/A141822):

~~~spl svg=B oeis=A141822
2:67.collect { :n |
	let k = (1 .. n - 1).select { :x |
		x.isCoprime(n)
	};
	(k \ n)
	.continuedFraction
	.collect(max:/1)
	.min
}.stepPlot
~~~

![](Help/Image/continuedFraction-B.svg)

Numerators of rationals _≥1_ whose continued fractions consist only of ones and twos,
OEIS [A072728](https://oeis.org/A072728):

~~~spl svg=C oeis=A072728
[
	1   2  3  5  5  8  7  8 12 13
	11 12 13 19 19 21 17 18 19 19
	21 29 31 30 31 34 27 26 29 29
	31 30 31 34 46 45 50 46 49 49
	50 55 41 44 41 43 47 46 45 50
	46 49 49 50 55
].scatterPlot
~~~

![](Help/Image/continuedFraction-C.svg)

Denominators of rationals _≥1_ whose continued fractions consist only of ones and twos,
OEIS [A072729](https://oeis.org/A072729):

~~~spl svg=D oeis=A072729
[
	1   1  2  2  3  3  5  5  5  5
	8   7  8  8  7  8 12 13 11 12
	13 12 13 11 12 13 19 19 21 17
	18 19 19 21 19 19 21 17 18 19
	19 21 29 31 30 31 34 27 26 29
	29 31 30 31 34
].scatterPlot
~~~

![](Help/Image/continuedFraction-D.svg)

Rationals _≥1_ whose continued fractions consist only of ones and twos:

~~~spl svg=E
Fraction(
	[
		1   2  3  5  5  8  7  8 12 13
		11 12 13 19 19 21 17 18 19 19
		21 29 31 30 31 34 27 26 29 29
		31 30 31 34 46 45 50 46 49 49
		50 55 41 44 41 43 47 46 45 50
		46 49 49 50 55
	],
	[
		1  1  2  2  3  3  5  5  5  5
		8  7  8  8  7  8 12 13 11 12
		13 12 13 11 12 13 19 19 21 17
		18 19 19 21 19 19 21 17 18 19
		19 21 29 31 30 31 34 27 26 29
		29 31 30 31 34
	]
).scatterPlot
~~~

![](Help/Image/continuedFraction-E.svg)

Continued fractions of rationals _≥1_ whose continued fractions consist only of ones and twos,
shifted to alphabet of _-1,1_:

~~~spl svg=F
let n = [
	1   2  3  5  5  8  7  8 12 13
	11 12 13 19 19 21 17 18 19 19
	21 29 31 30 31 34 27 26 29 29
	31 30 31 34 46 45 50 46 49 49
	50 55 41 44 41 43 47 46 45 50
	46 49 49 50 55
];
let d = [
	1   1  2  2  3  3  5  5  5  5
	8   7  8  8  7  8 12 13 11 12
	13 12 13 11 12 13 19 19 21 17
	18 19 19 21 19 19 21 17 18 19
	19 21 29 31 30 31 34 27 26 29
	29 31 30 31 34
];
let c = Fraction(n, d).continuedFraction;
(c.catenate - 1 * 2 - 1).discretePlot
~~~

![](Help/Image/continuedFraction-F.svg)

* * *

See also: fromContinuedFraction, metallicMean

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ContinuedFraction.html)
[2](https://reference.wolfram.com/language/ref/ContinuedFraction.html),
_OEIS_
[1](https://oeis.org/A141821)
[2](https://oeis.org/A141822),
_W_
[1](https://en.wikipedia.org/wiki/Continued_fraction)
[2](https://en.wikipedia.org/wiki/Simple_continued_fraction)
