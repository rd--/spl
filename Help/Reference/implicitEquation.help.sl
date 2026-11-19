# implicitEquation

- _implicitEquation(g)_

Answer the implicit equation for the geometry object _g_.

Contour plot of `InfiniteLine`,
the implicit equation is _ax+by+c=0_:

~~~spl svg=A
let i = (-1.0 -- 1.0).subdivide(10L);
InfiniteLine([0 0], [1 1])
.implicitEquation
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/implicitEquation-A.svg)

Matrix plot of `InfiniteLine`:

~~~spl svg=B
let i = (-1.0 -- 1.0).subdivide(12L);
InfiniteLine([0 0], [1 1])
.implicitEquation
.table(i, i)
.matrixPlot
~~~

![](Help/Image/implicitEquation-B.svg)

Contour plot of `Circle`,
the implicit equation is _(x-a)²+(y-b)²-r²=0_:

~~~spl svg=C
let i = (-1.0 -- 1.0).subdivide(20L);
Circle([0 0], 1)
.implicitEquation
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/implicitEquation-C.svg)

Matrix plot of `Circle`:

~~~spl svg=D
let i = (-1.0 -- 1.0).subdivide(12L);
Circle([0 0], 1)
.implicitEquation
.table(i, i)
.matrixPlot
~~~

![](Help/Image/implicitEquation-D.svg)

Contour plot of `Ellipse`,
the implicit equation is _(x-x₀)²/a²+(y-y₀)²/b²-1=0_:

~~~spl svg=E
let i = (-1.5 -- 1.5).subdivide(25L);
Ellipse([0.0 0.0], [1.5 1.0])
.implicitEquation
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/implicitEquation-E.svg)

Matrix plot of `Ellipse`:

~~~spl svg=F
let i = (-1.5 -- 1.5).subdivide(12L);
Ellipse([0.0 0.0], [1.5 1.0])
.implicitEquation
.table(i, i)
.matrixPlot
~~~

![](Help/Image/implicitEquation-F.svg)

* * *

See also: Circle, Ellipse, GeneralisedCircle, InfiniteLine, contourPlot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ImplicitFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Implicit_function)
