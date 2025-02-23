# binLists

- _binLists(data, bins)_

Answer a `List` of lists of the elements of _data_ whose values lie in successive specified _bins_.
_bins_ are given as a _(min, max, width)_ triple.

List elements in specified bins:

```
>>> [1 3 2 1 4 5 6 2].binLists([1 7 1])
[1 1; 2 2; 3; 4; 5; 6]

>>> [1 3 2 1 4 5 6 2].binLists([0 8 2])
[1 1; 3 2 2; 4 5; 6]
```

Make lists of elements in bins of width 1 from 0 to 10:

```
>>> [1 3 2 1 4 5 6 2].binLists([0 10 1])
[; 1 1; 2 2; 3; 4; 5; 6; ; ;]
```

* * *

See also: binCounts, histogramList

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinLists.html)
