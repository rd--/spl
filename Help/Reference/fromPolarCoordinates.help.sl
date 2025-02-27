# fromPolarCoordinates

- _fromPolarCoordinates(aSequence)_

Answer the _(x, y)_ Cartesian coordinates corresponding to the polar coordinates _(r, θ)_.

At `List`:

```
>>> [2.sqrt, 0.25.pi].fromPolarCoordinates
[1 1]
```

Collects over lists:

```
>>> [1 0; 2 1.pi; 1 0.5.pi].fromPolarCoordinates
[1 0; -2 0; 0 1]
```

* * *

See also: PolarCoordinates, toPolarCoordinates, fromSphericalCoordinates

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromPolarCoordinates.html)

Categories: Converting, Geometry
