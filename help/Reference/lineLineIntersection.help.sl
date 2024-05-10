# lineLineIntersection

- _lineLineIntersection(aLine, anotherLine)_

Answer the point at which two infinite lines intersect.

```
>>> [4 0; 6 10].lineLineIntersection([0 3; 10 7])
[5 5]
```

If the lines are parallel, the intersection point will contain infinities:

```
>>> [0 0; 1 1].lineLineIntersection([1 2; 4 5])
[inf.-, inf.-]
```

* * *

See also: CartesianCoordinates, RectangularCoordinates
