# isoperimetricPoint

- _isoperimetricPoint(t)_

Answer the isoperimetric point for triangle _t_,
also the outer Soddy center.

```
>>> sssTriangle(3, 4, 5)
>>> .isoperimetricPoint
[1.8 -2.4]

>>> sssTriangle(3, 4, 5)
>>> .kimberlingCenter(175)
[1.8 -2.4]
```

Drawing:

~~~spl svg=A
let t = sssTriangle(3, 2.5, 3);
[
	t,
	t.isoperimetricPoint.Point,
	t.tangentCircles,
	t.outerSoddyCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/isoperimetricPoint-A.svg)

* * *

See also: equalDetourPoint, outerSoddyCircle, tangentCircles, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IsoperimetricPoint.html)
[2](https://mathworld.wolfram.com/OuterSoddyCenter.html),
_W_
[1](https://en.wikipedia.org/wiki/Isoperimetric_point)
