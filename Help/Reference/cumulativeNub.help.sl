# cumulativeNub

- _cumulativeNub(aList, compareBlock:/2)_
- _cumulativeNub(aList)_

Remove from each sublist at _aList_ any items that appear in any earlier sublist,
according to _compareBlock_,
which is set to `=` in the unary case.
As with `nub` retained items will remain in sequence.

```
>>> [1; 1 2; 1 2 3; 1 2 3 4].cumulativeNub
[1; 2; 3; 4]

>>> [1 2 3; 3 4 5; 5 6 7].cumulativeNub
[1 2 3; 4 5; 6 7]
```

* * *

See also: add, includesBy, nub, select, Set
