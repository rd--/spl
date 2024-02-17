# trace

- _trace(aSequence, aBlock:/1)_
- _trace(alpha)_ => _trace(alpha, +)_

Answer the trace of the matrix or tensor list.

```
>>> [1 2 3; 4 5 6; 7 8 9].trace
(1 + 5 + 9)
```

For a vector Tr gives the sum of the elements:

```
>>> 1:3.trace
(1 + 2 + 3)
```

For a higher-rank Array, trace gives the sum of elements with equal indices:

```
>>> [3 3 3].iota.trace
(1 + 14 + 27)
```

Apply a function to the diagonal elements of a matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9].trace(asTuple:/1)
(1, 5, 9)
```

Find the determinant of a triangular matrix:

```
>>> [1 2 3; 0 4 5; 0 0 6].trace(product:/1)
(1 * 4 * 6)
```

_trace(m, asList:/1)_ is equivalent to _diagonal(m)_ for a matrix m:

```
>>> let m = [1 2 3; 4 5 6];
>>> (m.trace(asList:/1), m.diagonal)
([1 5], [1 5])
```

* * *

See also: diagonal, transpose

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Tr.html)
