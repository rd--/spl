# pi

- _pi(n, m)_

Answer _n_ times `pi`,
the ratio of a circles circumference to its diameter,
also called Archimedes’ constant,
and approximately equal to _3.14159_.

Decimal expansion of π,
OEIS [A000796](https://oeis.org/A000796):

```
>>> 1.pi
3.141592653589793
```

Relation to `arcSin`:

```
>>> 2 * 1.arcSin
1.pi
```

Decimal expansion of 2π,
called `tau` (τ),
OEIS [A019692](https://oeis.org/A019692):

```
>>> 2.pi
6.283185307179586
```

`pi` threads over collections:

```
>>> [0.5 1.5 2].pi
[1.5708 4.71239 6.283185]
```

It is common to write fractional values of `pi` using `Fraction Syntax`,
which can be confusing if one is not aware of the distinction between _x / y_ and _x/y_:

```
>>> 1/2.pi
1.5708

>>> (1 / 2).pi
1.5708

>>> 1.pi / 2
1.5708

>>> 1 / 2.pi
0.15915
```

Fractions approximating π:

```
>>> [3 7].fromContinuedFraction
22/7

>>> let x = 22/7;
>>> (x, (x - 1.pi) / 1.pi * 100)
(3.14286, 0.040250)

>>> 3 + (1 / (7 + (1 / (15 + 1/1))))
355/113

>>> let x = 355/113;
>>> (x, (x - 1.pi) / 1.pi * 100)
(3.141593, 0.000009)

>>> let x = 3 + 8/60 + 30/3600;
>>> (x, (x - 1.pi) / 1.pi * 100)
(377/120, 0.002356)
```

Square and cube root approximations:

```
>>> [
>>> 	10.sqrt,
>>> 	31.nthRoot(3),
>>> 	3 + (2.sqrt / 10)
>>> ]
[3.1623, 3.1414, 3.1414]
```

Approximation accurate to fifteen decimal places:

```
>>> 3 / 163.sqrt * 640320.log
3.141592653589793
```

Approximation by Kochański, 1685:

```
>>> (40/3 - (2 * 3.sqrt)).sqrt
3.14154
```

Approximation by Ramanujan, 1910:

```
>>> let x = 9801 / (2206 * 2.sqrt);
>>> (x, (x - 1.pi) / 1.pi * 100)
(3.1415927, 0.000002)
```

Approximation by Hobson, 1913:

```
>>> 6/5 * (1 + 1.goldenRatio)
3.1416
```

Approximation by Ramanujan, 1914:

```
>>> (2143 / 22).nthRoot(4)
3.14159265
```

Arc tangent:

```
>>> (4 * (1 / 5).arcTan)
>>> -
>>> (1 / 239).arcTan
1/4.pi

>>> (5 * (1 / 7).arcTan)
>>> +
>>> (2 * (3 / 79).arcTan)
1/4.pi
```

An infinite series by Nilakantha, 15th century:

```
>>> let k = 47;
>>> 3 + 1:k.sum { :n |
>>> 	let m = n * 2;
>>> 	let z = 0 - (-1 ^ n);
>>> 	(4 * z) / (m + [0 1 2]).product
>>> }
1.pi
```

[Viète’s formula](https://en.wikipedia.org/wiki/Vi%C3%A8te%27s_formula), 1593:

```
>>> let k = 9;
>>> let a = { :n |
>>> 	(2 + n).sqrt
>>> }.nestList(2.sqrt, k);
>>> (a / 2).product
2 / 1.pi
```

[Wallis product](https://en.wikipedia.org/wiki/Wallis_product), 1656:

```
>>> let k = 1E3;
>>> 1:k.product { :n |
>>> 	let m = 4 * (n ^ 2);
>>> 	m / (m - 1)
>>> } * 2
3.141

>>> let k = 1E3;
>>> 1:k.product { :n |
>>> 	let m = 2 * n;
>>> 	(m / (m - 1)) * (m / (m + 1))
>>> } * 2
3.141
```

An infinite series by Ramanujan, 1910:

```
>>> let k = 2;
>>> let a = (2 * 2.sqrt) / 9801;
>>> let b = 0:k.sum { :n |
>>> 	((4 * n).! * (1103 + (26390 * n)))
>>> 	/
>>> 	((n.! ^ 4) * (396 ^ (4 * n)))
>>> };
>>> 1 / (a * b)
1.pi
```

Continued fraction for π,
OEIS [A001203](https://oeis.org/A001203)

```
>>> 1.pi.continuedFraction(13)
[3 7 15 1 292 1 1 1 2 1 3 1 14]
```

Convergents for π:

```
>>> 1.pi.continuedFraction(5)
>>> .convergents
[3 22/7 333/106 355/113 103993/33102]
```

Numerators of convergents to π,
OEIS [A002485](https://oeis.org/A002485),
also
OEIS [A046947](https://oeis.org/A046947):

```
>>> 1.pi.continuedFraction(7)
>>> .convergents.numerator
[3 22 333 355 103993 104348 208341]
```

Denominators of convergents to π,
OEIS [A002486](https://oeis.org/A002486):

```
>>> 1.pi.continuedFraction(8)
>>> .convergents.denominator
[1 7 106 113 33102 33215 66317 99532]
```

Semiconvergents for π:

```
>>> 1.pi.continuedFraction
>>> .semiconvergents(1E-6)
[
	2/1 3/1 13/4 16/5 19/6
	22/7 179/57 201/64 223/71 245/78
	267/85 289/92 311/99 333/106 355/113
]
```

Euler’s identity:

```
>>> (1.e ^ 1.pi.i) + 1
0
```

A number that is, to within the available precision, an integer:

```
>>> 163.sqrt.pi.exp
2.6253741264076826E17
```

The binary case answers a `Decimal` value with _m_ decimal places:

```
>>> 1.pi(34)
3.1415926535897932384626433832795028D
```

π is also stored as a named constant with higher precision,
and this stored value gives the upper limit for _m_,
OEIS [A000796](https://oeis.org/A000796):

```
>>> let n = 'Pi';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(3.141593, 104)
```

Simple continued fraction expansion of π,
OEIS [A001203](https://oeis.org/A001203):

```
>>> 1.pi(104)
>>> .continuedFraction
[
	3 7 15 1 292 1 1 1 2 1
	3 1 14 2 1 1 2 2 2 2
	1 84 2 1
]
```

At `SmallFloat` the continued fraction expansion is accurate to thirteen places:

```
>>> 1.pi.continuedFraction(13)
[3 7 15 1 292 1 1 1 2 1	3 1 14]
```

Continued fraction for π/4,
OEIS [A070989](https://oeis.org/A070989):

```
>>> 1/4.pi(104)
>>> .continuedFraction
[
	0 1 3 1 1 1 15 2 72 1
	9 1 17 1 2 1 5 1 1 10
	1 2 2 20
]
```

Almost integer:

```
>>> 22 * (1.pi ^ 4)
2143.00000
```

The Base-13 expansion of `pi`,
OEIS [A068438](https://oeis.org/A068438):

```
>>> 1.pi(98).realDigits(13, 88).first
[
	 3  1 10 12  1  0  4  9  0  5
	 2 10  2 12  7  7  3  6  9 12
	 0 11 11  8  9 12 12  9  8  8
	 3  2  7  8  2  9  8  3  5  8
	11  3  7  0  1  6  0  3  0  6
	 1  3  3 12 10  5 10 12 11 10
	 5  7  6  1  4 11  6  5 11  4
	 1  0  0  2  0 12  2  2 11  4
	12  7  1  4  5  7 10  9
]
```

The Base-60 (Babylonian or sexagesimal) expansion of `pi`
OEIS [A060707](https://oeis.org/A060707):

```
>>> 1.pi(104).realDigits(60, 58).first
[
	 3  8 29 44  0 47 25 53  7 24
	57 36 17 43  4 29  7 10  3 41
	17 52 36 12 14 36 44 51 50 15
	33  7 23 59  9 13 48 22 12 21
	45 22 56 47 39 44 28 37 58 23
	21 11 56 33 22 40 42 31
]
```

Scatter plot of the digits of π,
OEIS [A000796](https://oeis.org/A000796):

~~~spl svg=A oeis=A000796 constant
1.pi(104)
.integerDigits
.scatterPlot
~~~

![](Help/Image/pi-A.svg)

Scatter plot of the digits of _π^2/9_,
OEIS [A100044](https://oeis.org/A100044):

~~~spl svg=B oeis=A100044 constant
'Pi^2/9'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](Help/Image/pi-B.svg)

Scatter plot of the digits of _π/4_,
OEIS [A003881](https://oeis.org/A003881):

~~~spl svg=C oeis=A003881 constant
1/4.pi(104).integerDigits.scatterPlot
~~~

![](Help/Image/pi-C.svg)

`pi` is not defined as a constant, unlike `Infinity` and `NaN`.

Where supported `pi` is displayed as π.

* * *

See also: e, Infinity, NaN, tau

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Pi.html),
_OEIS_
[1](https://oeis.org/A000796)
[2](https://oeis.org/A001203)
[3](https://oeis.org/A002485)
[4](https://oeis.org/A002486)
[5](https://oeis.org/A100044),
_Smalltalk_
5.6.8.10,
_W_
[1](https://en.wikipedia.org/wiki/Pi)
[2](https://en.wikipedia.org/wiki/Approximations_of_%CF%80)

Unicode: U+03C0 π Greek Small Letter Pi, U+03C4 τ Greek Small Letter Tau

Categories: Math, Constant
