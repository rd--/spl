# dotProduct

- _dotProduct(u, v)_

Answer the dot product of _u_ and _v_,
also called the inner product.

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
_W_
[1](https://en.wikipedia.org/wiki/Dot_product)
