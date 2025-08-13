# equalDetourPoint

- _equalDetourPoint(t)_

Answer the equal detour point for triangle _t_.

```
>>> sssTriangle(3, 4, 5)
>>> .equalDetourPoint
[3.05217 1.14783]

>>> sssTriangle(3, 4, 5)
>>> .kimberlingCenter(176)
[3.05217 1.14783]
```

Drawing:

~~~spl svg=A
let t = sssTriangle(3, 4, 5);
[
	t,
	t.equalDetourPoint.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/equalDetourPoint-A.svg)

* * *

See also: isoperimetricPoint, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EqualDetourPoint.html),
_W_
[1](https://en.wikipedia.org/wiki/Equal_detour_point)
