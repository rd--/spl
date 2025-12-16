# sternBrocotLevel

- _sternBrocotLevel(n/d)_

Answer the level at which the fraction _n/d_ appears in the Stern-Brocot tree.
It is given by the sum of the continued fraction.

```
>>> 23/37.sternBrocotLevel
9

>>> 23/37.continuedFraction
[0 1 1 1 1 1 4]

>>> [0 1 1 1 1 1 4].sum
9

>>> 9.sternBrocotTree
>>> .includesValue(23/37)
true

>>> 8.sternBrocotTree
>>> .includesValue(23/37)
false
```

* * *

See also: sternBrocotTree

Guides: Mathematical Sequences
