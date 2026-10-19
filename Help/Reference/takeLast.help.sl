# takeLast

- _takeLast([x₁ x₂ …], n, y)_

Answer a copy of the sequence _x_ with only the last _n_ places.
Alias for the ternary form of `last`.
Fill any empty slots with the object _y_.

```
>>> [5 4 3 2 1].takeLast(3, 0)
[3 2 1]

>>> [5 4 3 2 1].takeLast(8, 0)
[0 0 0 5 4 3 2 1]
```

* * *

See also: take, takeFirst

Guides: List Functions

References:
_J_
[1](https://www.jsoftware.com/help/dictionary/d521.htm)
