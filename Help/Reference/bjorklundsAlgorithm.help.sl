# bjorklundsAlgorithm

- _bjorklundsAlgorithm(k, n)_

Bjorklund’s algorithm to construct a binary sequence of _n_ bits with _k_ ones,
such that the _k_ ones are distributed as evenly as possible among the _n - k_ zeroes.

Two Bjorklund’s algorithm sequences:

```
>>> 3.bjorklundsAlgorithm(8)
[1 0 0 1 0 0 1 0]

>>> 5.bjorklundsAlgorithm(13)
[1 0 0 1 0 1 0 0 1 0 1 0 0]
```

Bjorklund’s algorithm sequences may be periodic:

```
>>> 9.bjorklundsAlgorithm(15)
[1 0 1 1 0 1 0 1 1 0 1 0 1 1 0]

>>> 9.bjorklundsAlgorithm(15)
>>> .findRepeat
[1 0 1 1 0]

>>> [1 0 1 1 0].repeat(3)
[1 0 1 1 0 1 0 1 1 0 1 0 1 1 0]
```

Bjorklund’s algorithm sequences for a set of _k,n_ parameters:

```
>>> let m = [
>>> 	2: [3 5],
>>> 	3: [4 5 8],
>>> 	4: [7 9 12],
>>> 	5: [6 7 8 9 11 12 13],
>>> 	6: [7 13],
>>> 	7: [8 9 10 12],
>>> 	9: [14],
>>> 	11: [12]
>>> ];
>>> m.keys.collect { :k |
>>> 	m[k].collect { :n |
>>> 		(k, n)
>>> 		->
>>> 		k.bjorklundsAlgorithm(n)
>>> 	}
>>> }.catenate
[
	(2, 3) -> [1 0 1],
	(2, 5) -> [1 0 0 1 0],
	(3, 4) -> [1 0 1 1],
	(3, 5) -> [1 0 1 0 1],
	(3, 8) -> [1 0 0 1 0 0 1 0],
	(4, 7) -> [1 0 1 0 1 0 1],
	(4, 9) -> [1 0 0 1 0 1 0 1 0],
	(4, 12) -> [1 0 0 1 0 0 1 0 0 1 0 0],
	(5, 6) -> [1 0 1 1 1 1],
	(5, 7) -> [1 0 1 1 0 1 1],
	(5, 8) -> [1 0 1 1 0 1 1 0],
	(5, 9) -> [1 0 1 0 1 0 1 0 1],
	(5, 11) -> [1 0 0 1 0 1 0 1 0 1 0],
	(5, 12) -> [1 0 0 1 0 1 0 0 1 0 1 0],
	(5, 13) -> [1 0 0 1 0 1 0 0 1 0 1 0 0],
	(6, 7) -> [1 0 1 1 1 1 1],
	(6, 13) -> [1 0 0 1 0 1 0 1 0 1 0 1 0],
	(7, 8) -> [1 0 1 1 1 1 1 1],
	(7, 9) -> [1 0 1 1 1 0 1 1 1],
	(7, 10) -> [1 0 1 1 0 1 1 0 1 1],
	(7, 12) -> [1 0 1 1 0 1 0 1 1 0 1 0],
	(9, 14) -> [1 0 1 1 0 1 1 0 1 1 0 1 1 0],
	(11, 12) -> [1 0 1 1 1 1 1 1 1 1 1 1]
]
```

_×·_ notation for a set of Bjorklund’s algorithm sequences:

