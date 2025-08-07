# circumradius

- _circumradius(g)_

The `circumradius` is the `radius` of the `circumcircle` of the geometry _g_.

```
>>> let t = Triangle([0 0; 0 1; 1 0]);
>>> let c = t.circumcircle;
>>> (c.radius, t.circumradius)
(2.sqrt / 2, 2.sqrt / 2)
```

* * *

See also: circumcenter, circumcircle, radius

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Circumradius.html)

Categories: Geometry
