# bevanCircle

- _bevanCircle(t)_

Answer the Bevan circle of the reference triangle _t_.

Draw at right triangle:

~~~spl svg=A
let t = sssTriangle(3, 4, 5);
[
	t,
	t.bevanCircle,
	t.excenters.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/bevanCircle-A.svg)

* * *

See also: bevanPoint, Circle, excenters, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BevanCircle.html),
