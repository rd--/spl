# perpendicularBisector

- _perpendicularBisector([p₁ p₂])_

Answer the perpendicular bisector of the line segment connecting the two points _p₁_ and _p₂_.

Calculate the perpendicular bisector of a line segment:

```
>>> [-1 -1; 1 1].perpendicularBisector
InfiniteLine([0, 0], [2 -2])
```

The perpendicular bisector is perpendicular to the line segment and passes through the `midpoint`:

```
>>> [0 0; 2 2].perpendicularBisector
InfiniteLine([1 1], [2 -2])

>>> [0 0; 2 2].midpoint
[1 1]

>>> [[2 2], [1 1], [1 1] + [2 -2]].planarAngle
1/2.pi

>>> [[0 0], [1 1], [1 1] + [2 -2]].planarAngle
1/2.pi
```

* * *

See also: angleBisector, InfiniteLine, Line, midpoint

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PerpendicularBisector.html)
