# symmedialTriangle

- _symmedialTriangle(t)_

Answer the symmedial triangle of the reference triangle _t_.

Plot the symmedial triangle and the symmedian point:

~~~spl svg=A
let t = [6 5 6].sssTriangle;
[
	t,
	t.symmedialTriangle,
	t.symmedianPoint.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/symmedialTriangle-A.svg)

* * *

See also: fromTrilinearVertexMatrix, symmedianPoint, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SymmedialTriangle.html),
