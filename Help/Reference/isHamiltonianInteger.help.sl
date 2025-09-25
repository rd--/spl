# isHamiltonianInteger

- _isHamiltonianInteger(x)_

A Hamiltonian integer is a `Quaternion` number _a+bi+cj+dk_ where _a_, _b_, _c_ and _d_ are integers.

```
>>> Quaternion([1 2 3 4])
>>> .isHamiltonianInteger
true
```

Integers are Hamiltonian integers with a zero imaginary part:

```
>>> 23.isHamiltonianInteger
true
```

* * *

See also: Quaternion, isGaussianInteger, isInteger

Guides: Quaternion Functions, Integer Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HamiltonianInteger.html),

Categories: Testing
