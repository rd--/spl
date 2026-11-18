# besselJ

- _besselJ(n, x)_

Answer the Bessel function of the first kind _Jn(x)_.

Evaluate at specific real values:

```
>>> 0L.besselJ(5.2)
-0.11029

>>> 0L.besselJ(4.0)
-0.39715

>>> 2L.besselJ(2.0)
0.3528
```

The first three zeroes of _J0(x)_:

```
>>> [2.405 5.520 8.654].collect { :x |
>>> 	0L.besselJ(x)
>>> }
[0 0 0]
```

Elementwise threading over lists and matrices:

```
>>> 1L.besselJ([0.5 1.0 1.5])
[0.242268 0.440051 0.557937]
```

Plot _J0_ over a subset of the reals:

~~~spl svg=A
(0.0 -- 50.0).functionPlot { :x |
	0L.besselJ(x)
}
~~~

![](Help/Image/besselJ-A.svg)

Plot _J0_ for _(-1, 9)_, showing the first three zero crossings:

~~~spl svg=B
(-1.0 -- 9.0).functionPlot { :x |
	0L.besselJ(x)
}
~~~

![](Help/Image/besselJ-B.svg)

Plot _J1_ for _(0, 15)_, showing the first four zero crossings:

~~~spl svg=C
(0.0 -- 15.0).functionPlot { :x |
	1L.besselJ(x)
}
~~~

![](Help/Image/besselJ-C.svg)

Plot the intensity of the Fraunhofer diffraction pattern of a circular aperture versus diffraction angle:

~~~spl svg=D
(0.15 -- 1/3.pi).functionPlot { :theta |
	let a = 1L.besselJ(20.0 * theta.sin);
	let b = 20.0 * theta.sin;
	2.0 * ((a / b) ^ 2.0)
}
~~~

![](Help/Image/besselJ-D.svg)

* * *

See also: besselI, besselY

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BesselFunctionoftheFirstKind.html)
[2](https://reference.wolfram.com/language/ref/BesselJ.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/besselj.html),
_W_
[1](https://en.wikipedia.org/wiki/Bessel_function)

Categories: Math
