# shuffleSort

- _shuffleSort([x₁ x₂ …], f:/1)_

Sort the sequence _x_ in place using the shuffle sort algorithm.
The sort process can be monitored by the unary block _f_.

Sort list:

```
>>> [1 3 5 2 4].shuffleSort
[1 2 3 4 5]
```

Sort is in place:

```
>>> let s = [1 3 5 2 4];
>>> let t = s.shuffleSort;
>>> (t, t == s)
([1 2 3 4 5], true)
```

* * *

See also: shuffleSortMatrix, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Shuffle_sort)
