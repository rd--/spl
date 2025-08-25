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

let t = sssTriangle(1, 5 / 6, 5 / 6);
[
	t.tangentCircles,
	t.innerSoddyCircle,
	t.outerSoddyCircle
].LineDrawing


* * *

See also: Circle, equalDetourPoint, innerSoddyCircle, tangentCircles, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/OuterSoddyCircle.html)
