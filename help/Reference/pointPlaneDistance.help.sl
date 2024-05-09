# pointPlaneDistance

- pointPlaneDistance(aPlane, aPoint)_

Answer the distance from _aPoint_ to _aPlane_.
The plane is given as _ax + by + cz + d = 0_,
the point as _x y z_.

```
>>> [1 2 2 -2].pointPlaneDistance([2 5 4])
6

>>> [2 3 -1 -6].pointPlaneDistance([0 0 0])
(6 / 14.sqrt)

>>> [1 1 0 -2].pointPlaneDistance([-1 1 2])
2.sqrt

>>> [3 4 -1 -1].pointPlaneDistance([1 2 3])
(7 / 26.sqrt)

>>> [5 3 1 -8].pointPlaneDistance([1 7 4])
(22 / 35.sqrt)

>>> [5 4 3 -1].pointPlaneDistance([1 0 -1])
(2.sqrt / 10)

>>> [2 1 -2 -5].pointPlaneDistance([12 6 2])
7

>>> [2 1 -2 -5].pointPlaneDistance([-120/11 -60/11 -62/11])
7
```

* * *

See also: signedPointPlaneDistance

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Point-PlaneDistance.html)
