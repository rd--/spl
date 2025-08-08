# extouchTriangle

- _extouchTriangle(t)_

Answer the extouch triangle of the reference triangle _t_.

```
>>> [1 1 1].sssTriangle
>>> .extouchTriangle
Triangle([0.75 0.433; 0.25 0.433; 0.5 0])

>>> let t = [1 1 1].sssTriangle;
>>> t.pedalTriangle(t.bevanPoint)
Triangle([0.75 0.433; 0.25 0.433; 0.5 0])
```

Plot extouch triangle:

~~~spl svg=A
let t = [4 5 4].sssTriangle;
[
	t,
	t.extouchTriangle,
	t.nagelPoint.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/extouchTriangle-A.svg)

* * *

See also: bevanPoint, cevianTriangle, nagelPoint, pedalTriangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ExtouchTriangle.html)
_W_
[1](https://en.wikipedia.org/wiki/Extouch_triangle)
