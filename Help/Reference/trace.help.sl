# trace

- _trace(m, f:/1=Σ)_

Answer the trace of the matrix or tensor list.
Properly, a trace is only defined for square matrices.

At a matrix answers the sum of the diagonal elements:

```
>>> [1 2 3; 4 5 6; 7 8 9].trace
[1 5 9].sum

>>> [5 7].iota.trace
[1 9 17 25 33].sum
```

For a vector `trace` gives the sum of the elements:

```
>>> 3.iota.trace
1 + 2 + 3
```

For a higher-rank Array, trace gives the `sum` of elements with equal indices:

```
>>> [3 3 3].iota.trace
1 + 14 + 27
```

Apply a function to the diagonal elements of a matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9]
>>> .trace(Tuple:/1)
(1, 5, 9)
```

Find the determinant of a triangular matrix:

```
>>> [1 2 3; 0 4 5; 0 0 6]
>>> .trace(product:/1)
(1 * 4 * 6)
```

`trace` if `identity` is equivalent to `diagonal` for a matrix _m_:

```
>>> let m = [1 2 3; 4 5 6];
>>> (m.trace(identity:/1), m.diagonal)
([1 5], [1 5])
```

* * *

See also: diagonal, transposed

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MatrixTrace.html)
[2](https://reference.wolfram.com/language/ref/Tr.html),
_W_
[1](https://en.wikipedia.org/wiki/Trace_(linear_algebra))

Categories: Math, Matrix
