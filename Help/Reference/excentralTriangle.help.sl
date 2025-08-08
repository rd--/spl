# excentralTriangle

- _excentralTriangle(t)_

Answer the excentral triangle of the reference triangle _t_.

```
>>> let r = 2/3.pi.sin;
>>> [1 1 1].sssTriangle
>>> .excentralTriangle
Triangle([1.5 r; -0.5 r; 0.5 r.negated])
```

Plot excentral triangle:

~~~spl svg=A
let t = [4 5 4].sssTriangle;
[
	t,
	t.excentralTriangle
].LineDrawing
~~~

![](sw/spl/Help/Image/excentralTriangle-A.svg)

Draw nested excentral triangles:

~~~spl svg=A
{ :t |
	t.excentralTriangle
}.nestList(
	[3 4 5].sssTriangle,
	4
).LineDrawing
~~~

![](sw/spl/Help/Image/excentralTriangle-B.svg)

* * *

See also: excenters, excircles, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ExcentralTriangle.html)
_W_
[1](https://en.wikipedia.org/wiki/Excentral_triangle)
