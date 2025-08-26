# e

- _e(n)_

In the unary case,
answer _n_ times `e`.
The number `e`,
also known as Euler’s number or Napier’s constant
is a mathematical constant approximately equal to 2.71828.
It is the base of natural logarithms.

Answer _n_ times `e`.

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

In the binary case,
answer the scientific notation _m×10ⁿ_:

```
>>> 1.e(6)
1E6

>>> 1.e(-6)
1E-6
```

The binary form likewise threads over lists:

```
>>> [0 0.1 0.2 0.3 0.4 0.5 0.75 1.0].e(2)
[0 10 20 30 40 50 75 100]
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

The continued fraction of _e_ is regular:

```
>>> 1.e.continuedFraction(20)
[2 1 2 1 1 4 1 1 6 1 1 8 1 1 10 1 1 12 1 1]
```

The graph of _eˣ_ has gradient `one` at `zero`:

~~~spl svg=A
(-2 -- 1).functionPlot([
	{ :x | x + 1 },
	{ :x | 1.e ^ x }
])
~~~

![](sw/spl/Help/Image/e-A.svg)

_e_ is also a part of the `Scientific Notation` for `Number Literals`,
however in that context an upper case _E_ is ordinary.

* * *

See also: exp, log, pi

Guides: Mathematical Constants, Number Literals, Scientific Notation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/e.html),
_Smalltalk_
5.6.8.2

Categories: Math, Constant
