# revolutionPlot

- _revolutionPlot(r, f:/2)_
- _revolutionPlot(z, f:/1)_

If _f_ is binary,
answer a plot of the surface of revolution with height _f(t,θ)_ at radius _r_.
If _f_ is unary,
answer a plot of the surface obtained by rotating the parametric curve with _(x,z)_ coordinates _f(t)_ around the _z_ axis.

Revolve a function curve around the _z_ axis:

~~~spl svg=A
(0 -- 1).revolutionPlot { :t :theta |
	((t ^ 4) - (t ^ 2)) * 7
}
~~~

![](sw/spl/Help/Image/revolutionPlot-A.svg)

Revolve a parametric curve around the _z_ axis:

~~~spl svg=B
(0 -- 2.pi).revolutionPlot { :t |
	[2 + t.cos, t.sin * 3.5]
}
~~~

![](sw/spl/Help/Image/revolutionPlot-B.svg)

A cylinder:

~~~spl svg=C
(0 -- 1).revolutionPlot { :t |
	[1, t * 2.5]
}
~~~

![](sw/spl/Help/Image/revolutionPlot-C.svg)

A cone:

~~~spl svg=D
(0 -- 1).revolutionPlot { :t |
	[t, t * 2.5]
}
~~~

![](sw/spl/Help/Image/revolutionPlot-D.svg)

An ellipsoid:

~~~spl svg=E
(-1/2.pi -- 1/2.pi).revolutionPlot { :t |
	[t.cos, t.sin * 2.5]
}
~~~

![](sw/spl/Help/Image/revolutionPlot-E.svg)

* * *

See also: sphericalPlot, surfacePlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RevolutionPlot3D.html)
