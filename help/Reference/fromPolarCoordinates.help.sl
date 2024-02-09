# fromPolarCoordinates

_fromPolarCoordinates(aList | aTuple)_

Answers the _(x,y)_ Cartesian coordinates corresponding to the polar coordinates _(r,θ)_

```
>>> [2.sqrt, 0.25.pi].fromPolarCoordinates
[1 1]

>>> (2.sqrt, -0.75.pi).fromPolarCoordinates
[-1 -1]
```

Collects over lists:

```
>>> [1 0; 2 pi; 1 0.5.pi].fromPolarCoordinates
[1 0; -2 0; 0 1]
```

* * *

See also: toPolarCoordinates, fromSphericalCoordinates

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromPolarCoordinates.html)
