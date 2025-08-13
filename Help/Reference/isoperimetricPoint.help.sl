# isoperimetricPoint

- _isoperimetricPoint(t)_

Answer the isoperimetric point for triangle _t_.

```
>>> sssTriangle(3, 4, 5)
>>> .isoperimetricPoint
[1.64706 2.11765]

>>> sssTriangle(3, 4, 5)
>>> .kimberlingCenter(175)
[1.64706 2.11765]
```

Drawing:

~~~spl svg=A
let t = sssTriangle(3, 4, 5);
[
	t,
	t.isoperimetricPoint.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/isoperimetricPoint-A.svg)

* * *

See also: equalDetourPoint, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IsoperimetricPoint.html),
_W_
[1](https://en.wikipedia.org/wiki/Isoperimetric_point)
