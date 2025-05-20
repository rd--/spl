# angleBisector

- _angleBisector([q₁ p q₂])_

Answer the bisector of the interior angle at _p_ formed by the triangle with vertex points _p_, _q1_ and _q2_.

Calculate an angle bisector:

```
>>> [1 0; 0 0; 1 3.sqrt].angleBisector
InfiniteLine([0 0], [3 3.sqrt].normalize)

>>> [1 0; 0 0; 3.sqrt 1].angleBisector
InfiniteLine(
	[0 0],
	[1 + (3.sqrt/ 2), 1/2].normalize
)
```

* * *

See also: InfiniteLine, planarAngle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AngleBisector.html)
[2](https://reference.wolfram.com/language/ref/AngleBisector.html),
_W_
[1](https://en.wikipedia.org/wiki/Angle_bisector_theorem)
