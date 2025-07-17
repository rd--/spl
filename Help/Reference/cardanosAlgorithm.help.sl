# cardanosAlgorithm

- _cardanosAlgorithm(a, b, c, d)_

Gerolamo Cardano is credited with publishing the first formula for solving cubic equations,
attributing it to Scipione del Ferro and Niccolo Fontana Tartaglia.

The coefficients are provided in descending order.

Solve cubic equations having three integer answers:

```
>>> cardanosAlgorithm(1, -6, 11, -6)
[3 2 1]

>>> [3 2 1].collect { :x |
>>> 	[
>>> 		1 * x.cubed,
>>> 		-6 * x.squared,
>>> 		11 * x,
>>> 		-6
>>> 	].sum
>>> }
[0 0 0]

>>> cardanosAlgorithm(1, -5, -2, 24)
[4 -2 3]

>>> cardanosAlgorithm(1, 0, -7, -6)
[3 -2 -1]

>>> cardanosAlgorithm(1, -4, -9, 36)
[4 -3 3]

>>> cardanosAlgorithm(1, 3, -6, -8)
[2 -1 -4]

>>> cardanosAlgorithm(1, 2, -21, 18)
[3 -6 1]

>>> cardanosAlgorithm(1, 9, 26, 24)
[-2 -3 -4]
```

Solve cubic equations having two integer answers:

```
>>> cardanosAlgorithm(1, -5, 8, -4)
[1 2]

>>> cardanosAlgorithm(1, 2, -20, 24)
[-6 2]
```

Solve cubic equations having one integer answers:

```
>>> cardanosAlgorithm(1, 3, 3, 1)
[-1 -1]

>>> cardanosAlgorithm(1, -3, 3, -1)
[1 1]

>>> cardanosAlgorithm(-1, 3, -3, 1)
[1 1]
```

Solve cubic equations having three real answers:

```
>>> cardanosAlgorithm(-6, 11, -6, 1)
[1 1/3 1/2]

>>> cardanosAlgorithm(2, 9, 3, -4)
[1/2 -4 -1]

>>> cardanosAlgorithm(1, 4, 1, -5)
[0.9122 -3.1987 -1.7135]

>>> cardanosAlgorithm(1, -3, -1, 1)
[3.2143 -0.6751 0.4608]
```

Solve cubic equations having two real answers:

```
>>> cardanosAlgorithm(-4, 8, -5, 1)
[1 1/2]
```

Solve cubic equations having one real and two complex answers:

```
>>> cardanosAlgorithm(1, 4, 7, 6)
[
	-2,
	-1.j(2.sqrt),
	-1.j(2.sqrt.-)
]

>>> cardanosAlgorithm(1, 2, 3, 4)
[
	-1.65063
	-0.17469J1.54687
	-0.17469J-1.546867
]

>>> cardanosAlgorithm(1, 0, 0, -5)
[
	5 ^ 1/3,
	-0.85499J1.48088,
	-0.85499J-1.48088
]

>>> cardanosAlgorithm(1, 4, -8, 7)
[
	-5.63887,
	0.81944J0.75492,
	0.81944J-0.75492
]

>>> cardanosAlgorithm(2, -3, -4, -35)
[
	3.5
	-1J2
	-1J-2
]

>>> cardanosAlgorithm(1, 1, 1, -3)
>>> .select(isReal:/1)
[1]

>>> cardanosAlgorithm(1, -6, -6, -7)
>>> .select(isReal:/1)
[7]
```

* * *

See also: UnivariatePolynomial

References:
_W_
[1](https://en.wikipedia.org/wiki/Cubic_equation)
