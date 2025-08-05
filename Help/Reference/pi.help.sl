# pi

- _pi(n)_

Answer _n_ times `pi`,
the ratio of a circles circumference to its diameter,
also called Archimedes’ constant,
and approximately equal to _3.14159_.

```
>>> 1.pi
3.14159

>>> 2 * 1.arcSin
1.pi

>>> 2.pi
6.28319
```

`pi` threads over collections:

```
>>> [0.5, 1.5].pi
[1.5708, 4.71239]
```

It is common to write fractional values of `pi` using `Fraction Literals`,
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

Sqyare and cube root approximations:

```
>>> [10.sqrt, 31.nthRoot(3), 3 + (2.sqrt / 10)]
[3.1623, 3.1414, 3.1414]
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

Viète’s formula, 1593:

```
>>> let k = 9;
>>> let a = { :n |
>>> 	(2 + n).sqrt
>>> }.nestList(2.sqrt, k);
>>> (a / 2).product
2 / 1.pi
```

Wallis product, 1656:

```
>>> let k = 1E3;
>>> 1:k.product { :n |
>>> 	let m = 4 * (n ^ 2);
>>> 	m / (m - 1)
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

Continued fraction:

```
>>> 1.pi.continuedFraction(13)
[3 7 15 1 292 1 1 1 2 1 3 1 14]

>>> 1.pi.continuedFraction(5)
>>> .convergents
[3 22/7 333/106 355/113 103993/33102]

>>> 1.pi.continuedFraction
>>> .semiconvergents(1E-2)
[2/1 3/1 13/4 16/5 19/6 22/7]
```

Euler’s identity:

```
>>> (1.e ^ 1.pi.i) + 1
0
```

`pi` is not defined as a constant, unlike `Infinity` and `NaN`.

Where supported `pi` is displayed as π.

* * *

See also: e, Infinity, NaN

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Pi.html),
OEIS
[1](https://oeis.org/A000796)
[2](https://oeis.org/A001203),
_Smalltalk_
5.6.8.10,
_W_
[1](https://en.wikipedia.org/wiki/Pi)
[2](https://en.wikipedia.org/wiki/Approximations_of_%CF%80)

Unicode: U+03C0 π Greek Small Letter Pi

Categories: Math, Constant
