# outerSoddyCircle

- _outerSoddyCircle(t)_

Answer the outer Soddy circle of the reference triangle _t_.

~~~spl svg=A
let t = [3 2.5 3].sssTriangle;
[
	t,
	t.tangentCircles,
	t.outerSoddyCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/outerSoddyCircle-A.svg)

Outer and inner Soddy circles:

~~~spl svg=B
let t = sssTriangle(1, 5 / 6, 5 / 6);
[
	t.tangentCircles,
	t.innerSoddyCircle,
	t.outerSoddyCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/outerSoddyCircle-B.svg)

* * *

See also: Circle, equalDetourPoint, innerSoddyCircle, tangentCircles, Triangle

Guides: Geometry Functions, Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/OuterSoddyCircle.html)
