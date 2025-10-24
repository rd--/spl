# vectorAngle

- _vectorAngle(u, v, r)_

Answers the angle between the vectors _u_ and _v_ according to the rule _r_

The unsigned angle between two vectors in two-dimensions:

```
>>> [1 0].vectorAngle([1 1], 'Unsigned')
1/4.pi
```

The unsigned angle between two vectors in three-dimensions:

```
>>> let r = 'Unsigned';
>>> [1 0 0].vectorAngle([1 1 1], r)
(1 / 3.sqrt).arcCos

>>> let u = [1 2 3];
>>> let v = [1 1 1];
>>> u.vectorAngle(v, 'Unsigned')
(6 / 7).sqrt.arcCos
```

The unsigned angle between orthogonal vectors:

```
>>> let r = 'Unsigned';
>>> [1 0].vectorAngle([0 1], r)
0.5.pi

>>> let r = 'Unsigned';
>>> [1 0 1].vectorAngle([0 1 0], r)
0.5.pi

>>> 10.unitVector(1).vectorAngle(
>>> 	10.unitVector(2),
>>> 	'Unsigned'
>>> )
0.5.pi
```

The unsigned angle between a vector and another vector on the same line:

```
>>> [1 1].vectorAngle([2 2], 'Unsigned')
0
```

The answer is may be unsigned, signed or counter-clockwise:

```
>>> let a = [1 0];
>>> let b = [0 1];
>>> [
>>> 	'Unsigned'
>>> 	'Signed'
>>> 	'CounterClockwise'
>>> ].collect { :r |
>>> 	[
>>> 		a.vectorAngle(b, r),
>>> 		b.vectorAngle(a, r)
>>> 	]
>>> }
[
	1/2.pi 1/2.pi;
	1/2.pi -1/2.pi;
	1/2.pi 3/2.pi
]
```

* * *

See also: arcCos, cross, counterClockwiseVectorAngle, degree, dot, planarAngle, signedVectorAngle, unsignedVectorAngle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/VectorAngle.html)

Categories: Geometry
