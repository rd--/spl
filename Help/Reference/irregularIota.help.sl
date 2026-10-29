# irregularIota

- _irregularIota(x, n=1)_

The `iota` function for irregular shapes.
The form of an irregular shape is given by `irregularShape`.

The irregular shape of an irregular array:

```
>>> [0; 1 2; ; 3:; 4 5; 6]
>>> .irregularShape
[2, [4 2], [[1 2 0], [2 1]]]
```

The deep indices of the same array:

```
>>> [0; 1 2; ; 3:; 4 5; 6]
>>> .deepIndices
[
	1 1 1;
	1 2 1; 1 2 2;
	1 4 1;
	2 1 1; 2 1 2;
	2 2 1
]
```

The irregular shape indices of the irregular shape of the same array:

```
>>> [0; 1 2; ; 3:; 4 5; 6]
>>> .irregularShape
>>> .irregularShapeIndices
[
	1 1 1;
	1 2 1; 1 2 2;
	1 4 1;
	2 1 1; 2 1 2;
	2 2 1
]
```

The irregular iota of the irregular shape of the same array:

```
>>> [0; 1 2; ; 3:; 4 5; 6]
>>> .irregularShape
>>> .irregularIota(0)
[0; 1 2; ; 3:; 4 5; 6]
```

Another irregular array:

```
>>> [0; 1 2; 3; 4 5; 6; 7 8; 9]
>>> .irregularShape
[7, [1 2]]

>>> [7, [1 2]].irregularIota(0)
[0; 1 2; 3; 4 5; 6; 7 8; 9]

>>> [7, [1 2]]
>>> .irregularShapeIndices
[
	1 1;
	2 1; 2 2;
	3 1;
	4 1; 4 2;
	5 1;
	6 1; 6 2;
	7 1
]


>>> [6, [2 1]].irregularIota(0)
[0 1; 2; 3 4; 5; 6 7; 8]
```

Regular irregular shapes:

```
>>> [2].irregularIota
[1 2]

>>> [2, [2]].irregularIota
[1 2; 3 4]

>>> [2, [2], [[2]]].irregularIota
[1 2; 3 4:; 5 6; 7 8]

>>> [2, [2], [[2]], [[[2]]]].irregularIota
[
	[
		1 2;
		3 4
		:;
		5 6;
		7 8
	],
	[
		9 10;
		11 12
		:;
		13 14;
		15 16
	]
]
```

* * *

See also: irregularShape, reshape, shape

Guides: Array Functions
