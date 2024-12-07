# sinc

- _sinc(z)_

The historical unnormalized `sinc` function.
_sinc(z)_ is equivalent to _sin(z) / z_, except at zero where it is one.

The argument is given in radians:

```
>>> (pi / 2).sinc
(2 / pi)

>>> 3.5.sinc
-0.10022
```

Sinc threads elementwise over lists and matrices:

```
>>> (pi / [2 3 4]).sinc
[
	2 / pi,
	3 * 3.sqrt / 2.pi,
	2 * 2.sqrt / pi
]
```

Plot:

~~~
(-10, -9.9 .. 10).sinc.linePlot
~~~

![](sw/spl/Help/Image/sinc-A.svg)

Single-slit diffraction pattern for a 4λ slit:

~~~
(-1 -- 1).functionPlot { :x |
	(
		(4 * pi * x)
		/
		(1 + x.squared).sqrt
	).sinc.squared
}
~~~

![](sw/spl/Help/Image/sinc-B.svg)

The normalilzed sinc function multiplies the input by π (`pi`):

~~~
let z = (-10, -9.9 .. 10);
(z * pi).sinc.linePlot
~~~

![](sw/spl/Help/Image/sinc-C.svg)

The unnormalized `sinc` function is also the zeroth spherical Bessel function.

* * *

See also: sin, sincNormalized

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SincFunction.html)
[2](https://reference.wolfram.com/language/ref/Sinc.html)
_W_
[1](https://en.wikipedia.org/wiki/Sinc_function)

Categories: Math, Trigonometry
