# radius

- _radius(x)_

Answer the _radius_ of the object _x_.

At `Circle`:

```
>>> Circle([0 0], 1).radius
1
```

At `Sphere`:

```
>>> Sphere([0 0 0], 1).radius
1
```

At `PlanarCoordinates` see `rho`:

```
>>> PlanarCoordinates(1, 1).rho
2.sqrt
```

At `CartesianCoordinates`:

```
>>> CartesianCoordinates[1 0 1].radius
2.sqrt
```

At `PolarCoordinates` see `rho`:

```
>>> PolarCoordinates(1, 0).rho
1
```

* * *

See also: rho

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Radius.html)
_W_
[1](https://en.wikipedia.org/wiki/Radius)

Categories: Accessing, Geometry
