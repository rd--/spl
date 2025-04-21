# bockerLiptakAlgorithm

- _bockerLiptakAlgorithm(aList)_

Implements the round robin algorithm of Böcker and Lipták.

```
>>> [5 8 9 12].bockerLiptakAlgorithm
[
	0 Infinity Infinity Infinity Infinity;
	0 16 32 8 24;
	0 16 17 8 9;
	0 16 12 8 9
]

>>> [5 8 9 12].frobeniusNumber
11

>>> [0 16 12 8 9].max - [5 8 9 12].min
11
```

* * *

See also: frobeniusNumber, frobeniusSolve

Guides: Combinatorial Functions

Further Reading: Böcker and Lipták 2004
