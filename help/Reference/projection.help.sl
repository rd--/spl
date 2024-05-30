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

Project the vector _v=(1,3)_ on the line spanned by the vector _l=(1,1)_:

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

The projection of _u_ onto _v_ is in the direction of _v_:

```
>>> let [u, v] = Sfc32(17931).randomFloat(0, 1, [2 6]);
>>> vectorAngle(projection(u, v), v)
0
```

* * *

See also: dot, inner, normalize, orthogonalize, vectorAngle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Projection.html),
_W_
[1](https://en.wikipedia.org/wiki/Vector_projection)
