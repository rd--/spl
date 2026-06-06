# welchCostasArrayList

- _welchCostasArrayList(n)_

Answer a list of Welch-Costas arrays of size _n-1_ where _n_ is a prime number,
generated using the Welch-Gilbert algorithm.
A Costas array is a set of _m_ dots in an _m×m_ region of the square grid,
where the vector differences between pairs of distinct dots are all different,
and such that every row and column of the array contains exactly one dot.
The number of Welch–Costas arrays which exist for a given size depends on the `eulerPhi` function.
The answer is a vector giving the column index for each dot in each row.

Construct 4×4 arrays:

```
>>> (5 - 1).eulerPhi
2

>>> 5.welchCostasArrayList
[2 4 3 1; 3 4 2 1]

>>> 5.welchCostasMatrixList
[
	0 0 0 1;
	1 0 0 0;
	0 0 1 0;
	0 1 0 0
	:;
	0 0 0 1;
	0 0 1 0;
	1 0 0 0;
	0 1 0 0
]
```

Construct 6×6 arrays:

```
>>> (7 - 1).eulerPhi
2

>>> 7.welchCostasArrayList
[3 2 6 4 5 1; 5 4 6 2 3 1]

>>> 7.welchCostasMatrixList
[
	0 0 0 0 0 1;
	0 1 0 0 0 0;
	1 0 0 0 0 0;
	0 0 0 1 0 0;
	0 0 0 0 1 0;
	0 0 1 0 0 0
	:;
	0 0 0 0 0 1;
	0 0 0 1 0 0;
	0 0 0 0 1 0;
	0 1 0 0 0 0;
	1 0 0 0 0 0;
	0 0 1 0 0 0
]
```

An 88×88 array:

```
>>> 89.welchCostasArrayList
>>> .first.rotateRight
[
	 1  3  9 27 81 65 17 51 64 14
	42 37 22 66 20 60  2  6 18 54
	73 41 34 13 39 28 84 74 44 43
	40 31  4 12 36 19 57 82 68 26
	78 56 79 59 88 86 80 62  8 24
	72 38 25 75 47 52 67 23 69 29
	87 83 71 35 16 48 55 76 50 61
	 5 15 45 46 49 58 85 77 53 70
	 32 7 21 63 11 33 10 30
]
```

Plot a 12×12 array:

~~~spl svg=A
13.welchCostasSparseArrayList
.anyOne
.matrixPlot
~~~

![](Help/Image/welchCostasArrayList-A.svg)

Plot a 96×96 array:

~~~spl png=B
97.welchCostasMatrixList
.anyOne
.Bitmap
~~~

![](Help/Image/welchCostasArrayList-B.png)

Plot the first differences of the column indices of an 88×88 array:

~~~spl svg=C
89.welchCostasArrayList
.first
.rotateRight
.differences
.discretePlot
~~~

![](Help/Image/welchCostasArrayList-C.svg)

Plot the two halves of the column indices of an 88×88 array,
indicating mirror symmetry:

~~~spl svg=D
89.welchCostasArrayList
.first
.rotateRight
.partition(44, 44)
.linePlot
~~~

![](Help/Image/welchCostasArrayList-D.svg)

* * *

See also: columnBinaryMatrix, erdosTuranConstruction, optimalGolombRulers, powerMod, primitiveRootList

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CostasArray.html),
_W_
[1](https://en.wikipedia.org/wiki/Costas_array)
