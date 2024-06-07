# pointLineNearest

- _pointLineNearest(l, p)_

Answer the point on the infinite line _l_ nearest to the point _p_.

In two dimensions:

```
>>> [0 -26/3; 13/2 0].pointLineNearest([-3 5])
[137/25 -34/25]

>>> [0 1; 1/3 0].pointLineNearest([5 1])
[1/2 -1/2]

>>> [0 25/3; -25/4 0].pointLineNearest([0 0])
[-4/1 3/1]

>>> [0 7/5; -7/2 0].pointLineNearest([6 9])
[226/29 131/29]

>>> [0 -3; 3/2 0].pointLineNearest([0 0])
[6/5 -3/5]

>>> [0 -1/2; -1 0].pointLineNearest([-5 2])
[-5/1 2/1]

>>> [0 -4/3; 2 0].pointLineNearest([5 6])
[89/13 42/13]

>>> [0 2; -5/3 0].pointLineNearest([-3 7])
[75/61 212/61]
```

In three dimensions:

```
>>> [1 3 -1; 3 6 0].pointLineNearest([-2 4 -3])
[0.28571 1.92857 -1.35714]

>>> [0 5/4 0; 5/2 0 0].pointLineNearest([-3 2 0])
[-27/10 13/5 0/1]

>>> [0 3/2 0; 2 0 0].pointLineNearest([0 0 0])
[18/25 24/25 0/1]

>>> [6 0 0; 6 6 0].pointLineNearest([1 3 0])
[6 3 0]

>>> [-10 0 0; 0 -5 0].pointLineNearest([3 1 0])
[0 -5 0]

>>> [2 1 0; 3 6 9].pointLineNearest([3 5 6])
[2.70093 4.50467 6.30841]
```

* * *

See also: InfiniteLine, Line, LineSegment, Point, pointLineSegmentNearest, projection

Categories: Geometry
