# normalize

- _normalize(aVector)_

Answer the normalized form of _aVector_.
Equivalent to _v / v.norm_, except that zero vectors (or vectors with `norm` very close to zero) are returned unchanged.

At `List` of `Integer`:

```
>>> [1 1].normalize
([1 1] / 2.sqrt)

>>> [1 5 1].normalize
([1 5 1] / (3 * 3.sqrt))

>>> 1:5.normalize
(1:5 / 1:5.norm)
```

At `zero`:

```
>>> [0 0 0].normalize
[0 0 0]
```

At very close to `zero`:

```
>>> let v = [3E-15, 9E-16, 2E-15];
>>> v.normalize
v
```

At `Complex`:

```
>>> let v = [1j0 0j2 3j0 0j4 5j0 0j6];
>>> v.normalize
(v / 91.sqrt)
```

* * *

See also: abs, dot, norm, sign, standardize, unitVector

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Normalize.html)

Categories: Math, Vector
