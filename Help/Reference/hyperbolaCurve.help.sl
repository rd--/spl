# hyperbolaCurve

- _hyperbolaCurve(a, b)_

Answer the implicit equation of the hyperbola,
_x²/a²-y²/b²-1=0_.

+SmallFloat{
	hyperbolaCurve { :a :b |
		{ :x :y |
			(x.square / a.square) - (y.square / b.square) - 1
		}
	}
}

Plot unit hyperbola:

~~~spl svg=A
let i = (-4 -- 4).subdivide(25);
hyperbolaCurve(1, 1)
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/hyperbolaCurve-A.svg)

Plot conjugate hyperbola:

~~~spl svg=B
let i = (-4 -- 4).subdivide(25);
hyperbolaCurve(1, 1)
.swap
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/hyperbolaCurve-B.svg)

Matrix plot of unit hyperbola:

~~~spl svg=C
let i = (-4 -- 4).subdivide(12);
hyperbolaCurve(1, 1)
.table(i, i)
.matrixPlot
~~~

![](sw/spl/Help/Image/hyperbolaCurve-C.svg)

Plot hyperbola with _b=2a_:

~~~spl svg=D
let i = (-4 -- 4).subdivide(25);
hyperbolaCurve(1, 2)
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/hyperbolaCurve-D.svg)

* * *

See also: /, square

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Hyperbola.html)
[2](https://mathworld.wolfram.com/RectangularHyperbola.html),
_W_
[1](https://en.wikipedia.org/wiki/Hyperbola)
[2](https://en.wikipedia.org/wiki/Unit_hyperbola)
[3](https://en.wikipedia.org/wiki/Conjugate_hyperbola)
