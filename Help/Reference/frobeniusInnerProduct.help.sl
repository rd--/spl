# frobeniusInnerProduct

- _frobeniusInnerProduct(m₁, m₂)_

Answer the Frobenius inner product
also known as the Double-dot product,
of the two matrices m₁ and m₂.

Real valued matrices:

```
>>> let a = [2 0 6; 1 -1 2];
>>> let b = [8 -3 2; 4 1 -5];
>>> (
>>> 	a.frobeniusInnerProduct(b),
>>> 	a.hadamardProduct(b).sum.sum
>>> )
(21, 21)
```

Complex valued matrices:

```
>>> let a = [1J1 0J-2; 3 -5];
>>> let b = [-2 0J3; 4J-3 6];
>>> (
>>> 	a.frobeniusInnerProduct(b),
>>> 	b.frobeniusInnerProduct(a),
>>> 	a.frobeniusInnerProduct(a),
>>> 	b.frobeniusInnerProduct(b)
>>> )
(-26J-7, -26J7, 40, 74)
```

* * *

See also: conjugate, dot, trace, transpose

Guides: Matrix Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Frobenius_inner_product)
