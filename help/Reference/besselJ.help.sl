# besselJ

- _besselJ(n, x)_

Answer the Bessel function of the first kind _Jn(x)_.

Evaluate at specific real values:

```
>>> 0.besselJ(5.2)
-0.11029

>>> 0.besselJ(4)
-0.39715
```

The first three zeros of _J0(x)_:

```
>>> [2.40483 5.52008 8.65373].collect { :x | 0.besselJ(x) }
[0 0 0]
```

Elementwise threading over lists and matrices:

```
>>> 1.besselJ([0.5 1 1.5])
[0.242268 0.440051 0.557937]
```

Plot _J0_ over a subset of the reals:

~~~
(0 -- 50).functionPlot { :x | 0.besselJ(x) }
~~~

Plot _J0_ for _(-1, 9)_, showing the first three zero crossings:

~~~
(-1 -- 9).functionPlot { :x | 0.besselJ(x) }
~~~

Plot _J1_ for _(0, 15)_, showing the first four zero crossings:

~~~
(0 -- 15).functionPlot { :x | 1.besselJ(x) }
~~~

Plot the intensity of the Fraunhofer diffraction pattern of a circular aperture versus diffraction angle:

~~~
(0.15 -- 1/3.pi).functionPlot { :theta |
	2 * ((besselJ1(20 * theta.sin) / (20 * theta.sin)) ^ 2)
}
~~~

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BesselFunctionoftheFirstKind.html)
[2](https://reference.wolfram.com/language/ref/BesselJ.html),
_W_
[1](https://en.wikipedia.org/wiki/Bessel_function)

Categories: Math
