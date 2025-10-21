# sphericalPlot

- _sphericalPlot([θ𐞪 ϕ𐞪], f:/2)_

Answer a plot with a spherical radius _r_ as a function of spherical coordinates _θ_ and _ϕ_,
ranging over the specified intervals _θ𐞪_ and _ϕ𐞪_.

A sphere:

~~~spl svg=A
[0 1.pi; 0 2.pi].sphericalPlot { :theta :phi |
	1
}
~~~

![](sw/spl/Help/Image/sphericalPlot-A.svg)

A spiraling shell:

~~~spl svg=B
[0 1.pi; 0 3.pi].sphericalPlot { :theta :phi |
	theta
}
~~~

![](sw/spl/Help/Image/sphericalPlot-B.svg)

A spherical surface:

~~~spl svg=C
[0 1.pi; 0 2.pi].sphericalPlot { :theta :phi |
	1 + (2 * (2 * phi).cos)
}
~~~

![](sw/spl/Help/Image/sphericalPlot-C.svg)

An segment of an oscillating piecewise spherical surface:

~~~spl svg=D
[0 1.pi; 0 3/4.pi]
.sphericalPlot { :theta :phi |
	let a = (10 * phi) / 1.pi;
	1 + (a.fractionalPart / 5)
}
~~~

![](sw/spl/Help/Image/sphericalPlot-D.svg)

A segment of a φ² sperical surface:

~~~spl svg=E
[0 1.pi; 0.pi 3/4.pi]
.sphericalPlot { :theta :phi |
	phi.square
}
~~~

![](sw/spl/Help/Image/sphericalPlot-E.svg)

A segment of an oscillation around a sphere:

~~~spl svg=F
[0 1.pi; 0 1/3.pi]
.sphericalPlot { :theta :phi |
	let a = (5 * theta).sin;
	let b = (10 * phi).sin / 10;
	1 + (a * b)
}
~~~

![](sw/spl/Help/Image/sphericalPlot-F.svg)

* * *

See also: SphericalCoordinates

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SphericalPlot3D.html)
