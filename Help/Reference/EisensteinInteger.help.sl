# EisensteinInteger

- _EisensteinInteger(a, b)_

A `Type` representing an Eisenstein integer.

Find the norm of an Eisenstein integer:

```
>>> EisensteinInteger(3, 7).norm
37

>>> EisensteinInteger(3, 7).asComplex.norm
37.sqrt
```

Find its conjugate:

```
>>> EisensteinInteger(3, 7).conjugated
EisensteinInteger(-4, -7)

>>> EisensteinInteger(3, 7).asComplex.conjugated
EisensteinInteger(-4, -7).asComplex
```

Verify that the norm is the product of the number and its conjugate:

```
>>> let n = EisensteinInteger(3, 7);
>>> n * n.conjugated
EisensteinInteger(37, 0)

>>> let n = EisensteinInteger(3, 7).asComplex;
>>> n * n.conjugated
37J0
```

The absolute value of an Eisenstein number is the same as that of the complex number equivalent:

```
>>> let n = EisensteinInteger(3, 7);
>>> (n.abs, n.asComplex.abs)
(37.sqrt, 37.sqrt)
```

Plot Eisenstein integer primes on the complex plane:

~~~spl svg=A
{ :a :b |
	let c = EisensteinInteger(a, b);
	c.isPrime.if {
		c.asComplex.asList
	} {
		nil
	}
}.table(-23:23, -23:23)
.flatten(1)
.select(notNil:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/EisensteinInteger-A.svg)

* * *

See also: Complex, isInteger

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EisensteinInteger.html),
_W_
[1](https://en.wikipedia.org/wiki/Eisenstein_integer)

Categories: Math
