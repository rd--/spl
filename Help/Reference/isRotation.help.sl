# isRotation

- _isRotation(p, q)_

Answer `true` if the sequence _q_ is a rotation of the sequence _p_.

```
>>> [0 5 8 8 2 3 5 2 9 4 1 1 7 6 4 7]
>>> .isRotation(
>>> 	[1 1 7 6 4 7 0 5 8 8 2 3 5 2 9 4]
>>> )
true
```

A sequence is a rotation, by `zero`, of itself:

```
>>> [1 .. 5].isRotation([1 .. 5])
true
```

* * *

See also: findRotation, isCyclicPermutation

Guides: List Functions, Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CyclicPermutation.html),
_W_
[1](https://en.wikipedia.org/wiki/Cyclic_permutation)
