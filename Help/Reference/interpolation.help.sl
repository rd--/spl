# interpolation

- _interpolation([y...] | [[x, y]...])_

Answer an interpolation of the specified data set using a spline interpolator.

Interpolate a vector of _y_ values,
_x_ is understood to be the integers from `one`:

~~~spl svg=A
let y = [1 2 3 5 8 5];
(1 -- 6).functionPlot(
	y.interpolation
)
~~~

![](sw/spl/Help/Image/interpolation-A.svg)

Interpolate between points at arbitrary _(x, y)_ values:

~~~spl svg=B
let p = [0 0; 0.1 0.3; 0.5 0.6; 1 -0.2; 2 3];
(0 -- 2).functionPlot(
	p.interpolation
)
~~~

![](sw/spl/Help/Image/interpolation-B.svg)

Interpolate through a set of _(x, y)_ points with a spline:

~~~spl svg=C
let y = [0 0; 1 2; -1 3; 0 1; 3 0];
let x = [1 .. y.size];
(1 -- y.size).functionPlot(
	[x, y]
	.transposed
	.interpolation
)
~~~

![](sw/spl/Help/Image/interpolation-C.svg)

Interpolate the sequence of primes:

~~~spl svg=D
let y = 30.primesList;
let f:/1 = y.interpolation;
(2 -- 30).functionPlot { :n |
	f(n) - f(n - 1)
}
~~~

![](sw/spl/Help/Image/interpolation-D.svg)

* * *

See also: akimaInterpolator, linearInterpolator, splineInterpolator

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Interpolation.html)
