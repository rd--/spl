# approximateCircularArc

- _approximateCircularArc([x y], r, [θ₁ θ₂])_

Answer an approximation of a circular arc as a cubic Bézier curve.

At origin with radius one and angle from zero to ½π:

~~~spl svg=A
[0 0].approximateCircularArc(
	1,
	[0 1/2].pi
)
~~~

![](sw/spl/Help/Image/approximateCircularArc-A.svg)

Approximate circle as four sucessive arcs:

~~~spl svg=B
[0 1/2; 1/2 1; 1 3/2; 3/2 2].pi
.collect { :a |
	[0 0].approximateCircularArc(1, a)
}.LineDrawing
~~~

![](sw/spl/Help/Image/approximateCircularArc-B.svg)

* * *

See also: Arc, Circle

Guides: Geometry Functions
