# clawsonPoint

- _clawsonPoint(t)_

Answer the Clawson point of the reference triangle _t_.

```
>>> [1 1 1].sssTriangle
>>> .clawsonPoint
[0.5, 3.sqrt / 6]

>>> [3 4 5].sssTriangle
>>> .clawsonPoint
[3.2, 2.4]
```

Draw at right triangle:

~~~spl svg=A
let t = sssTriangle(1, 1.15, 1.3);
[
	t,
	t.clawsonPoint.Point,
	t.orthicTriangle,
	t.excenters.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/clawsonPoint-A.svg)

* * *

See also: bevanPoint, Circle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BevanCircle.html),
