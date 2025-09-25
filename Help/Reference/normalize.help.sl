# normalize

- _normalize(u)_

Answer the normalized form of the vector _u_.
Equivalent to _u / u.norm_, except that zero vectors (or vectors with `norm` very close to zero) are answered unchanged.

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
>>> let v = [1J0 0J2 3J0 0J4 5J0 0J6];
>>> v.normalize
(v / 91.sqrt)
```

At `Quaternion`:

```
>>> let a = Quaternion([1 2 3 4]);
>>> let b = a.norm;
>>> let c = a.normalize;
>>> (b, c, c.norm)
(30.sqrt, Quaternion([1 2 3 4] / 30.sqrt), 1)
```

* * *

See also: abs, dot, norm, normalizeRange, normalizeSignal, normalizeSum, rescale, sign, standardize, unitVector

Guides: Vector Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Normalize.html)

Categories: Math, Vector
