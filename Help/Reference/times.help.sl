# times

- _m * n_

Answer the number _m_ multiplied by _n_.
The operator form is `*`.

```
>>> 2 * 3 * 4
24

>>> -5 * 12
-60
```

Threads element-wise over lists:

```
>>> 2 * [3 4 5]
[6 8 10]

>>> [2 3 4] * 5
[10 15 20]

>>> [1 2 3] * [4 5 6]
[4 10 18]

>>> 1:6 * 142857
[
	142857
	285714
	428571
	571428
	714285
	857142
]
```

Vector times matrix:

```
>>> [-1 0 1] * [1 2; 3 4; 5 6]
[[-1, -2], [0, 0], [5, 6]]

>>> [-1 1] * [1 2; 3 4; 5 6]
[-1 -2; 3 4; -5 -6]
```

Matrix times vector:

```
>>> [1 2; 3 4; 5 6] * [-1 0 1]
[-1 -2; 0 0; 5 6]

>>> [1 2; 3 4; 5 6] * [-1 1]
[-1 -2; 3 4; -5 -6]
```

Matrix times matrix:

```
>>> [1 2; 3 4] * [1 0; 3 2]
[1 0; 9 8]

>>> [1 2; 3 4; 5 6] * [-1 1; 0 0; 1 -1]
[-1 2; 0 0; 5 -6]

>>> [1 2; 3 4; 5 6] * [-1 1; 1 -1]
[-1 2; 3 -4; -5 6]
```

For the matrix product see `dot`:

```
>>> [1 2; 3 4].dot([1 0; 3 2])
[7 4; 15 8]
```

As argument to `reduce`:

```
>>> 1:9.reduce(*)
362880
```

Evaluate using both apply and method send syntaxes:

```
>>> *(3, 4)
12

>>> 3.*(4)
12
```

_3n_,
OEIS [A008585](https://oeis.org/A008585):

```
>>> 3 * 0:13
[0 3 6 9 12 15 18 21 24 27 30 33 36 39]
```

_3n+1_,
OEIS [A016777](https://oeis.org/A016777):

```
>>> 3 * 0:13 + 1
[1 4 7 10 13 16 19 22 25 28 31 34 37 40]
```

At `Symbol`:

```
>> `m` * `n`
(* m n)
```

Multiples of ten,
OEIS [A008592](https://oeis.org/A008592):

```
>>> 0:11 * 10
[0 10 20 30 40 50 60 70 80 90 100 110]
```

Multiples of five,
OEIS [A008587](https://oeis.org/A008587):

```
>>> 0:11 * 5
[0 5 10 15 20 25 30 35 40 45 50 55]
```

Multiples of eight,
OEIS [A008590](https://oeis.org/A008590):

```
>>> 0:11 * 8
[0 8 16 24 32 40 48 56 64 72 80 88]
```

Multiples of nine,
OEIS [A008591](https://oeis.org/A008591):

```
>>> 0:11 * 9
[0 9 18 27 36 45 54 63 72 81 90 99]
```

_4n+1_,
OEIS [A016813](https://oeis.org/A016813):

```
>>> (4 * 0:13) + 1
[1 5 9 13 17 21 25 29 33 37 41 45 49 53]

>>> [1, 5 .. 53]
[1 5 9 13 17 21 25 29 33 37 41 45 49 53]

>>> [2 -1].linearRecurrence([1 5], 14)
[1 5 9 13 17 21 25 29 33 37 41 45 49 53]
```

_12n+5_,
OEIS [A017581](https://oeis.org/A017581):

```
>>> (12 * 0:11) + 5
[5 17 29 41 53 65 77 89 101 113 125 137]

>>> [5, 17 .. 137]
[5 17 29 41 53 65 77 89 101 113 125 137]

>>> [2 -1].linearRecurrence([5 17], 12)
[5 17 29 41 53 65 77 89 101 113 125 137]
```

Plot multiples of each the integers up to _n_ extending to _m_,
the _y_ coordinate is given by the multiplier:

~~~spl svg=A
let m = 40;
let n = 20;
1:n.collect { :y |
	let k = m // y;
	(1:k * y).collect { :x |
		[x y]
	}
}.scatterPlot
~~~

![](Help/Image/times-A.svg)

* * *

See also: *, +, -, /, ^, cross, divide, dot, product, sign

Guides: Arithmetic Functions, Binary Operators

References:
_Apl_
[1](https://aplwiki.com/wiki/Times),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:-42-),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/star),
_Mathematica_
[1](https://mathworld.wolfram.com/Times.html)
[2](https://reference.wolfram.com/language/ref/Times.html),
_Smalltalk_
5.6.2.1,
_W_
[1](https://en.wikipedia.org/wiki/Multiplication)
[2](https://en.wikipedia.org/wiki/Hadamard_product_(matrices))

Categories: Math, Operator
