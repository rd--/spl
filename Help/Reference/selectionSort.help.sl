# selectionSort

- _selectionSort([x₁ x₂ …])_

Sort the sequence _x_ in place using the selection sort algorithm.

Sort list:

```
>>> [1 3 5 2 4].selectionSort
[1 2 3 4 5]
```

Sort is in place:

```
>>> let s = [1 3 5 2 4];
>>> let t = s.selectionSort;
>>> (t, t == s)
([1 2 3 4 5], true)
```

* * *

See also: selectionSortMatrix, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Selection_sort)
