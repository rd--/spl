# Quaternion

- _Quaternion(a, b, c, d)_
- _Quaternion([a, b, c, d])_

A `Type` representing a number in the quaternion number system.

A quaternion is a number:

```
>>> Quaternion(1, 2, 3, 4).isNumber
true
```

There is a list contructor form:

```
>>> Quaternion[1 2 3 4]
Quaternion(1, 2, 3, 4)

>>> Quaternion[
>>> 	1 2 3 4;
>>> 	2 3 4 5
>>> ]
[
	Quaternion(1, 2, 3, 4),
	Quaternion(2, 3, 4, 5)
]

>>> Quaternion[
>>> 	1 2 3 4;
>>> 	2 3 4 5
>>> 	:;
>>> 	3 4 5 6;
>>> 	5 6 7 8
>>> ]
[
	[
		Quaternion(1, 2, 3, 4),
		Quaternion(2, 3, 4, 5)
	],
	[
		Quaternion(3, 4, 5, 6),
		Quaternion(5, 6, 7, 8)
	]
]
```

𝕀, 𝑖, 𝑗 and 𝑘 are the basis quaternions,
and have the following basic multiplication rules:

```
>>> let [u, i, j, k] = Quaternion[
>>> 	1 0 0 0;
>>> 	0 1 0 0;
>>> 	0 0 1 0;
>>> 	0 0 0 1
>>> ];
>>> (
>>> 	u * u, i * i, j * j, k * k,
>>> 	i * j, j.- * i,
>>> 	j * k, k.- * j,
>>> 	k * i, i.- * k
>>> )
(
	u, -u, -u, -u,
	k, k,
	i, i,
	j, j
)
```

Basic arithemtic:

```
>>> let a = Quaternion[1 2 3 4];
>>> let b = Quaternion[2 3 4 5];
>>> let c = Quaternion[3 4 5 6];
>>> let d = 7;
>>> (
>>> 	a.absSquare, a.abs, a.norm,
>>> 	-a,
>>> 	a.conjugate,
>>> 	a + d,
>>> 	b + c,
>>> 	a * d,
>>> 	b * c,
>>> 	c * b
>>> )
(
	30, 30.sqrt, 30.sqrt,
	Quaternion[-1 -2 -3 -4],
	Quaternion[1 -2 -3 -4],
	Quaternion[8 2 3 4],
	Quaternion[5 7 9 11],
	Quaternion[7 14 21 28],
	Quaternion[-56 16 24 26],
	Quaternion[-56 18 20 28]
)
```

Convert a real number to a quaternion:

```
>>> let a = 3.141;
>>> let b = realToQuaternion(a);
>>> (b, b.real)
(Quaternion[3.141 0 0 0], 3.141)
```

Convert a complex number to a quaternion,
the `imaginary` part of a quaternion is a three-vector:

```
>>> let a = 3J4;
>>> let b = complexToQuaternion(a);
>>> (b, b.real, b.imaginary)
(
	Quaternion(3, 4, 0, 0),
	3,
	[4 0 0]
)
```

At matrix:

```
>>> Quaternion[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]
[
	Quaternion[1 0 0 0],
	Quaternion[0 1 0 0],
	Quaternion[0 0 1 0],
	Quaternion[0 0 0 1]
]
```

The matrix form of a quaternion number:

```
>>> let a = Quaternion[1 2 3 4];
>>> let b = a.matrixForm;
>>> (
>>> 	b,
>>> 	a.absSquare,
>>> 	b.determinant,
>>> 	a.real,
>>> 	b.trace / 2,
>>> 	a.conjugate.matrixForm,
>>> 	b.transpose
>>> )
(
	[1J2 3J4; -3J4 1J-2],
	30,
	30,
	1,
	1,
	[1J-2 -3J-4; 3J-4 1J2],
	[1J2 -3J4; 3J4 1J-2]
)
```

* * *

See also: Complex, Number

Guides: Quaternion Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Quaternion.html),
_W_
[1](https://en.wikipedia.org/wiki/Quaternion)
[2](https://en.wikipedia.org/wiki/Versor)
