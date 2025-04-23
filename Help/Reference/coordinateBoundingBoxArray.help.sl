# coordinateBoundingBoxArray

- _coordinateBoundingBoxArray(bounds, steps)_

A lattice of two-dimensional points with unit steps:

```
>>> [3 -1; 8 2]
>>> .coordinateBoundingBoxArray(
>>> 	[1 1]
>>> )
[
	3 -1; 3 0; 3 1; 3 2:;
	4 -1; 4 0; 4 1; 4 2:;
	5 -1; 5 0; 5 1; 5 2:;
	6 -1; 6 0; 6 1; 6 2:;
	7 -1; 7 0; 7 1; 7 2:;
	8 -1; 8 0; 8 1; 8 2
]
```

An array of three-dimensional points with given discretization steps:

```
>>> [3 -1 0; 6 2 1.pi]
>>> .coordinateBoundingBoxArray(
>>> 	[0.7 1.5 0.5.pi]
>>> )
[
	[
		3 -1 0;
		3 -1 1.5708;
		3 -1 3.14159
		:;
		3 0.5 0;
		3 0.5 1.5708;
		3 0.5 3.14159
		:;
		3 2 0;
		3 2 1.5708;
		3 2 3.14159
	],
	[
		3.7 -1 0;
		3.7 -1 1.5708;
		3.7 -1 3.14159
		:;
		3.7 0.5 0;
		3.7 0.5 1.5708;
		3.7 0.5 3.14159
		:;
		3.7 2 0;
		3.7 2 1.5708;
		3.7 2 3.14159
	],
	[
		4.4 -1 0;
		4.4 -1 1.5708;
		4.4 -1 3.14159
		:;
		4.4 0.5 0;
		4.4 0.5 1.5708;
		4.4 0.5 3.14159
		:;
		4.4 2 0;
		4.4 2 1.5708;
		4.4 2 3.14159
	],
	[
		5.1 -1 0;
		5.1 -1 1.5708;
		5.1 -1 3.14159
		:;
		5.1 0.5 0;
		5.1 0.5 1.5708;
		5.1 0.5 3.14159
		:;
		5.1 2 0;
		5.1 2 1.5708;
		5.1 2 3.14159
	],
	[
		5.8 -1 0;
		5.8 -1 1.5708;
		5.8 -1 3.14159
		:;
		5.8 0.5 0;
		5.8 0.5 1.5708;
		5.8 0.5 3.14159
		:;
		5.8 2 0;
		5.8 2 1.5708;
		5.8 2 3.14159
	]
]
```

* * *

See also: coordinateBoundsArray

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CoordinateBoundingBoxArray.html)
