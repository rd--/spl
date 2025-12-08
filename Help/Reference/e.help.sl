# e

- _e(n, m)_

Answer _n_ times `e`.
The number `e`,
also known as Euler’s number or Napier’s constant
is a mathematical constant approximately equal to 2.71828.
It is the base of natural logarithms.

```
>>> 1.e
2.71828

>>> 1.exp
1.e

>>> 1.e.log
1

>>> 2.e
5.43656

>>> 3.e
8.15485
```

`e` threads over lists:

```
>>> [0.5 1.5].e
[1.35914 4.07742]
```

_e_ raised to _iπ_ plus `one` is `zero`,
Euler’s formula and Euler’s identity:

```
>>> (1.e ^ 1.pi.i) + 1
0

>>> 1.pi.cos + (1.i * 1.pi.sin) + 1
0

>>> -1J0.log
1.pi.i
```

Expressions that approach _e_:

```
>>> let n = 1E4;
>>> (1 + (1 / n)) ^ n
1.e

>>> let n = 10;
>>> (1 / [0 .. n].!).sum
1.e
```

The continued fraction of _e_ is regular,
OEIS [A003417](https://oeis.org/A003417):

```
>>> 1.e.continuedFraction(20)
[
	2 1 2 1 1 4 1 1 6
	1 1 8 1 1 10 1 1 12
	1 1
]
```

A Beatty sequence,
OEIS [A000062](https://oeis.org/A000062):

```
>>> 1:21.collect { :n |
>>> 	(n / (1.e - 2)).floor
>>> }
[
	 1  2  4  5  6  8  9 11 12 13
	15 16 18 19 20 22 23 25 26 27
	29
]
```

The graph of _eˣ_ has gradient `one` at `zero`:

~~~spl svg=A
(-2 -- 1).functionPlot([
	{ :x | x + 1 },
	{ :x | 1.e ^ x }
])
~~~

![](sw/spl/Help/Image/e-A.svg)

The binary case answers a `Decimal` value with _m_ decimal places:

```
>>> 1.e(34)
2.7182818284590452353602874713526624D
```

`e` is also stored as a named constant with higher precision,
and this stored value gives the upper limit for _m_,
OEIS [A001113](https://oeis.org/A001113):

```
>>> let n = 'E';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(2.71828, 104)
```

Scatter plot of the digits of `e`:

~~~spl svg=B
1.e(104)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/e-B.svg)

The continued fraction at the higher precision decimal constant is accurate to many more places:

```
>>> 1.e(104).continuedFraction(90)
[
	2 1  2 1 1  4 1 1  6
	1 1  8 1 1 10 1 1 12
	1 1 14 1 1 16 1 1 18
	1 1 20 1 1 22 1 1 24
	1 1 26 1 1 28 1 1 30
	1 1 32 1 1 34 1 1 36
	1 1 38 1 1 40 1 1 42
	1 1 44 1 1 46 1 1 48
	1 1 50 1 1 52 1 1 54
	1 1 56 1 1 58 1 1 60
]
```

_e_ is also a part of the `Scientific Notation` for `Number Syntax`,
however in that context an upper case _E_ is ordinary.

There is also an `E` method that answers the scientific notation _m×10ⁿ_:

```
>>> 1.E(6)
1E6

>>> 1.E(-6)
1E-6
```

Threads over lists:

```
>>> [0 0.1 0.2 0.3 0.4 0.5 0.75 1.0].E(2)
[0 10 20 30 40 50 75 100]
```

* * *

See also: exp, log, pi

Guides: Mathematical Constants, Number Syntax, Scientific Notation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/e.html),
_OEIS_
[1](https://oeis.org/A001113)
[2](https://oeis.org/A003417),
_Smalltalk_
5.6.8.2

Categories: Math, Constant
