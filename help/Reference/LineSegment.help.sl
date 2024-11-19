# LineSegment

- _LineSegment(p, q)_

A line segment is a part of a straight line that is bounded by two distinct end points.
It contains every point on the line that is between its endpoints.

Compute the `arcLength` of a line:

```
>>> LineSegment([0 0], [1 1]).arcLength
2.sqrt
```

Compute the `midpoint` of a line:

```
>>> LineSegment([0 0], [1 1]).midpoint
[1/2 1/2]
```

The `centroid` is equal to the `midpoint`:

```
>>> LineSegment([-1 -1], [1 1]).centroid
[0 0]
```

The `arcLength` in two-dimensions:

```
>>> LineSegment([0 0], [1 1]).arcLength
2.sqrt
```

The `arcLength` in three-dimensions:

```
>>> LineSegment([0 0 0], [1 1 1]).arcLength
3.sqrt
```

Compute the distance of a point to a line segment:


* * *

See also: HalfLine, InfiniteLine, HalfPlane, InfinitePlane, Line, Point

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LineSegment.html)
[2](https://reference.wolfram.com/language/ref/Line.html),
_W_
[1](https://en.wikipedia.org/wiki/Line_segment)

Categories: Geometry
