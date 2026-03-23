# fromContinuedFraction

- _fromContinuedFraction([a₁ a₂ …])_

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

The continued fraction of the square root of two,
OEIS [A040000](https://oeis.org/A040000):

```
>>> [1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2]
>>> .fromContinuedFraction
2.sqrt
```

Continued fraction of _(3+√5)/4_,
also decimal expansion of _121/90_,
OEIS [A113311](https://oeis.org/A113311):

```
>>> [1 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4]
>>> .fromContinuedFraction
(3 + 5.sqrt) / 4

>>> 121 / 90
1.34444444444444
```

Continued fraction of _(132-√17)/103_,
also decimal expansion of _1331/900_,
OEIS [A115291](https://oeis.org/A115291):

```
>>> [1 4 7 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8]
>>> .fromContinuedFraction
(132 - 17.sqrt) / 103

>>> 1331 / 900
1.4788888888888888
```

Continued fraction expansion of _(55305+√65)/46231_,
OEIS [A171418](https://oeis.org/A171418):

```
>>> [1 5 11 15 16 16 16 16 16 16 16 16 16]
>>> .fromContinuedFraction
(55305 + 65.sqrt) / 46231
```

Continued fraction expansion of _(229657824-√257)/197139199_,
OEIS [A171440](https://oeis.org/A171440):

```
>>> [1 6 16 26 31 32 32 32 32 32 32 32 32]
>>> .fromContinuedFraction
(229657824 - 257.sqrt) / 197139199
```

Continued fraction expansion of _1+(1233212607598+5*√41)/8688482797079_,
OEIS [A171441](https://oeis.org/A171441):

```
>>> [1 7 22 42 57 63 64 64 64 64 64 64 64]
>>> .fromContinuedFraction
1 + (
	(1233212607598 + (5 * 41.sqrt))
	/
	8688482797079
)
```

Quadratic irrationals have recurring continued fractions,
which are not marked, instead a truncation is taken:

```
>>> 71.sqrt.continuedFraction(9)
[8 2 2 1 7 1 2 2 16]

>>> [8 2 2 1 7 1 2 2 16]
>>> .fromContinuedFraction
71.sqrt
```

Rational approximation to π:

```
>>> 1.pi.continuedFraction(3)
[3 7 15]

>>> [3 7 15].fromContinuedFraction
333/106

>>> 333/106.asFloat
3.1415
```

Larger fractions:

```
>>> [1 1 1 1 4 1 1 63 1 13 8 2]
>>> .fromContinuedFraction
789213/479713
```

Rational approximations to golden ratio:

```
>>> 1:14.collect { :k |
>>> 	(k # [1]).fromContinuedFraction
>>> }
[
	1 2 3/2 5/3 8/5
	13/8 21/13 34/21 55/34 89/55
	144/89 233/144 377/233 610/377
]

>>> (55 / 34).round(0.001)
1.618

>>> 1.goldenRatio.round(0.001)
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

Continued fractions of negative numbers have a negative leading term:

```
>>> [-2 25 1 2].fromContinuedFraction
-151/77

>>> [-2 1 1 2 2].fromContinuedFraction
-17/12
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

The continued fraction expansion whose terms are the first-order differences of exponents in the binary representation of _4n_,
all of the rationals are uniquely represented by this sequence,
OEIS [A071585](https://oeis.org/A071585)
/
OEIS [A071766](https://oeis.org/A071766):

~~~spl svg=A
1:100.collect { :n |
	let a = (4 * n).numberExpand(2);
	let b = a.without(0).log2;
	let c = b.differences.abs ++ [b.last];
	c.fromContinuedFraction
}.scatterPlot
~~~

![](Help/Image/fromContinuedFraction-A.svg)

The numerator sequence,
OEIS [A071585](https://oeis.org/A071585):

~~~spl svg=B oeis=A071585
OeisEntry('A071585').then { :e |
	e.data.scatterPlot
}
~~~

![](Help/Image/fromContinuedFraction-B.svg)

The denominator sequence,
OEIS [A071766](https://oeis.org/A071766):

~~~spl svg=C oeis=A071766
OeisEntry('A071766').then { :e |
	e.data.scatterPlot
}
~~~

![](Help/Image/fromContinuedFraction-C.svg)

* * *

See also: convergents, continuedFraction, goldenRatio

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ContinuedFractionConstants.html)
[2](https://reference.wolfram.com/language/ref/FromContinuedFraction.html)
_OEIS_
[1](https://oeis.org/A039662)
