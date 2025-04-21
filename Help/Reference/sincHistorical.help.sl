# sincHistorical

- _sincHistorical(z)_

The historical unnormalized sinc function.
_sincHistorical(z)_ is equivalent to _sin(z) / z_,
except at `zero` where it is `one`.

The argument is given in radians:

```
>>> 1/2.pi.sincHistorical
2 / 1.pi

>>> 3.5.sincHistorical
-0.10022
```

Threads elementwise over lists and matrices:

```
>>> (1.pi / [2 3 4]).sincHistorical
[
	2 / 1.pi,
	3 * 3.sqrt / 2.pi,
	2 * 2.sqrt / 1.pi
]
```

Plot:

~~~spl svg=A
(-10, -9.9 .. 10).sincHistorical.linePlot
~~~

![](sw/spl/Help/Image/sincHistorical-A.svg)

Single-slit diffraction pattern for a 4λ slit:

~~~spl svg=B
(-1 -- 1).functionPlot { :x |
	(
		(4.pi * x)
		/
		(1 + x.squared).sqrt
	).sincHistorical.squared
}
~~~

![](sw/spl/Help/Image/sincHistorical-B.svg)

The normalilzed sinc function multiplies the input by π (`pi`):

~~~spl svg=C
let z = (-10, -9.9 .. 10);
z.pi.sincHistorical.linePlot
~~~

![](sw/spl/Help/Image/sincHistorical-C.svg)

The unnormalized sinc function is also the zeroth spherical Bessel function.

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
