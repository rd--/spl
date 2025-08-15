# firstBrocardTriangle

- _firstBrocardTriangle(t)_

Answer the first Brocard triangle of the reference triangle _t_.

Plot the first Brocard triangle and it’s circumcircle:

~~~spl svg=A
let a = [6 4 5].sssTriangle;
let b = a.firstBrocardTriangle;
[
	a,
	b,
	b.circumcircle
].LineDrawing
~~~

![](sw/spl/Help/Image/firstBrocardTriangle-A.svg)

* * *

See also: Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FirstBrocardTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Brocard_triangle)
