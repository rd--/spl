# schifflerPoint

- _schifflerPoint(t)_

Answer the Schiffler point for triangle _t_.

```
>>> sssTriangle(3, 4, 5)
>>> .schifflerPoint
[2.2 2.4]

>>> sssTriangle(3, 4, 5)
>>> .kimberlingCenter(21)
[2.2 2.4]
```

Drawing:

~~~spl svg=A
let t = sssTriangle(3, 4, 5);
[
	t,
	t.schifflerPoint.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/schifflerPoint-A.svg)

* * *

See also: Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SchifflerPoint.html),
_W_
[1](https://en.wikipedia.org/wiki/Schiffler_point)
