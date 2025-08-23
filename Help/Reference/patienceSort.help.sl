# patienceSort

- _patienceSort([x₁ x₂ …])_

Sort the sequence _x_ using the patience sort algorithm.

```
>>> let l = [4 65 2 -31 0 99 83 782 1];
>>> l.patienceSort
[-31 0 1 2 4 65 83 99 782]
```

Sort a random permutation:

```
>>> system
>>> .randomSample(1:99, 99)
>>> .patienceSort
[1 .. 99]
```

The intermediate state is accessible:

```
>>> [4 65 2 -31 0 99 83 782 1]
>>> .patienceSortPiles
[4 2 -31; 65 0; 99 83 1; 782]
```

* * *

See also: longestIncreasingSubsequence, mergeSort, quickSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Patience_sorting)

Further Reading: Mallows 1962
