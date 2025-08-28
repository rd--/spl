# sutherlandHodgmanAlgorithm

- _sutherlandHodgmanAlgorithm(s, c)_

Implement the Sutherland and Hodgman algorithm for polygon clipping.
Clips the subject polygon _s_ to the clipping polygon _c_.

Draw _s_ and _c_ and a translated copy of _w_.

~~~spl svg=A
let s = [
	 50 150; 200  50; 350 150; 350 300;
	250 300; 200 250; 150 350; 100 250;
	100 200
].Polygon;
let c = [
	100 100; 300 100; 300 300; 100 300
].Polygon;
let a = s.sutherlandHodgmanAlgorithm(c);
let b = a.translate([400 0]);
[s c b].LineDrawing
~~~

![](sw/spl/Help/Image/sutherlandHodgmanAlgorithm-A.svg)

* * *

See also: cohenSutherlandAlgorithm, Polygon

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Sutherland%E2%80%93Hodgman_algorithm)

Further Reading: Sutherland and Hodgman 1974
