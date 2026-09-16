# isRotationPermutation

- _isRotationPermutation(p)_

Answer `true` if the permutation _p_ induces a rotation,
sometimes called a cyclic permutation.

```
>>> let a = [1 2 3 4];
>>> let b = [3 4 1 2];
>>> let p = a.findPermutation(b);
>>> (p.cycles, p.isRotationPermutation)
([1 3 ; 2 4], true)
```

* * *

See also: findRotation, isRotation

Guides: Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CyclicPermutation.html),
