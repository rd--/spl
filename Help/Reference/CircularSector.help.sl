# CircularSector

- _CircularSector(a)_

A `Type` representing a circular sector specified by the `Arc` _a_.

Draw a major sector:

~~~spl svg=A
CircularSector(
	Arc([0 0], [1 1], [5/4 3/4].pi)
)
~~~

![](sw/spl/Help/Image/CircularSector-A.svg)

Draw a minor sector:

~~~spl svg=B
CircularSector(
	Arc([0 0], [1 1], [2/5 3/5].pi)
)
~~~

![](sw/spl/Help/Image/CircularSector-B.svg)

* * *

See also: Arc, CircularSegment

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CircularSector.html),
_W_
[1](https://en.wikipedia.org/wiki/Circular_sector)

Categories: Geometry
