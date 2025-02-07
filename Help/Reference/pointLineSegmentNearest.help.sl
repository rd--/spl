# pointLineSegmentNearest

- _pointLineSegmentNearest(l, p)_

Answer the point on the finite line segment _l_ nearest to the point _p_.

In two dimensions:

```
>>> [0 -26/3; 13/2 0]
>>> .pointLineSegmentNearest([-3 5])
[137/25 -34/25]

>>> [0 1; 1/3 0]
>>> .pointLineSegmentNearest([5 1])
[1/3 0]

>>> [0 25/3; -25/4 0]
>>> .pointLineSegmentNearest([0 0])
[-4/1 3/1]

>>> [0 7/5; -7/2 0]
>>> .pointLineSegmentNearest([6 9])
[0 7/5]

>>> [0 -3; 1.5 0]
>>> .pointLineSegmentNearest([0 0])
[6/5 -3/5]

>>> [0 -1/2; -1 0]
>>> .pointLineSegmentNearest([-5 2])
[-1 0]

>>> [0 -4/3; 2 0]
>>> .pointLineSegmentNearest([5 6])
[2 0]

>>> [0 2; -1.666 0]
>>> .pointLineSegmentNearest([-3 7])
[0 2]
```

In three dimensions:

```
>>> [1 3 -1; 3 6 0]
>>> .pointLineSegmentNearest([-2 4 -3])
[1 3 -1]

>>> [0 5/4 0; 5/2 0 0]
>>> .pointLineSegmentNearest([-3 2 0])
[0 5/4 0]

>>> [0 3/2 0; 2 0 0]
>>> .pointLineSegmentNearest([0 0 0])
[18/25 24/25 0/1]

>>> [6 0 0; 6 6 0]
>>> .pointLineSegmentNearest([1 3 0])
[6 3 0]

>>> [-10 0 0; 0 -5 0]
>>> .pointLineSegmentNearest([3 1 0])
[0 -5 0]

>>> [2 1 0; 3 6 9]
>>> .pointLineSegmentNearest([3 5 6])
[2.70093 4.50467 6.30841]
```

* * *

See also: InfiniteLine, Line, LineSegment, Point, pointLineNearest, projection

Categories: Geometry
