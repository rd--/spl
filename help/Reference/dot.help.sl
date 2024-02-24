# dot

- _dot(aSequence, anotherSequence)_

Scalar product of vectors in two dimensions:

```
>>> [1 1].dot([-1 1])
0
```

Scalar product of vectors in three dimensions:

```
>>> [3.2 4.2 5.2].dot([0.75 1.1 0.0625])
7.345

>>> [1 1 1] dot: [-1 -1 1]
-1

>>> [1 -1 2] dot: [0 1 1]
1
```

Dot product of exact vectors:

```
>>> [1 2 3 4 5] dot: [1 8 9 0 -1]
39
```

Dot allows complex inputs, but does not conjugate any of them:

```
>>> let u = [1 2j-1];
>>> let z = 7;
>>> let v = [z 3];
>>> u dot: v
(6j-3 + z)
```

A 2×3 matrix can be multiplied by a 2-vector only on the left:

```
>>> let v = [0.618678 0.213605];
>>> let m = [0.187902 0.498054 0.767621; 0.226789 0.852257 0.819982];
>>> v.dot(m)
[0.16469 0.49018 0.65006]
```

A 2×3 matrix can be multiplied by a 3-vector only on the right:

```
>>> let m = [0.187902 0.498054 0.767621; 0.226789 0.852257 0.819982];
>>> let v = [0.804978 0.587651 0.2951];
>>> m.dot(v)
[0.67046 0.92537]
```

Define a square matrix and a compatible vector.
The products m.v and v.m return different vectors.
The product v.m.v is a scalar.

```
>>> let m = [1 2; 3 4];
>>> let v = [5 6];
>>> (m.dot(v), v.dot(m), v.dot(m).dot(v))
([17 39], [23 34], 319)
```

Define a column and row matrices c and r with the same numerical entries as v.
Products involving m, c and r have the same entries as those involving m and v, but are all matrices.

```
>>> let m = [1 2; 3 4];
>>> let c = [5; 6];
>>> let r = [[5 6]];
>>> (r.dot(m), m.dot(c), r.dot(m).dot(c))
([[23, 34]], [17; 39], [[319]])
```

Define a matrix and two vectors.
Since _m.u_ is a vector, _m.u.v_ is an allowed product.
Note that it is effectively multiplying _v_ on the left side of the matrix, not the right.

```
>>> let m = [0.5 0.32; 0.19 0.73];
>>> let u = [1.5 0.27];
>>> let v = [-3.2 5.5];
>>> (m.dot(u).dot(v), v.dot(m).dot(u), u.dot(m).dot(v))
(-0.02493, -0.02493, 1.15989)
```

Multiply real machine-number matrices:

```
>>> let m = [1.2 3.2 5.2; 2.2 4.2 -6.4; 3.1 5.1 7.3];
>>> let n = [4.2 6.3 8.2; 2.5 -7.3 9.3; 6.3 8.3 -1.10];
>>> m.dot(n)
[45.8 27.36 33.88; -20.58 -69.92 64.14; 71.76 42.89 64.82]
```

Product of complex matrices:

```
>>> let m = [1j1 2j0 3j-2; 0j0 4j0 5j2; 0j0 0j0 6j0];
>>> let n = [6j1 4j0 5j-7; 5j0 3j0 2j1; 5j0 2j0 7j0];
>>> m.dot(n)
[30j-3 16j0 37j-14; 45j10 22j4 43j18; 30j0 12j0 42j0]
```

Product of exact matrices:

```
>>> let m = [1 2; 3 4; 5 6];
>>> let n = [6 5 4; 3 2 1];
>>> (m.dot(n), n.dot(m))
([12 9 6; 30 23 16; 48 37 26], [41 56; 14 20])
```

Project the vector _(-1, 3)_ on the line spanned by the vector _(1, 1)_:

```
>>> let v = [-1 3];
>>> let l = [1 1];
>>> v.dot(l) / l.dot(l) * l
[1 1]
```

Project the vector _(-1, -4, -2)_ on the plane spanned by the vectors _(1, 1, -1)_ and _(1, 0, 1)_:

```
>>> let v = [1 2 0.5];
>>> let b1 = [2 4 -2];
>>> let b2 = [-3 3 0];
>>> let b3 = b2 - (b2.dot(b1) / b1.dot(b1) * b1);
>>> let p = (v.dot(b1) / b1.dot(b1) * b1) + (v.dot(b3) / b3.dot(b3) * b3);
>>> v - p
[9/22 9/22 27/22]
```

For a vector _v_ with real entries, _v.norm_ equals _(v.v).sqrt_:

```
>>> let v = system.nextRandomFloat(3);
>>> v.dot(v).sqrt
v.norm
```

* * *

See also: inner, outer

References:
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=VectorCalculus/DotProduct),
_Mathematica_
[1](https://mathworld.wolfram.com/DotProduct.html)
[2](https://reference.wolfram.com/language/ref/Dot.html)
