# Ellipse

- _Ellipse([x y …], [r₁ r₂])_

A `Type` that represents an axis aligned ellipse of radii _r₁,r₂_ at center coordinates _x,y_.
The greater of the radii is called the semi-major axis, the lesser the semi-minor axis.
A standard ellipse has _r₁=a,r₂=b_.

```
>>> let e = Ellipse([0 0], [2 1]);
>>> (
>>> 	e.isEllipse,
>>> 	e.center,
>>> 	e.radii,
>>> 	e.eccentricity,
>>> 	e.linearEccentricity,
>>> 	e.vertices,
>>> 	e.foci[1]
>>> )
(
	true,
	[0 0],
	[2 1],
	3/4.sqrt,
	3.sqrt,
	[2 0; 0 1],
	[3.sqrt 0]
)
```

The bounding box of an ellipse:

```
>>> Ellipse([0 0], [2 1]).boundingBox
[-2 -1; 2 1]
```

A drawing of two ellipses:

~~~spl svg=A
Ellipse(
	[0 0; 0 0],
	[3 4; 3 2]
).LineDrawing
~~~

![](sw/spl/Help/Image/Ellipse-A.svg)

Draw an ellipse indicating the center _c_,
the two foci _f₁,f₂_,
and the vertex and covertex _v₁,v₂_:

~~~spl svg=B
let c = [-3, 4];
let [a, b] = [2.sqrt, 1];
let e = Ellipse(c, [a b]);
let [f1, f2] = e.foci;
let [v1, v2] = e.vertices;
[
	e,
	[c f1 f2 v1 v2].PointCloud,
	[c f1 v2].Triangle,
	Circle(c, 1)
].LineDrawing
~~~

![](sw/spl/Help/Image/Ellipse-B.svg)

Plot using implicit equation:

~~~spl svg=C
let x = 2.sqrt;
let i = (x.- -- x).subdivide(35);
Ellipse([0 0], [x 1])
.implicitEquation
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/Ellipse-C.svg)

* * *

See also: Circle, ellipseCurve, Polygon, Rectangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Ellipse.html)
[2](https://reference.wolfram.com/language/ref/Circle.html),
_W_
[1](https://en.wikipedia.org/wiki/Ellipse)

Categories: Geometry
