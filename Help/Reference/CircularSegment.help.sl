# CircularSegment

- _CircularSegment(a)_

A `Type` representing a circular segment specified by the `Arc` _a_.

Draw a minor segment:

~~~spl svg=A
CircularSegment(
	Arc([0 0], [1 1], [-1/3 1/3].pi)
)
~~~

![](sw/spl/Help/Image/CircularSegment-A.svg)

Draw the segment or a major sector,
not properly a segment:

~~~spl svg=B
CircularSegment(
	Arc([0 0], [1 1], [5/4 3/4].pi)
)
~~~

![](sw/spl/Help/Image/CircularSegment-B.svg)

* * *

See also: Arc, CircularSector

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CircularSegment.html),
_W_
[1](https://en.wikipedia.org/wiki/Circular_segment)

Categories: Geometry
