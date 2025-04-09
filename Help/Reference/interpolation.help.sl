# interpolation

- _interpolation([y₁ y₂ …])_
- _interpolation([x₁ y₁ …; x₂ y₂ …; …])_

Answer an interpolation of the specified data set using the interpolator selected by a named method.
A spline interpolator is selected if no method is specified.

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
let f:/1 = y.interpolation('Akima');
(2 -- 30).functionPlot { :n |
	f(n) - f(n - 1)
}
~~~

![](sw/spl/Help/Image/interpolation-D.svg)

Interpolate a `TimeSeries`:

~~~spl svg=E
(1 -- 5).functionPlot(
	TimeSeries([4 1 3 2 5], [1 .. 5])
	.interpolation('CubicSpline')
)
~~~

![](sw/spl/Help/Image/interpolation-E.svg)

* * *

See also: akimaInterpolator, cubicSplineInterpolator, linearInterpolator, nearestNeighborInterpolator

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Interpolation.html)
