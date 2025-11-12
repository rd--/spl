# linePlaneIntersection

- _linePlaneIntersection(p0, n, l0, l)_

Answer the point at which a line and a plane intesect.
The plane is given by a point _p0_ and a normal vector _n_.
The line is given by a point _l0_ and a unit vector _l_.
If the plane and line are parallel answer `nil`.

Plane and line with integer intersection point:

```
>>> let p0 = [0 0 5];
>>> let n = [0 0 1];
>>> let l0 = [0 0 10];
>>> let l = [0 -1 -1];
>>> linePlaneIntersection(p0, n, l0, l)
[0 -5 5]
```

Plane and line with fractional intersection point:

```
>>> let p0 = [1 1 -5];
>>> let n = [1 1 1];
>>> let l0 = [-5 1 -1];
>>> let l = [6 1 4];
>>> linePlaneIntersection(p0, n, l0, l)
[-43/11 13/11 -3/11]
```

* * *

See also: lineLineIntersection

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Line%E2%80%93plane_intersection)

Categories: Geometry
