# atLevelCollect

- _atLevelCollect(aCollection, anInteger | aCollection, aBlock:/1)_

A variant of `withLevelCollect`,
levels are selected if they are equal to _anInteger_ or are an element of _aCollection_.

Select one level:

```
>>> [2 3 2].iota
[1 2; 3 4; 5 6:; 7 8; 9 10; 11 12]

>>> [2 3 2].iota.atLevelCollect(0, reverse:/1)
[7 8; 9 10; 11 12:; 1 2; 3 4; 5 6]

>>> [2 3 2].iota.atLevelCollect(1, reverse:/1)
[5 6; 3 4; 1 2:; 11 12; 9 10; 7 8]

>>> [2 3 2].iota.atLevelCollect(2, reverse:/1)
[2 1; 4 3; 6 5:; 8 7; 10 9; 12 11]

>>> [2 3 2].iota.atLevelCollect(3, negated:/1)
[-1 -2; -3 -4; -5 -6:; -7 -8; -9 -10; -11 -12]
```

Select multiple levels:

```
>>> [2 3 2].iota.atLevelCollect([0 1], reverse:/1)
[11 12; 9 10; 7 8:; 5 6; 3 4; 1 2]

>>> [2 3 2].iota.atLevelCollect([0 2], reverse:/1)
[8 7; 10 9; 12 11:; 2 1; 4 3; 6 5]

>>> [2 3 2].iota.atLevelCollect([1 2], reverse:/1)
[6 5; 4 3; 2 1:; 12 11; 10 9; 8 7]

>>> [2 3 2].iota.atLevelCollect([0 1 2], reverse:/1)
[12 11; 10 9; 8 7:; 6 5; 4 3; 2 1]
```

Construct a 2×3×4 element array and calculate the `mean` at each level:

```
>>> let r = [2 3 4].iota(0, 1);
>>> let m = { :l :k | l.atLevelCollect([k], mean:/1) };
>>> (r, r.m(0), r.m(1), r.m(2))
(
	[
		 0  1  2  3;
		 4  5  6  7;
		 8  9 10 11:;
		12 13 14 15;
		16 17 18 19;
		20 21 22 23
	],
	[
		 6  7  8  9;
		10 11 12 13;
		14 15 16 17
	],
	[
		 4  5  6  7;
		16 17 18 19
	],
	[
		 1.5  5.5  9.5;
		13.5 17.5 21.5
	]
)
```

* * *

See also: collect, deepCollect, depth, withLevelCollect

Categories: Enumerating
