# Cone

- _Cone([c₁ c₂], r)_

Answer a `Cone` with a base of radius _r_ centered at _c₁_ and a tip at _c₂_.

```
>>> let c = Cone([0 0 -1; 0 0 1], 1);
>>> (
>>> 	c.radius,
>>> 	c.volume,
>>> 	c.height,
>>> 	c.slantHeight,
>>> 	c.baseArea,
>>> 	c.lateralSurfaceArea
>>> )
(1, 2.pi / 3, 2, 5.sqrt, 1.pi, 1.pi * 5.sqrt)
```

* * *

See also: area, Ball, center, diameter, Circle, Ellipse, radius, randomPoint, spherePoints

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cone.html)
[2](https://reference.wolfram.com/language/ref/Cone.html),
_W_
[1](https://en.wikipedia.org/wiki/Cone)

Categories: Geometry, Type
