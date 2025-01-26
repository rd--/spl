# planarAngle

- _planarAngle([q1, p, q2])_

Answer the angle subtended by the line segment _q1, q2_ from _p_.

The angle between the half-lines from _(0,0)_ through _(1,1)_ and _(1,0)_:

```
>>> [1 0; 0 0; 1 1].planarAngle
(pi / 4)
```

The angle formed by a triangle at origin:

```
>>> [0 1; 0 0; 1 0].planarAngle
(pi / 2)
```

A straight angle:

```
>>> [1 0; 0 0; -1 0].planarAngle
pi
```

An obtuse angle:

```
>>> [1 0; 0 0; -1 1].planarAngle
(3.pi / 4)
```

A right angle:

```
>>> [1 0; 0 0; 0 1].planarAngle
(pi / 2)
```

An acute angle:

```
>>> [1 0; 0 0; 1 1].planarAngle
(pi / 4)
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
	pi / [6 3 2],
	pi / [6 3 2]
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
(pi / 4, pi / 4)
```

* * *

See also: anglePath, dot, vectorAngle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PlanarAngle.html)

Categories: Geometry
