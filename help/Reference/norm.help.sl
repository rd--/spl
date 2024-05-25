# norm

- _norm(z)_
- _norm(z, p)_

Answer the _norm_ of a number or vector.
For complex numbers `norm` is `abs`.
For vectors answer the Euclidean norm, _norm(v) = (v * v.conjugated).sqrt_.
The vector norm is also called the vector magnitude or Euclidean length.

At `Complex`:

```
>>> -2j1.norm
5.sqrt
```

At `List`:

```
>>> [1 -2 3].norm
3.7417

>>> [2 2 2].norm
12.sqrt

>>> [1 0 1 0 0 1 0 0 0 1 0 0 0 0 1].norm
5.sqrt
```

As square root of sum of squares:

```
>>> let v = 1:5;
>>> v.norm
(v ^ 2).sum.sqrt
```

As square root of `dot` with `conjugated`:

```
>>> let v = 1:5;
>>> v.norm
v.dot(v.conjugated).sqrt
```

C.f. `hypot`:

```
>>> [3 4].norm
5

>>> 3.hypot(4)
5
```

Calculate the 1-norm of a vector, which is the sum of the element magnitudes, or the Manhattan distance from the origin:

```
>>> [-2 3 -1].norm(1)
6
```

Calculate the Euclidean distance between two points as the `norm` of the difference between the vector elements:

```
>>> let a = [0 3];
>>> let b = [-2 1];
>>> (b - a).norm
2.8284
```

The 2-norm of a vector, the Euclidean distance from the origin:

```
>>> [-2 -2].norm(2)
2.8284
```

* * *

See also: abs, dot, hypot, rootMeanSquare

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Norm.html)
[2](https://reference.wolfram.com/language/ref/Norm.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/norm.html)
[2](https://mathworks.com/help/matlab/ref/vecnorm.html)
