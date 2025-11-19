# lexicographicOrder

- _lexicographicOrder([x₁ x₂ …], [y₁ y₂ …])_

Answer `negate` of `compare` of the sequences _x_ and _y_.

Find whether two equal length lists are ordered lexicographically:

```
>>> [1 2 3].lexicographicOrder([2 3 4])
1

>>> [1 2 3].lexicographicOrder([1 2 4])
1

>>> [2 3 4].lexicographicOrder([1 2 3])
-1

>>> [1 2 4].lexicographicOrder([1 2 3])
-1
```

At unequal length lists:

```
>>> [1 2].lexicographicOrder([1 2 3])
1

>>> [1 2 3].lexicographicOrder([1 2])
-1

>>> [1 2 3].lexicographicOrder([2 3])
1

>>> [2 3].lexicographicOrder([1 2 3])
-1
```

Shorter lists are ordered first in canonical order:

```
>>> [1 2].canonicalOrder([1 2 3])
1

>>> [1 2 3].canonicalOrder([1 2])
-1

>>> [1 2 3].canonicalOrder([2 3])
-1
```

At `String`:

```
>>> 'alice'.lexicographicOrder('bob')
1

>>> 'alice'.canonicalOrder('bob')
-1
```

* * *

See also: compare

Guides: Sort Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LexicographicOrder.html)
