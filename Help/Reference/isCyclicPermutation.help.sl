# isCyclicPermutation

- _isCyclicPermutation(p)_

Answer `true` if the permutation _p_ is cyclic permutation,
according to the definition that induces a rotation.

```
>>> let a = [1 2 3 4];
>>> let b = [3 4 1 2];
>>> let p = a.findPermutation(b);
>>> (p.cycles, p.isCyclicPermutation)
([1 3 ; 2 4], true)
```

* * *

See also: findRotation, isRotation

Guides: Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CyclicPermutation.html),
_W_
[1](https://en.wikipedia.org/wiki/Cyclic_permutation)
