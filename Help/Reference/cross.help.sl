# cross

- _cross(aVector, anotherVector)_

The cross product of two vectors in three dimensions:

```
>>> let u = [1 2 -1];
>>> let v = [-1 1 0];
>>> u.cross(v)
[1 1 3]
```

The cross product of a single vector in two dimensions:

```
>>> [1 3.sqrt].cross
[3.sqrt.-, 1]
```

The cross product of complex vectors:

```
>>> [3.2 4.2 5.2].cross([0.75 0.09 0.06])
[-0.216 3.708 -2.862]
```

The cross product of complex vectors:

```
>>> [1.3J1 2 3J-2].cross([6J1 4 5J-7])
[-2J-6 6.5J-4.9 -6.8J2]
```

The cross product of exact vectors:

```
>>> [1 2 3].cross([1 8 9])
[-6 -6 6]

>>> [1 2 3].cross([1 4 9])
[6 -6 2]
```

`cross` is antisymmetric:

```
>>> let a = [1 2 3];
>>> let b = [4 5 6];
>>> a.cross(b)
b.-.cross(a)
```

Use dot products to verify that _a * b_ is perpendicular to _a_ and _b_:

```
>>> let a = [4 -2 1];
>>> let b = [1 -1 3];
>>> let c = a.cross(b);
>>> (c, c.dot(a), c.dot(b))
([-5 -11 -2], 0, 0)
```

The cross product of two _n×3_ matrices:

```
>>> let a = [13 14 2; 14 10 2; 5 9 15; 15 3 15; 15 8 13];
>>> let b = [4 11 23; 20 24 17; 1 22 24; 17 19 19; 10 17 5];
>>> cross:/2.map(a, b)
[
	 300 -291  87;
	 122 -198 136;
	-114 -105 101;
	-228 -30  234;
	-181  55  175
]
```

Find the area of the parallelogram defined by two vectors:

```
>>> [1 2 -2].cross([1 -1 2]).norm
29.sqrt
```

If _u_ and _v_ are linearly independent, _u × v_ is nonzero and orthogonal to _u_ and _v_:

```
>>> let [u, v] = [-6 -3 -4; 9 8 -6];
>>> let w = u.cross(v);
>>> (w, u.dot(w), v.dot(w))
([50 -72 -21], 0, 0)
```

If _u_ and _v_ are linearly dependent, _u × v_ is zero:

```
>>> let u = [-6 -3 -4];
>>> let v = u * 7;
>>> u.cross(v)
[0 0 0]
```

* * *

See also: dot, kroneckerProduct, outer, permutationSymbol, vectorAngle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CrossProduct.html)
[2](https://mathworld.wolfram.com/PerpendicularVector.html)
[3](https://reference.wolfram.com/language/ref/Cross.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/cross.html),
_W_
[1](https://en.wikipedia.org/wiki/Cross_product)

Categories: Math, Operator
