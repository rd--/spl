# innerSoddyCircle

- _innerSoddyCircle(t)_

Answer the inner Soddy circle of the reference triangle _t_.

~~~spl svg=A
let t = [3.5 2.5 4].sssTriangle;
[
	t,
	t.tangentCircles,
	t.equalDetourPoint.Point,
	t.innerSoddyCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/innerSoddyCircle-A.svg)

* * *

See also: Circle, equalDetourPoint, outerSoddyCircle, tangentCircles, Triangle

Guides: Geometry Functions, Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InnerSoddyCircle.html)
