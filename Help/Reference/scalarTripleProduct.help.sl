# scalarTripleProduct

- _scalarTripleProduct(v₁, v₂, v₃)_

Answer the scalar triple product of three vectors _v₁_, _v₂_ and _v₃_.

```
>>> let a = [3 4 5];
>>> let b = [4 3 5];
>>> let c = [-5 -12 -13];
>>> (
>>> 	scalarTripleProduct(a, b, c),
>>> 	scalarTripleProduct(b, c, a),
>>> 	scalarTripleProduct(c, a, b),
>>> 	determinant([a b c])
>>> )
(6, 6, 6, 6)
```

* * *

See also: cross, determinant, dot, vectorTripleProduct

Guides: Vector Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ScalarTripleProduct.html),
_W_
[1](https://en.wikipedia.org/wiki/Triple_product)
