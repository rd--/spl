# lexicographicCompare

- _lexicographicCompare([x₁ x₂ …], [y₁ y₂ …])_

The lexicographic,
as opposed to canonical,
comparison of the sequences _x_ and _y_.

Find whether two equal length lists are ordered lexicographically:

```
>>> [1 2 3].lexicographicCompare([2 3 4])
-1

>>> [1 2 3].lexicographicCompare([1 2 4])
-1

>>> [2 3 4].lexicographicCompare([1 2 3])
1

>>> [1 2 4].lexicographicCompare([1 2 3])
1
```

At unequal length lists:

```
>>> [1 2].lexicographicCompare([1 2 3])
-1

>>> [1 2 3].lexicographicCompare([1 2])
1

>>> [1 2 3].lexicographicCompare([2 3])
-1

>>> [2 3].lexicographicCompare([1 2 3])
1
```

Shorter lists are ordered first in canonical order:

```
>>> [1 2].canonicalCompare([1 2 3])
-1

>>> [1 2 3].canonicalCompare([1 2])
1

>>> [1 2 3].canonicalCompare([2 3])
1
```

At `String`:

```
>>> 'alice'.lexicographicCompare('bob')
-1

>>> 'alice'.canonicalCompare('bob')
1

>>> 'Thomas'.lexicographicCompare('Thompson')
-1
```

* * *

See also: canonicalCompare, compare, lexicographicSort

Guides: Sort Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LexicographicOrder.html)
[2](https://reference.wolfram.com/language/ref/LexicographicOrder.html),
_W_
[1](https://en.wikipedia.org/wiki/Lexicographic_order)
