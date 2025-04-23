# tuplesArray

- _tuplesArray(s)_

Answer the `tuples` of the sequence _s_,
arranged as an array.

`tuplesArray` of a 2×2 matrix is a 2×2×2 array:

```
>>> [1 2; 3 4].tuplesArray
[
	1 3; 1 4:;
	2 3; 2 4
]

>>> [3 4; 1 2].tuplesArray
[
	3 1; 3 2:;
	4 1; 4 2
]
```

`tuplesArray` of a two-vector and a three-vector is a 2×3×2 array:

```
>>> [1 2; 7 8 9].tuplesArray
[
	1 7; 1 8; 1 9:;
	2 7; 2 8; 2 9
]
```

`tuplesArray` of a three-vector and a four-vector is a 3×4×2 array:

```
>>> [0:2, 0:3].tuplesArray
[
	0 0; 0 1; 0 2; 0 3:;
	1 0; 1 1; 1 2; 1 3:;
	2 0; 2 1; 2 2; 2 3
]
```

`tuplesArray` of a two-vector, a three-vector, and a two-vector is a 2×3×2×3 array:

```
>>> [
>>> 	'a' 'b';
>>> 	'x' 'y' 'z';
>>> 	'u' 'v'
>>> ].tuplesArray
[
	[
		'a' 'x' 'u'; 'a' 'x' 'v':;
		'a' 'y' 'u'; 'a' 'y' 'v':;
		'a' 'z' 'u'; 'a' 'z' 'v'
	],
	[
		'b' 'x' 'u'; 'b' 'x' 'v':;
		'b' 'y' 'u'; 'b' 'y' 'v':;
		'b' 'z' 'u'; 'b' 'z' 'v'
	]
]
```

* * *

See also: reshape, tuples

Categories: Combinatorics, Enumerating, Math
