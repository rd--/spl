# sinc

- _sinc(z)_

The historical unnormalized `sinc` function.
_sinc(z)_ is equivalent to _sin(z) / z_, except at `zero` where it is `one`.

The argument is given in radians:

```
>>> 1/2.pi.sinc
2 / 1.pi

>>> 3.5.sinc
-0.10022
```

Sinc threads elementwise over lists and matrices:

```
>>> (1.pi / [2 3 4]).sinc
[
	2 / 1.pi,
	3 * 3.sqrt / 2.pi,
	2 * 2.sqrt / 1.pi
]
```

Plot:

~~~spl svg=A
(-10, -9.9 .. 10).sinc.linePlot
~~~

![](sw/spl/Help/Image/sinc-A.svg)

Single-slit diffraction pattern for a 4λ slit:

~~~spl svg=B
(-1 -- 1).functionPlot { :x |
	(
		(4.pi * x)
		/
		(1 + x.squared).sqrt
	).sinc.squared
}
~~~

![](sw/spl/Help/Image/sinc-B.svg)

The normalilzed sinc function multiplies the input by π (`pi`):

~~~spl svg=C
let z = (-10, -9.9 .. 10);
z.pi.sinc.linePlot
~~~

![](sw/spl/Help/Image/sinc-C.svg)

The unnormalized `sinc` function is also the zeroth spherical Bessel function.

* * *

See also: dirichletKernel, sin, sincNormalized

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SincFunction.html)
[2](https://reference.wolfram.com/language/ref/Sinc.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/sinc.html),
_W_
[1](https://en.wikipedia.org/wiki/Sinc_function)

Categories: Math, Trigonometry
