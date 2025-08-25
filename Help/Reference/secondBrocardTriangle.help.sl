# secondBrocardTriangle

- _secondBrocardTriangle(t)_

Answer the second Brocard triangle of the reference triangle _t_.

Draw the second Brocard triangle,
the Schoute centers of the triangles are equal:

~~~spl svg=A
let a = [3 4 5].sssTriangle;
let b = a.secondBrocardTriangle;
[
	a,
	b,
	a.schouteCenter.Point,
	b.schouteCenter.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/secondBrocardTriangle-A.svg)

* * *

See also: firstBrocardTriangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SecondBrocardTriangle.html)