```
>> let m = [
>> 	2: [3 5],
>> 	3: [4 5 8],
>> 	4: [7 9 12 15],
>> 	5: [6 7 8 9 11 12 13 16],
>> 	6: [7 13],
>> 	7: [8 9 10 12 15 16 17 18],
>> 	8: [17 19],
>> 	9: [14 16 22 23],
>> 	11: [12 24],
>> 	13: [24],
>> 	15: [34]
>> ];
>> m.keys.collect { :k |
>> 	m[k].collect { :n |
>> 		k.bjorklundsAlgorithm(n)
>> 		.boxNotation(['·' '×'])
>> 	}
>> }.catenate.unlines
×·×
×··×·
×·××
×·×·×
×··×··×·
×·×·×·×
×··×·×·×·
×··×··×··×··
×···×···×···×··
×·××××
×·××·××
×·××·××·
×·×·×·×·×
×··×·×·×·×·
×··×·×··×·×·
×··×·×··×·×··
×···×··×··×··×··
×·×××××
×··×·×·×·×·×·
×·××××××
×·×××·×××
×·××·××·××
×·××·×·××·×·
×··×·×·×·×·×·×·
×··×·×·×··×·×·×·
×··×·×··×·×··×·×·
×··×·×··×·×··×·×··
×··×·×·×·×·×·×·×·
×··×·×·×··×·×·×··×·
×·××·××·××·××·
×·××·×·×·××·×·×·
×··×·×··×·×··×·×··×·×·
×··×·×··×·×··×·×··×·×··
×·××××××××××
×··×·×·×·×·×··×·×·×·×·×·
×·××·×·×·×·×·××·×·×·×·×·
×··×·×·×·×··×·×·×·×··×·×·×·×··×·×·
```

A matrix plot for a set of Bjorklund’s algorithm sequences:

~~~spl svg=A
let m = [
	2: [3 5],
	3: [4 5 8],
	4: [7 9 12 15],
	5: [6 7 8 9 11 12 13 16],
	6: [7 13],
	7: [8 9 10 12 15 16 17 18],
	8: [17 19],
	9: [14 16 22 23],
	11: [12 24],
	13: [24],
	15: [34]
];
m.keys.collect { :k |
	m[k].collect { :n |
		k.bjorklundsAlgorithm(n)
	} + 1
}.catenate.padRight.matrixPlot
~~~

![](Help/Image/bjorklundsAlgorithm-A.svg)

Corresponds to moment of symmetry scale structures.
Consider:

```
>>> 7.bjorklundsAlgorithm(12)
[1 0 1 1 0 1 0 1 1 0 1 0]
```

Rewriting as the cyclic intervals between ones gives _2 1 2 2 1 2 2_,
which is a rotation of _2 2 2 1 2 2 1_:

```
>>> 7.momentOfSymmetry(12)
[
	7 5;
	2 5 5;
	2 2 3 2 3;
	2 2 2 1 2 2 1
]

>>> ([1 0 1 1 0 1 0 1 1 0 1 0] ++ [1])
>>> .indicesOf(1)
[1 3 4 6 8 9 11 13]

>>> [1 3 4 6 8 9 11 13].differences
[2 1 2 2 1 2 2]

>>> [2 1 2 2 1 2 2].rotateRight(2)
[2 2 2 1 2 2 1]
```

The two forms have the same least rotation:

```
>>> [
>>> 	2 1 2 2 1 2 2;
>>> 	2 2 2 1 2 2 1
>>> ].collect(
>>> 	lexicographicallyLeastRotation:/1
>>> )
[
	1 2 2 1 2 2 2;
	1 2 2 1 2 2 2
]
```

The `bjorklundsAlgorithmSequence` method answers each step in the algorithm:

```
>>> 5.bjorklundsAlgorithmSequence(13)
[
	1 1 1 1 1 0 0 0 0 0 0 0 0;
	1 0 1 0 1 0 1 0 1 0 0 0 0;
	1 0 0 1 0 0 1 0 0 1 0 1 0;
	1 0 0 1 0 1 0 0 1 0 1 0 0
]
```

* * *

See also: bjorklundsAlgorithmDo, bresenhamLineAlgorithm, euclideanAlgorithm, lexicographicallyLeastRotation

Guides: Scale Functions

Further Reading: Bjorklund 1989, Demaine 2005

Categories: Algorithm, Math
