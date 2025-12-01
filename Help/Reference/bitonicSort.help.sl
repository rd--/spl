# bitonicSort

- _bitonicSort([x₁ x₂ …], f:/1)_

Sort the sequence _x_ in place using the bitonic sort algorithm.
The sequence must be a permutation list.
The sort process can be monitored by the unary block _f_.

Sort list:

```
>>> [1 3 5 2 4 7 8 6]
>>> .bitonicSort
[1 2 3 4 5 5 6 7 8]
```

Sort is in place:

```
>>> let s = [1 3 5 2 4 7 8 6];
>>> let t = s.bitonicSort;
>>> (t, t == s)
([1 2 3 4 5 6 7 8], true)
```

* * *

See also: bitonicSortMatrix, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Bitonic_sorter)
