# arrayPad

- _arrayPad(a, [m₁ n₁; …], o)_

Pad _a_,
which may be a vector or a matrix,
with _m_ elements at the beginning and _n_ elements at the end.

Pad the edges of a list with zeros:

```
>>> [1 2 3].arrayPad([1 1], 0)
[0 1 2 3 0]
```

Pad the edges of a matrix:

```
>>> [1 2; 3 4].arrayPad([2 2; 2 2], 0)
[
	0 0 0 0 0 0;
	0 0 0 0 0 0;
	0 0 1 2 0 0;
	0 0 3 4 0 0;
	0 0 0 0 0 0;
	0 0 0 0 0 0
]
```

Specify different amounts of padding on each side:

```
>>> [1 2 3].arrayPad([2 4], 0)
[0 0 1 2 3 0 0 0 0]
```

Pad by 5 elements on each row and 1 element on each column:

```
>>> [1 2; 3 4].arrayPad([1 1; 5 5], 0)
[
	0 0 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 1 2 0 0 0 0 0;
	0 0 0 0 0 3 4 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 0 0
]
```

Pad only on the right:

```
>>> [1 2 3].arrayPad([0 2], 0)
[1 2 3 0 0]
```

Remove elements from each edge of an array:

```
>>> [1 .. 10].arrayPad([-2 -2], 0)
[3 .. 8]
```

Pad with extra rows:

```
>>> [1 2; 3 4].arrayPad([1 1; 0 0], 0)
[
	0 0;
	1 2;
	3 4;
	0 0
]
```

Pad with extra columns:

```
>>> [1 2; 3 4].arrayPad([0 0; 1 1], 0)
[
	0 1 2 0;
	0 3 4 0
]
```

Specify different amounts of padding for each edge:

```
>>> [1 2; 3 4].arrayPad([-1 2; 1 3], 0)
[
	0 3 4 0 0 0;
	0 0 0 0 0 0;
	0 0 0 0 0 0
]
```

* * *

See also: padLeft, padRight

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayPad.html),
_Mathworks_
[1](https://au.mathworks.com/help/images/ref/padarray.html)
