# norm

- _norm(z)_

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

>>> [1 0 1 0 0 1 0 0 0 1 0 0 0 0 1].norm
5.sqrt
```

C.f. `hypot`:

```
>>> [3 4].norm
5

>>> 3.hypot(4)
5
```

Euclidean Distance Between Two Points
Calculate the distance between two points as the `norm` of the difference between the vector elements.

```
>>> let a = [0 3];
>>> let b = [-2 1];
>>> (b - a).norm
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
