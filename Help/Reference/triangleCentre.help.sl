# triangleCentre

- _triangleCentre(t, p:/1, f:/3)_

Answer the triangle center of the triangle _t_,
specified by the triangle center function _f_,
operating of the triangle parameters _p_.

The Spieker center:

```
>>> [3 4 5].sssTriangle
>>> .triangleCentre(sideLengths:/1) { :a :b :c |
>>> 	(b + c) / a
>>> }
[2.6 0.7]

>>> [3 4 5].sssTriangle.spiekerCenter
[2.6 0.7]
```

* * *

See also: interiorAngles, sideLengths, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TriangleCenterFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Triangle_center)
