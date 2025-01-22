# cartesianProduct

- _cartesianProduct(aCollection, anotherCollection)_

Answer an array of the two-tuples of the cartesian product of _aCollection_ and _anotherCollection_.

The Cartesian product of two sets A and B is the set of all (a, b) where a ∈ A and b ∈ B.

The Cartesian product of two two-vectors is a 4×2 matrix:

```
>>> let x = [0 1];
>>> x.cartesianProduct(x)
[0 0; 0 1; 1 0; 1 1]

>>> [0 1].cartesianProduct([2 3])
[0 2; 0 3; 1 2; 1 3]
```

The Cartesian product of two three-vectors is a 9×2 matrix:

```
>>> [1 8 6].cartesianProduct([9 3 2])
[1 9; 1 3; 1 2; 8 9; 8 3; 8 2; 6 9; 6 3; 6 2]
```

`cartesianProduct` is a special case of `tuples`:

```
>>> [0 1].cartesianProduct([2 3 4])
[0 2; 0 3; 0 4; 1 2; 1 3; 1 4]

>>> [0 1; 2 3 4].tuples
[0 2; 0 3; 0 4; 1 2; 1 3; 1 4]
```

* * *

See also: cartesianProductDo, tuples

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianProduct.html)

Categories: Enumerating
