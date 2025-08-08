# extangentsTriangle

- _extangentsTriangle(t)_

Answer the extangents triangle of the reference triangle _t_.

```
>>> let a = -2/3.pi.tan;
>>> let b = -1/3.pi.sin * 3;
>>> [1 1 1].sssTriangle
>>> .extangentsTriangle
Triangle([3 a; -2 a; 0.5 b])
```

Plot extangents triangle:

~~~spl svg=A
let t = [4 5 4].sssTriangle;
[
	t,
	t.extangentsTriangle
].LineDrawing
~~~

![](sw/spl/Help/Image/extangentsTriangle-A.svg)

Draw nested extangents triangles:

~~~spl svg=A
{ :t |
	t.extangentsTriangle
}.nestList(
	[3 4 5].sssTriangle,
	4
).LineDrawing
~~~

![](sw/spl/Help/Image/extangentsTriangle-B.svg)

* * *

See also: excenters, excircles, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ExtangentsTriangle.html)
_W_
[1](https://en.wikipedia.org/wiki/Extangents_triangle)
