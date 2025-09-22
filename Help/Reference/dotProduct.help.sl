# dotProduct

- _dotProduct(u, v)_

Answer the dot product of _u_ and _v_,
also called the scalar product or inner product.

Scalar product of vectors in two dimensions:

```
>>> [1 1].dotProduct([-1 1])
0

>>> [1 1].dotProduct([2 3])
5

>>> let u = [3.2 4.2 5.2];
>>> let v = [0.75 1.1 0.0625];
>>> u.dotProduct(v)
7.345
```

It is an `error` if the vectors are of unequal size:

```
>>> {
>>> 	dotProduct([3 4 5])
>>> }.hasError
true
```

At `PlanarCoordinates`:

```
>>> let u = [4 11];
>>> let v = [3 14];
>>> let p = PlanarCoordinates(u);
>>> let q = PlanarCoordinates(v);
>>> (p.dotProduct(q), u.dot(v))
(166, 166)
```

At `CartesianCoordinates`:

```
>>> let u = [3.2 4.2 5.2];
>>> let v = [0.75 1.1 0.0625];
>>> let p = CartesianCoordinates(u);
>>> let q = CartesianCoordinates(v);
>>> (p.dotProduct(q), u.dot(v))
(7.345, 7.345)
```

* * *

See also: dot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DotProduct.html)
[2](http://reference.wolfram.com/language/ref/Dot.html),
_W_
[1](https://en.wikipedia.org/wiki/Dot_product)
[2](https://en.wikipedia.org/wiki/Inner_product_space)
