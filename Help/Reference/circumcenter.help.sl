# circumcenter

- _circumcenter(g)_

The `circumcenter` of the geometry _g_ is the `center` of the `circumcircle` or `circumsphere`.

At `Triangle`:

```
>>> let t = Triangle([0 0; 0 1; 1 0]);
>>> let c = t.circumcircle;
>>> (c.center, t.circumcenter)
([0.5 0.5], [0.5 0.5])
```

At `Tetrahedron`:

```
>>> let t = Tetrahedron(
>>> 	[0 0 0; 1 0 0; 0 1 0; 0 0 1]
>>> );
>>> let c = t.circumsphere;
>>> (c.center, t.circumcenter)
([0.5 0.5 0.5], [0.5 0.5 0.5])
```

* * *

See also: center, circumcircle, circumradius

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Circumcenter.html)

Categories: Geometry
