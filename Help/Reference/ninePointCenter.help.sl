# ninePointCenter

- _ninePointCenter(t)_

Answer the nine-point center of the triangle _t_.

```
>>> [1 1 1].sssTriangle
>>> .ninePointCenter
[0.5 1/12.sqrt]
```

Drawing:

~~~spl svg=A
let t = sssTriangle(3, 4.4, 5);
[
	t,
	[
		t.ninePointCenter,
		t.circumcenter,
		t.orthocenter
	].PointCloud,
	t.ninePointCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/ninePointCenter-A.svg)

* * *

See also: Circle, ninePointCircle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Nine-PointCenter.html),
_W_
[1](https://en.wikipedia.org/wiki/Nine-point_circle)
