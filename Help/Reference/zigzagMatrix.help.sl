# zigzagMatrix

- _zigzagMatrix([m n])_

Answer a _m×n_ zigzag matrix.

The 3×3 zigzag matrix:

```
>>> [3 3].zigzagMatrix
[
	1 2 6;
	3 5 7;
	4 8 9
]
```

The 2×5 zigzag matrix:

```
>>> [2 5].zigzagMatrix
[
	1  2  5  6  9;
	3  4  7  8 10
]
```

Plot the 11×15 zigzag matrix:

~~~spl svg=A
[11 15].zigzagMatrix.matrixPlot
~~~

![](sw/spl/Help/Image/zigzagMatrix-A.svg)

* * *

See also: zigzagIndices, zigzagScan

Guides: Matrix Functions
