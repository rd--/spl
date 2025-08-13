# bevanPoint

- _bevanPoint(t)_

Answer the Bevan point of the reference triangle _t_.

```
>>> let t = sssTriangle(3, 4, 5);
>>> (t.bevanPoint, t.kimberlingCenter(40))
([2 -1], [2 -1])
```

Draw at right triangle:

~~~spl svg=A
let t = sssTriangle(3, 4, 5);
[
	t,
	t.bevanPoint.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/bevanPoint-A.svg)

* * *

See also: bevanCircle, Point, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BevanPoint.html),
