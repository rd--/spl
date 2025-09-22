# recycle

- _recycle(aList, shape)_

Recycle the items in _aList_ into an array with the specified `shape`.
The answer includes each item of _aList_ at the same position (`deepIndex`) it has initially.

Recycle to make a regular 3×3 matrix,
here the first row is recycled as the third row,
and that row is made by recycling a single value:

```
>>> [1; 2 3].recycle([3 3])
[
	1 1 1;
	2 3 2;
	1 1 1
]
```

Recycle to make a regular 4×3 matrix,

```
>>> [1; 2 3; 4].recycle([4 3])
[
	1 1 1;
	2 3 2;
	4 4 4;
	1 1 1
]
```

Recycle to make a regular 2×3×2 volume:

```
>>> [1; 2:; 3 4].recycle([2 3 2])
[
	1 1; 2 2; 1 1:;
	3 4; 3 4; 3 4
]
```

Recycle to make a regular 3×2 matrix,

```
>>> [1; 2 3; 4].recycle
[1 1; 2 3; 4 4]
```

Recycle to make a regular 3×3 matrix:

```
>>> [1 2 3; 4 5; 6].recycle
[
	1 2 3;
	4 5 4;
	6 6 6
]
```

Recycle to make a regular 2×2×2 volume:

```
>>> [1; 2:; 3 4].recycle
[
	1 1;
	2 2
	:;
	3 4;
	3 4
]
```

Recycle to make a regular 2×3×3 volume:

```
>>> [1; 2; 3 4:; 4; 5 6; 7 8 9].recycle
[
	1 1 1;
	2 2 2;
	3 4 3
	:;
	4 4 4;
	5 6 5;
	7 8 9
]
```

It is an `error` if there are any empty places:

```
>>> { [1; ; 3].recycle }.hasError
true
```

* * *

See also: impliedShape, padLeft, padRight, reshape, reshapeLike, shape
