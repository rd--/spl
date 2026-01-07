# distance

- _distance(g)_
- _distance(g₁, g₂)_

In the unary case answer the distance from the geometry _g_ to the origin.
In the binary case answer the distance from _g₁_ to _g₂_.

Calcuate the distance from a plane to the origin, along the plane’s normal:

```
>>> InfinitePlane(1, 2, 2, -2).distance(
>>> 	Point([2, 5, 4])
>>> )
6
```

* * *

See also: euclideanDistance, pointPlaneDistance, signedPointPlaneDistance

Guides: Geometry Functions

Categories: Geometry
