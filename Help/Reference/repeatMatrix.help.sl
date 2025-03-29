# repeatMatrix

- _repeatMatrix(m, d)_

Repeat copies of _m_ according to a list of repeat counts _r_.

Create a 3×2 matrix whose elements contain the value `one`:

```
>>> [[1]].repeatMatrix([3 2])
[
	1 1;
	1 1;
	1 1
]
```

Repeat copies of a matrix into a 2×2 block arrangement:

```
>>> [1 2 3].diagonalMatrix
>>> .repeatMatrix([2 2])
[
	1 0 0 1 0 0;
	0 2 0 0 2 0;
	0 0 3 0 0 3;
	1 0 0 1 0 0;
	0 2 0 0 2 0;
	0 0 3 0 0 3
]
```

Repeat copies of a matrix into a 2×3 block arrangement:

```
>>> [1 2 3].diagonalMatrix
>>> .repeatMatrix([2 3])
[
	1 0 0 1 0 0 1 0 0;
	0 2 0 0 2 0 0 2 0;
	0 0 3 0 0 3 0 0 3;
	1 0 0 1 0 0 1 0 0;
	0 2 0 0 2 0 0 2 0;
	0 0 3 0 0 3 0 0 3
]
```

Repeat copies of a matrix into a 2×3×2 block arrangement:

```
>>> [[1 2; 3 4]].repeatMatrix([2 2 3])
[
	1 2 1 2 1 2;
	3 4 3 4 3 4;
	1 2 1 2 1 2;
	3 4 3 4 3 4
	:;
	1 2 1 2 1 2;
	3 4 3 4 3 4;
	1 2 1 2 1 2;
	3 4 3 4 3 4
]
```

Vertically stack a row vector four times:

```
>>> [1:4].repeatMatrix([4 1])
[
	1 2 3 4;
	1 2 3 4;
	1 2 3 4;
	1 2 3 4
]
```

Horizontally stack a column vector four times.

```
>>> [1; 2; 3].repeatMatrix([1 4])
[
	1 1 1 1;
	2 2 2 2;
	3 3 3 3
]
```

* * *

See also: join

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/repmat.html)
