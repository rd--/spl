# eulerTriangle

- _eulerTriangle(t)_

Answer the Euler triangle of the reference triangle _t_.

Plot the Euler triangle:

~~~spl svg=A
let t = [1 1 1].sssTriangle;
[
	t,
	t.eulerTriangle
].LineDrawing
~~~

![](sw/spl/Help/Image/eulerTriangle-A.svg)

Plot the Euler, medial, and orthic triangles:

~~~spl svg=B
let t = [6 5 6].sssTriangle;
[
	t,
	t.eulerTriangle,
	t.medialTriangle,
	t.orthicTriangle,
	t.ninePointCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/eulerTriangle-B.svg)

* * *

See also: Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EulerTriangle.html)
