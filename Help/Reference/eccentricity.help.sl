# eccentricity

- _eccentricity(g)_

Answer the eccentricty of the geometry _g_.

At `Ellipse`:

```
>>> Ellipse([0 0], [4 5]).eccentricity
3/5

>>> (1 - ((4 ^ 2) / (5 ^ 2))).sqrt
3/5
```

At `Circle`:

```
>>> Circle([0 0], 1).eccentricity
0
```

* * *

See also: Circle, Ellipse

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Eccentricity.html),
_W_
[1](https://en.wikipedia.org/wiki/Eccentricity_(mathematics))
