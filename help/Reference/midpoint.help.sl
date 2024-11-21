# midpoint

- _midpoint(aLine)_
- _midpoint(aPoint, anotherPoint)_

Answer the midpoint of the line segment connecting two points.

Find the midpoint of two points:

```
>>> [1 1].midpoint([2 3])
[3/2 2]
```

Midpoint in two dimensions:

```
>>> [1 1].midpoint([3 4])
[2 5/2]
```

Midpoint in four dimensions:

```
>>> [1 2 3].midpoint([4 5 6])
[5/2 7/2 9/2]
```

Midpoint in four dimensions:

```
>>> [1 2 -1 3].midpoint([4 2 -3 -2])
[5/2 2 -2 1/2]
```

The midpoint between two `Point` values is a `Point` value:

```
>>> [1 1].Point.midpoint([2 3].Point)
[3/2 2].Point
```

The midpoint is equidistant from the two points:

```
>>> let p1 = [1 2];
>>> let p2 = [3 4];
>>> let p3 = p1.midpoint(p2);
>>> (p1.euclideanDistance(p3), p2.euclideanDistance(p3))
(2.sqrt, 2.sqrt)
```

For coordinates, `midpoint` gives the same result as `mean`:

```
>>> [1 2].midpoint([-3 5])
[1 2; -3 5].mean
```

* * *

See also: Line, Point

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Midpoint.html)
[2](https://reference.wolfram.com/language/ref/Midpoint.html),
_W_
[1](https://en.wikipedia.org/wiki/Midpoint)

Categories: Geometry
