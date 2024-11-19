# normalize

- _normalize(aVector)_
- _normalize(aCollection, minima, maxima)_

The unary form answers the normalized form of _aVector_.
Equivalent to _v / v.norm_, except that zero vectors (or vectors with `norm` very close to zero) are answered unchanged.

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

The ternary form answers the collection rescaled to the indicated range
taking as the domain the `min` and `max` of the collection:

```
>>> [-0.2 -0.1 0.4 0.9].normalize(-1, 1)
[-1 -9/11 1/11 1]

>>> [-0.2 -0.1 0.4 0.9].rescale(-0.2, 0.9, -1, 1)
[-1 -9/11 1/11 1]
```

Note that this is not the ordinary normalize signal function,
which takes the domain as ± of the `max` of the absolute values of the `min` and `max`:

```
>>> [-0.2 -0.1 0.4 0.9].rescale(-0.9, 0.9, -1, 1)
[-2/9 -1/9 4/9 1]
```

* * *

See also: abs, dot, norm, normalizeSignal, rescale, sign, standardize, unitVector

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Normalize.html)

Categories: Math, Vector
