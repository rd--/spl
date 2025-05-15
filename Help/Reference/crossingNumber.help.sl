# crossingNumber

- _crossingNumber(c, p)_

Answer the number of times a ray starting from the point p crosses the closed curve contour _c_.
The coordinate list should be in counterclockwise orientation with no overlapping,
and should not contain the closing vertex.
An odd crossing number indicates a point lies inside a polygon.

Crossing number given a simple convex polygon:

```
>>> [1 0; 0 1.5; -1 0]
>>> .crossingNumber([0 0.5])
1
```

Count how many times a ray starting from the point crosses the closed-curve contour:

```
>>> [0.35 0.2; 0.9 0.75; 0.1 0.55; 0.9 0.35; 0.42 0.9]
>>> .crossingNumber([0.5 0.7])
3
```

Crossing number given concave polygon:

```
>>> [1 0; 0 2; -1 0; 0 1]
>>> .crossingNumber([0 0.5])
2
```

* * *

See also: containsPoint, windingNumber

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CrossingCount.html),
