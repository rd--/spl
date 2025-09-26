# isIntegerPartition

- _isIntegerPartition([x₁ x₂ …], n)_

Answer `true` if the list _x_ is an integer partition of _n_,
_x_ must be a weakly decreasing list of positive integers summing to _n_.

```
>>> [3 2 1].isIntegerPartition(6)
true

>>> [2.5 2.5 1].isIntegerPartition(6)
false

>>> [3 2 1 0].isIntegerPartition(6)
false

>>> [3 1 2].isIntegerPartition(6)
false
```

* * *

See also: integerPartitions

Guides: Combinatorial Functions
