# atLevelCollect

_atLevelCollect(aCollection, anInteger | aCollection, aBlock:/1)_

A variant of _withLevelCollect_,
levels are selected if they are equal to _anInteger_ or an element of _aCollection_.

Select one level:

```
>>> [2, 3, 2].iota
[1 2; 3 4; 5 6 :; 7 8; 9 10; 11 12]

>>> [2, 3, 2].iota.atLevelCollect(0, reverse:/1)
[7 8; 9 10; 11 12 :; 1 2; 3 4; 5 6]

>>> [2, 3, 2].iota.atLevelCollect(1, reverse:/1)
[5 6; 3 4; 1 2 :; 11 12; 9 10; 7 8]

>>> [2, 3, 2].iota.atLevelCollect(2, reverse:/1)
[2 1; 4 3; 6 5 :; 8 7; 10 9; 12 11]

>>> [2, 3, 2].iota.atLevelCollect(3, negated:/1)
[-1 -2; -3 -4; -5 -6 :; -7 -8; -9 -10; -11 -12]
```

Select multiple levels:


```
>>> [2, 3, 2].iota.atLevelCollect([0 1], reverse:/1)
[11 12; 9 10; 7 8 :; 5 6; 3 4; 1 2]

>>> [2, 3, 2].iota.atLevelCollect([0 2], reverse:/1)
[8 7; 10 9; 12 11 :; 2 1; 4 3; 6 5]

>>> [2, 3, 2].iota.atLevelCollect([1 2], reverse:/1)
[6 5; 4 3; 2 1 :; 12 11; 10 9; 8 7]

>>> [2, 3, 2].iota.atLevelCollect([0 1 2], reverse:/1)
[12 11; 10 9; 8 7 :; 6 5; 4 3; 2 1]
```

* * *

See also: collect, deepCollect, depth, withLevelCollect
