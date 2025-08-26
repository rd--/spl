# powerCircles

- _powerCircles(t)_

Answer the power circles of the triangle _t_.

~~~spl svg=A
let t = [6 4 7].sssTriangle;
let m = t.medialTriangle;
[
	t,
	m.vertexCoordinates.PointCloud,
	t.powerCircles
].LineDrawing
~~~

![](sw/spl/Help/Image/powerCircles-A.svg)

* * *

See also: Circle, medialTriangle, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PowerCircles.html)
