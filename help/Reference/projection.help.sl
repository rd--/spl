# projection

- _projection(u, v)_

Answer the projection of the vector _u_ onto the vector _v_.

Project _(-1,1)_ onto _(1,1)_:

```
>>> [-1 1].projection([1 1])
[0 0]
```

Project _(2,3)_ onto _(1,2)_:

```
>>> [2 3].projection([1 2])
[8/5 16/5]
```

Project _(5,6,7)_ onto the _x_-axis:

```
>>> [5 6 7].projection([1 0 0])
[5 0 0]
```

Project _(5,6,7)_ onto another vector:

```
>>> [5 6 7].projection([1 1 1])
[6 6 6]
```

Find the projection of a real valued vector onto another:

```
>>> [1.3 2.1 3.1].projection([-0.3 4.2 5.3])
[-0.16278 2.27874 2.87556]
```

Projection of one complex vector onto another:

```
>>> [3J1 2J0 2J-1].projection([2J0 4J0 0J5])
[
	(2 / 5)  - (16.i / 45),
	(4 / 5)  - (32.i / 45),
	(8 / 9) + 1.i
]
```

Projection of an exact vector onto another:

```
>>> [2 3].projection([1 2])
[8/5 16/5]
```

Projection of one real vector onto another:

```
>>> [1.32293 1.47644].projection([2.54931 3.87734])
[1.07704 1.63811]
```

Project the vector _v=(-1,3)_ on the line spanned by the vector _l=(1,1)_:

```
>>> [-1 3].projection([1 1])
[1 1]
```

Project the vector _v_ on the plane spanned by the vectors _b1_ and _b2_:

```
>>> let v = [1 2 0.5];
>>> let b1 = [2 4 -2];
>>> let b2 = [-3 3 0];
>>> let b3 = b2 - b2.projection(b1);
>>> let p = v.projection(b1) + v.projection(b3);
>>> (b3, p, v - p, v.projection(b1.cross(b2)))
(
	[-7 4 1] / 2,
	[13 35 -16] / 22,
	[9 9 27] / 22,
	[9 9 27] / 22
)
```

Use `projection` to reflect the vector _v_ with respect to the line normal to the vector _n_:

```
>>> let v = [-1 3];
>>> let n = [1 -1];
>>> let p = v.projection(n);
>>> (p, v - (2 * p))
([-2 2], [3 -1])
```

Apply the Gram–Schmidt process to construct an orthonormal basis from a list of vectors.
The first vector in the orthonormal basis _e1_ is the normalized _v1_.
For subsequent vectors, components parallel to earlier basis vectors are subtracted prior to normalization:

```
>>> let [v1, v2, v3, v4] = [
>>> 	-0.449 -0.028 -0.209  0.376;
>>> 	 0.547 -0.943  0.141 -0.522;
>>> 	 0.405 -0.078 -0.511  0.532;
>>> 	-0.358 -0.452  0.651 -0.130
>>> ];
>>> let e1 = v1.normalize;
>>> let e2 = (v2 - v2.projection(e1)).normalize;
>>> let e3 = (v3 - v3.projection(e1) - v3.projection(e2)).normalize;
>>> let e4= (v4 - v4.projection(e1) - v4.projection(e2) - v4.projection(e3)).normalize;
>>> [e1 e2 e3 e4]
[
	-0.72134   -0.04498   -0.33577    0.60407;
	 0.03185   -0.99020   -0.10054   -0.09159;
	 0.67430    0.02831   -0.53150    0.51188;
	 0.15482   -0.12918    0.77114    0.60390
]
```

Find an orthonormal basis for the column space of an integer matrix,
and use that basis to find a QR factorization:

```
>>> let a = [1 3 7; -1 2 -3; -1 2 -9; 1 -4 7; 1 2 1];
>>> let [m, n] = a.shape;
>>> let x = a.transposed;
>>> let v:/1 = { :k |
>>> 	let r = x[k] - 1.to(k - 1).collect { :j |
>>> 		x[k].projection(v(j))
>>> 	}.sum;
>>> 	r.normalize
>>> }.memoize;
>>> let q = 1:n.collect(v:/1).transposed;
>>> let r = q.transposed.dot(a);
>>> (q, r)
(
	[
		[ 1 / 5.sqrt,   9 / (2 * 55.sqrt),   8 * (2 / 583).sqrt],
		[-1 / 5.sqrt,   7 / (4 * 55.sqrt),   8 * (2 / 583).sqrt],
		[-1 / 5.sqrt,   7 / (4 * 55.sqrt), -17 / 1166.sqrt     ],
		[ 1 / 5.sqrt, -17 / (4 * 55.sqrt),       (2 / 583).sqrt],
		[ 1 / 5.sqrt,  13 / (4 * 55.sqrt), -19 / 1166.sqrt     ]
	],
	[
		[5.sqrt,        -3 / 5.sqrt,       27 /  5.sqrt ],
		[0,    4 * (11 / 5).sqrt,      -16 / 55.sqrt ],
		[0,                 0, 2 * (106 / 11).sqrt]
	]
)
```

The projection of _u_ onto _v_ is in the direction of _v_:

```
>>> let [u, v] = Sfc32(17931).randomReal(0, 1, [2 6]);
>>> vectorAngle(projection(u, v), v)
0
```

The projection of _v_ onto itself is _v_:

```
>>> let v = Sfc32(80145).randomReal(0, 1, [6]);
>>> projection(v, v) = v
true
```

* * *

See also: dot, inner, normalize, orthogonalize, vectorAngle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VectorSpaceProjection.html),
[1](https://reference.wolfram.com/language/ref/Projection.html),
_W_
[1](https://en.wikipedia.org/wiki/Vector_projection)
