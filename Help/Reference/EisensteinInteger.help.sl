# EisensteinInteger

- _EisensteinInteger(a, b)_

A `Type` representing an Eisenstein integer.

Find the norm of an Eisenstein integer:

```
>>> EisensteinInteger(3, 7)
>>> .norm
37

>>> EisensteinInteger(3, 7)
>>> .toComplex
-0.5000J6.0622

>>> let w = (-1 + (0J1 * 3.sqrt)) / 2;
>>> 3 + (7 * w)
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

[

The absolute value of an Eisenstein number is the same as that of the complex number equivalent:

```
>>> let n = EisensteinInteger(3, 7);
>>> (n.abs, n.toComplex.abs)
(37.sqrt, 37.sqrt)
```

Plot Eisenstein integer primes on the complex plane:

~~~spl svg=A
{ :a :b |
	let c = EisensteinInteger(a, b);
	c.isPrime.if {
		c.toComplex.realImaginary
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
