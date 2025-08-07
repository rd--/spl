# incircle

- _incircle(g)_

Answer the incircle of the geometry _g_,
the inscribed circle of a polygon.

Draw at `Triangle`:

~~~spl svg=A
let t = sssTriangle(3, 4, 5);
[
	t,
	t.incircle,
	t.incenter.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/incircle-A.svg)

Draw at `Rectangle`:

~~~spl svg=B
let r = Rectangle([0 0], [1 1]);
[
	r,
	r.incircle,
	r.center.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/incircle-B.svg)

* * *

See also: Circle, center, incenter, inradius, Rectangle, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Incircle.html),
_W_
[1](https://en.wikipedia.org/wiki/Incircle_and_excircles)
