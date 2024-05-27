# pointLineDistance

- _pointLineDistance(aLine, aPoint)_

Answer the distance from _aLine_ to _aPoint_.

In two dimensions:

```
>>> [0 -26/3; 13/2 0].pointLineDistance([-3 5])
53/5

>>> [0 1; 1/3 0].pointLineDistance([5 1])
(15 / 10.sqrt)

>>> [0 25/3; -25/4 0].pointLineDistance([0 0])
5

>>> [0 7/5; -7/2 0].pointLineDistance([6 9])
(26 / 29.sqrt)

>>> [0 -3; 3/2 0].pointLineDistance([0 0])
(3 / 5.sqrt)

>>> [0 -1/2; -1 0].pointLineDistance([-5 2])
0

>>> [0 -4/3; 2 0].pointLineDistance([5 6])
(12 / 13.sqrt)

>>> [0 2; -5/3 0].pointLineDistance([-3 7])
(43 / 61.sqrt)
```

In three dimensions:

```
>>> [1 3 -1; 3 6 0].pointLineDistance([-2 4 -3])
171/14.sqrt

>>> [0 5/4 0; 5/2 0 0].pointLineDistance([-3 2 0])
(3 / (2 * 5.sqrt))

>>> [0 3/2 0; 2 0 0].pointLineDistance([0 0 0])
6/5

>>> [6 0 0; 6 6 0].pointLineDistance([1 3 0])
5

>>> [-10 0 0; 0 -5 0].pointLineDistance([3 1 0])
(3 * 5.sqrt)

>>> [2 1 0; 3 6 9].pointLineDistance([3 5 6])
(4922.sqrt / 107)
```

* * *

See also: InfiniteLine, Line, Point

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Point-LineDistance2-Dimensional.html)
[2](https://mathworld.wolfram.com/Point-LineDistance3-Dimensional.html),
_W_
[1](https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line)

Categories: Geometry
