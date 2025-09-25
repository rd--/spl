# vectorTripleProduct

- _vectorTripleProduct(v₁, v₂, v₃)_

Answer the vector triple product of three vectors _v₁_, _v₂_ and _v₃_.

```
>>> let a = [3 4 5];
>>> let b = [4 3 5];
>>> let c = [-5 -12 -13];
>>> (
>>> 	vectorTripleProduct(a, b, c),
>>> 	a.cross(b.cross(c)),
>>> 	(b * a.dot(c)) - (c * (a.dot(b)))
>>> )
(
	[-267 204 -3],
	[-267 204 -3],
	[-267 204 -3]
)
```

* * *

See also: cross, determinant, dot, scalarTripleProduct

Guides: Vector Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VectorTripleProduct.html),
_W_
[1](https://en.wikipedia.org/wiki/Triple_product)
