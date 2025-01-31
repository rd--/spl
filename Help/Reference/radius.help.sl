# radius

- _radius(anObject)_

Answer the _radius_ of _anObject_.

At `PlanarCoordinates`:

```
>>> PlanarCoordinates(1, 1).radius
2.sqrt
```

At `CartesianCoordinates`:

```
>>> CartesianCoordinates(1, 0, 1).radius
2.sqrt
```

At `PolarCoordinates`, also named `rho` and `r`:

```
>>> let p = PolarCoordinates(1, 0);
>>> (p.r, p.rho, p.radius)
(1, 1, 1)
```

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

* * *

See also: r, rho

Guides: Geometry Types

Categories: Accessing, Geometry
