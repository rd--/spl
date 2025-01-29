# circumcircle

- _circumcircle(aMatrix | aTriangle)_

The `circumcircle` of an isosceles right triangle:

~~~spl svg=A
let t = [0 0; 0 1; 1 0].asTriangle;
[t, t.circumcircle].LineDrawing
~~~

![](sw/spl/Help/Image/circumcircle-A.svg)

The `circumcircle` of an equilateral triangle:

~~~spl svg=B
let t = sssTriangle(1, 1, 1);
[t, t.circumcircle].LineDrawing
~~~

![](sw/spl/Help/Image/circumcircle-B.svg)

The `circumcircle` of the golden isosceles triangle:

~~~spl svg=C
let t = asaTriangle(2/5.pi, 1, 2/5.pi);
[t, t.circumcircle].LineDrawing
~~~

![](sw/spl/Help/Image/circumcircle-C.svg)

The `circumcircle` of the Kepler triangle:

~~~spl svg=D
let t = sssTriangle(
	1.goldenRatio.sqrt,
	1.goldenRatio,
	1
);
[t, t.circumcircle].LineDrawing
~~~

![](sw/spl/Help/Image/circumcircle-D.svg)

The `circumcircle` of the automedian triangle:

~~~spl svg=E
let t = sssTriangle(13, 17, 7);
[t, t.circumcircle].LineDrawing
~~~

![](sw/spl/Help/Image/circumcircle-E.svg)

* * *

See also: Circle, circumcenter, circumradius, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Circumcircle.html),
_W_
[1](https://en.wikipedia.org/wiki/Circumcircle)
[2](https://en.wikipedia.org/wiki/Isosceles_triangle)
[3](https://en.wikipedia.org/wiki/Equilateral_triangle)
[4](https://en.wikipedia.org/wiki/Golden_triangle_(mathematics))
[5](https://en.wikipedia.org/wiki/Kepler_triangle)
[6](https://en.wikipedia.org/wiki/Automedian_triangle)

Categories: Geometry
