# findRotation

- _findRotation(p, q)_

Answer the integer _n_ such that `rotateLeft` of _p_ by _n_ is _q_,
or `nil` if _q_ is not a rotation of _p_.

```
>>> let p = [0 5 8 8 2 3 5 2 9 4 1 1 7 6 4 7];
>>> let q = [1 1 7 6 4 7 0 5 8 8 2 3 5 2 9 4];
>>> let r = p.findRotation(q);
>>> (r, p.rotateLeft(r) = q)
(10, true)
```

If _p_ and _q_ are equal answers `zero`:

```
>>> 1:5.findRotation(1:5)
0

>>> [1 .. 5].findRotation([1 .. 5])
0
```

* * *

See also: isCyclicPermutation, isRotation, rotateLeft

Guides: List Functions, Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CyclicPermutation.html),
_W_
[1](https://en.wikipedia.org/wiki/Cyclic_permutation)
