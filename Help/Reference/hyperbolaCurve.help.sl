# hyperbolaCurve

- _hyperbolaCurve(a, b)_

Answer the implicit equation of the hyperbola,
_x²/a²-y²/b²-1=0_.

Plot unit hyperbola:

~~~spl svg=A
let i = (-4.0 -- 4.0).subdivide(25L);
hyperbolaCurve(1.0, 1.0)
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/hyperbolaCurve-A.svg)

Plot conjugate hyperbola:

~~~spl svg=B
let i = (-4.0 -- 4.0).subdivide(25L);
hyperbolaCurve(1.0, 1.0)
.swap
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/hyperbolaCurve-B.svg)

Matrix plot of unit hyperbola:

~~~spl svg=C
let i = (-4.0 -- 4.0).subdivide(12L);
hyperbolaCurve(1.0, 1.0)
.table(i, i)
.matrixPlot
~~~

![](Help/Image/hyperbolaCurve-C.svg)

Plot hyperbola with _b=2a_:

~~~spl svg=D
let i = (-4.0 -- 4.0).subdivide(25L);
hyperbolaCurve(1.0, 2.0)
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/hyperbolaCurve-D.svg)

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
