# join

- _join(aList, anInteger)_

Joins the objects at level _anInteger_ in each of the `List` items at _aList_.

Join a matrix into a vector:

```
>>> [1 2 3; 4 5 6; 7 8 9].join(1)
[1 2 3 4 5 6 7 8 9]
```

Join two matrices to make longer columns:

```
>>> [1 2; 3 4:; 5 6; 7 8].join(1)
[
	1 2;
	3 4;
	5 6;
	7 8
]
```

Join columns of two matrices to make longer rows:

```
>>> [1 2; 3 4:; 5 6; 7 8].join(2)
[
	1 2 5 6;
	3 4 7 8
]
```

With ragged arrays, successive elements are effectively concatenated:

```
>>> [1; 5 6:; 2 3; 7:; 4; 8].join(2)
[
	1 2 3 4;
	5 6 7 8
]
```

The second row comes from the concatenation of nothing with _3, 4_:

```
>>> [0; :; 1 2; 3 4].join(2)
[0 1 2; 3 4]
```

Join depth three arrays at different levels:

```
>>> let a = [2 2 2].iota;
>>> let b = a.negated;
>>> (
>>> 	[a b].join(1),
>>> 	[a b].join(2),
>>> 	[a b].join(3)
>>> )
(
	[
		1 2; 3 4:;
		5 6; 7 8:;
		-1 -2; -3 -4:;
		-5 -6; -7 -8
	],
	[
		1 2; 3 4; -1 -2; -3 -4:;
		5 6; 7 8; -5 -6; -7 -8
	],
	[
		1 2 -1 -2; 3 4 -3 -4:;
		5 6 -5 -6; 7 8 -7 -8
	]
)
```

Augment a matrix by adding a row:

```
>>> [3.identityMatrix, [[1 2 3]]].join(1)
[
	1 0 0;
	0 1 0;
	0 0 1;
	1 2 3
]
```

Augment by a column:

```
>>> [3.identityMatrix, [1; 2; 3]].join(2)
[
	1 0 0 1;
	0 1 0 2;
	0 0 1 3
]
```

Make a block matrix:

```
>>> let a = [3 3].iota;
>>> [
>>> 	[a, a + 3].join(2),
>>> 	[a + 9, a + 12].join(2)
>>> ].join(1)
[
	 1  2  3  4  5  6;
	 4  5  6  7  8  9;
	 7  8  9 10 11 12;
	10 11 12 13 14 15;
	13 14 15 16 17 18;
	16 17 18 19 20 21
]
```

Successively double a list by joining to itself:

```
>>> { :x | [x x].join(1) }.nestList([0], 4)
[
	0;
	0 0;
	0 0 0 0;
	0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
]
```

The Thue–Morse sequence:

```
>>> { :x |
>>> 	[x, 1- x].join(1)
>>> }.nestList([1], 5)
[
	1;
	1 0;
	1 0 0 1;
	1 0 0 1 0 1 1 0;
	1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1;
	1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1
	0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0
]
```

At the empty list:

```
>>> [].join(1)
[]

>>> { [].join(2) }.ifError { true }
true
```

* * *

See also: ++, +++, arrayFlatten, catenate, flatten, intercalate, splitBy, stringCatenate, stringJoin

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Join.html)

Categories: String
