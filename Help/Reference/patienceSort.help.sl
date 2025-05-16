# patienceSort

- _patienceSort(aSequence)_

Sort _aSequence_ using the patience sort algorithm.

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

* * *

See also: longestIncreasingSubsequence, mergeSort, quickSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Patience_sorting)

Further Reading: Mallows 1962
