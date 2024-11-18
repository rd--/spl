# distance

- _distance(anObject)_
- _distance(anObject, anotherObject)_

In the unary case answer the distance from _anObject_ to the origin.
In the binary case answer the distance from _anObject_ to _anotherObject_.

Calcuate the distance from a plane to the origin, along the plane’s normal:

```
>>> InfinitePlane(1, 2, 2, -2).distance(Point([2, 5, 4]))
6
```

* * *

See also: pointPlaneDistance, signedPointPlaneDistance

Categories: Geometry
