# degreesToRadians

- _degreesToRadians(n)_

Convert from _n_ degrees to radians.

There are 180° in `pi` radians:

```
>>> 360.degreesToRadians
2.pi
```

Equivalent to `degree`:

```
>>> 1.degree
1/180.pi
```

Threads over lists:

```
>>> [0 15 30 45].degreesToRadians
[0 1/12 1/6 1/4].pi
```

* * *

See also: Angle, degree, degrees, radians, radiansToDegrees

Guides: Geometry Functions

References:
_Smalltalk_
5.6.7.6

Categories: Converting, Math, Geometry
