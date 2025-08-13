# exeterPoint

- _exeterPoint(t)_

Answer the Exeter point for triangle _t_.

```
>>> sssTriangle(3, 4, 5)
>>> .exeterPoint
[1.8 -2.4]

>>> sssTriangle(3, 4, 5)
>>> .kimberlingCenter(22)
[1.8 -2.4]
```

Drawing:

~~~spl svg=A
let t = sssTriangle(3, 4, 5);
[
	t,
	t.exeterPoint.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/exeterPoint-A.svg)

* * *

See also: Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ExeterPoint.html),
_W_
[1](https://en.wikipedia.org/wiki/Exeter_point)
