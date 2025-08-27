# polarCircle

- _polarCircle(t)_

Answer the polar circle of the triangle _t_.

~~~spl svg=A
let t = [12 6.5 9.5].sssTriangle;
[
	t,
	t.orthocenter.Point,
	t.polarCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/polarCircle-A.svg)

Another polar circle:

~~~spl svg=B
let t = [5 3.5 7].sssTriangle;
[
	t,
	t.orthocenter.Point,
	t.polarCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/polarCircle-B.svg)

* * *

See also: isObtuse, orthocenter, Triangle

Guides: Geometry Functions, Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PolarCircle.html)
_W_
[1](https://en.wikipedia.org/wiki/Polar_circle_(geometry))
