# planarAngle

- _planarAngle([q₁ p q₂])_
- _planarAngle(p -> [q₁ q₂])_

The `List` form answers the angle at _p_ formed by the triangle with vertex points _p_, _q₁_ and _q₂_.

The `Association` form answers the angle subtended by the line segment _q₁, q₂_ from _p_.

The angle between the half-lines from _(0,0)_ through _(1,1)_ and _(1,0)_:

```
>>> ([0 0] -> [1 0; 1 1]).planarAngle
1/4.pi
```

This form answers the directed, or clockwise, angle:

```
>>> ([0 0] -> [2 -3; 5 -1]).planarAngle
1/4.pi

>>> ([0 0] -> [5 -1; 2 -3]).planarAngle
7/4.pi

>>> ([0 0] -> [2 -3; -5 1]).planarAngle
5/4.pi
```

The angle formed by a triangle at origin:

```
>>> [0 1; 0 0; 1 0].planarAngle
1/2.pi
```

A straight angle, equal to π:

```
>>> [1 0; 0 0; -1 0].planarAngle
1.pi
```

An obtuse angle, between π and π/2:

```
>>> [1 0; 0 0; -1 1].planarAngle
3/4.pi
```

A right angle, equal to π/2:

```
>>> [1 0; 0 0; 0 1].planarAngle
1/2.pi
```

An acute angle, less than π/2:

```
>>> [1 0; 0 0; 1 1].planarAngle
1/4.pi
```

All interior angles of a triangle:

```
>>> let [a, b, c] = [
>>> 	[0, 0],
>>> 	[2, 0],
>>> 	[3 / 2, 3.sqrt / 2]
>>> ];
>>> (
>>> 	[b a c; c b a; a c b].collect(
>>> 		planarAngle:/1
>>> 	),
>>> 	Triangle(a, b, c).interiorAngles
>>> )
(
	1.pi / [6 3 2],
	1.pi / [6 3 2]
)
```

At specific values:

```
>>> [-2 1; 2 3; -2 -4].planarAngle
(2 / 3).arcTan
```

Relation between `planarAngle` of _(q2, p, q1)_ and _(q1, p, q2)_:

```
>>> let [q2, p, q1] = [1 1; 2 1; 1 0];
>>> (
>>> 	[q2 p q1].planarAngle,
>>> 	[q1 p q2].planarAngle
>>> )
(1/4.pi, 1/4.pi)
```

The angle answered in the `List` form is in _(0, π)_:

```
>>> let p = [0 0];
>>> let q1 = [0 -1];
>>> let q2 = [1 0];
>>> (
>>> 	[q1 p q2].planarAngle,
>>> 	[q2 p q1].planarAngle,
>>> 	vectorAngle(q1 - p, q2 - p),
>>> 	vectorAngle(q2 - p, q1 - p)
>>> )
(1/2.pi, 1/2.pi, 1/2.pi, 1/2.pi)
```

The angle answered in the `Association` form is in _(0, 2π)_:

```
>>> let p = [0 0];
>>> let q1 = [0 -1];
>>> let q2 = [1 0];
>>> (
>>> 	(p -> [q1 q2]).planarAngle,
>>> 	(p -> [q2 q1]).planarAngle
>>> )
(1/2.pi, 3/2.pi)
```

* * *

See also: angleBisector, anglePath, dot, vectorAngle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PlanarAngle.html)

Categories: Geometry
