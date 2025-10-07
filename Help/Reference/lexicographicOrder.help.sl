# lexicographicOrder

- _lexicographicOrder([x₁ x₂ …], [y₁ y₂ …])_

Answer `negate` of `compare` of the sequences _x_ and _y_.

Find whether two lists are ordered lexicographically:

```
>>> [1 2 3 4].lexicographicOrder([3 4])
1
```

Shorter lists are ordered first in canonical order:

```
>>> [1 2 3 4].canonicalOrder([3 4])
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

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LexicographicOrder.html)
