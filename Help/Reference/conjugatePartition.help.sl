# conjugatePartition

- _conjugatePartition(p)_

Answer the conjugate partition of the partition _p_.

A partition of ten and its conjugate:

```
>>> [6 3 1].conjugatePartition
[3 2 2 1 1 1]

>>> [3 2 2 1 1 1].conjugatePartition
[6 3 1]
```

A partition of fifteen and its conjugate:

```
>>> [6 3 3 2 1].conjugatePartition
[5 4 3 1 1 1]

>>> [5 4 3 1 1 1].conjugatePartition
[6 3 3 2 1]
```

Some partitions are self-conjugate:

```
>>> [5 2 1 1 1].conjugatePartition
[5 2 1 1 1]
```

* * *

See also: ferrersDiagram, integerPartitions

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConjugatePartition.html)
