# EisensteinInteger

- _EisensteinInteger(a, b)_
- _EisensteinInteger([a, b])_

A `Type` representing an Eisenstein integer.

Find the norm of an Eisenstein integer:

```
>>> EisensteinInteger(3, 7)
>>> .norm
37

>>> EisensteinInteger(3, 7)
>>> .toComplex
-0.5000J6.0622

>>> EisensteinInteger(3, 7)
>>> .realImaginary
[-0.5 6.0622]

>>> 3 + 7.eisensteinOmega
-0.5000J6.0622

>>> EisensteinInteger(3, 7)
>>> .toComplex
>>> .norm
37.sqrt
```

Find its conjugate:

```
>>> EisensteinInteger(3, 7)
>>> .conjugate
EisensteinInteger(-4, -7)

>>> EisensteinInteger(3, 7)
>>> .toComplex
>>> .conjugate
-0.5000J-6.0622

>>> EisensteinInteger(-4, -7)
>>> .toComplex
-0.5000J-6.0622
```

Verify that the norm is the product of the number and its conjugate:

```
>>> let n = EisensteinInteger(3, 7);
>>> n * n.conjugate
EisensteinInteger(37, 0)

>>> let i = EisensteinInteger(3, 7);
>>> let n = i.toComplex;
>>> n * n.conjugate
37J0
```

The absolute value of an Eisenstein number is the same as that of the complex number equivalent:

```
>>> let n = EisensteinInteger(3, 7);
>>> (n.abs, n.toComplex.abs)
(37.sqrt, 37.sqrt)
```

Some non-real Eisenstein primes:

```
>>> EisensteinInteger(2, 1).isPrime
true

>>> EisensteinInteger(2, 1).imaginary
0.8660

>>> EisensteinInteger(7, 3).isPrime
true

>>> EisensteinInteger(7, 3).imaginary
2.5981
```

Threads over lists:

```
>>> EisensteinInteger(1, [3 5 7])
[
	EisensteinInteger(1, 3),
	EisensteinInteger(1, 5),
	EisensteinInteger(1, 7)
]

>>> EisensteinInteger([1 3 5], 7)
[
	EisensteinInteger(1, 7),
	EisensteinInteger(3, 7),
	EisensteinInteger(5, 7)
]
```

Adapts to math with `Complex`:

```
>>> EisensteinInteger(5, 7).toComplex
1.5J6.0622

>>> 3J2 * EisensteinInteger(5, 7)
-7.6244J21.1865

>>> EisensteinInteger(5, 7) * 3J2
-7.6244J21.1865
```

The unary form maps over appropriately shaped arrays:

```
>>> EisensteinInteger[1 2]
EisensteinInteger(1, 2)

>>> EisensteinInteger[1 2; 3 4]
[
	EisensteinInteger(1, 2),
	EisensteinInteger(3, 4)
]

>>> EisensteinInteger[1 2; 3 4:; 5 6; 7 8]
[
	[
		EisensteinInteger(1, 2),
		EisensteinInteger(3, 4)
	],
	[
		EisensteinInteger(5, 6),
		EisensteinInteger(7, 8)
	]
]
```

Plot Eisenstein integer primes on the complex plane:

~~~spl svg=A
{ :a :b |
	let c = EisensteinInteger(a, b);
	c.isPrime.if {
		c.realImaginary
	} {
		nil
	}
}.table(-23:23, -23:23)
.catenate
.deleteMissing
.scatterPlot
~~~

![](Help/Image/EisensteinInteger-A.svg)

The Eisenstein integers form a triangular lattice in the complex plane,
in contrast with the Gaussian integers, which form a square lattice in the complex plane:

~~~spl svg=B
EisensteinInteger/2
.table(-13:13, -13:13)
.catenate
.collect! { :e |
	e.realImaginary
}.scatterPlot
~~~

![](Help/Image/EisensteinInteger-B.svg)

Plot Eisenstein primes on a linear _(a,b)_ grid:

~~~spl svg=C
{ :a :b |
	EisensteinInteger(a, b).isPrime.boole
}.table(-10:10, -10:10).matrixPlot
~~~

![](Help/Image/EisensteinInteger-C.svg)

* * *

See also: Complex, Integer, isGaussianInteger, isInteger

Guides: Complex Number Functions, Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EisensteinInteger.html),
_W_
[1](https://en.wikipedia.org/wiki/Eisenstein_integer)

Categories: Math
