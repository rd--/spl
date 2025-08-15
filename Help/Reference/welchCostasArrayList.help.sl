# welchCostasArrayList

- _welchCostasArrayList(n)_

Answer a list of Welch-Costas arrays of size _n-1_ where _n_ is a prime number,
generated using the Welch-Gilbert algorithm.
A Costas array is a set of _m_ dots in an _m×m_ region of the square grid,
where the vector differences between pairs of distinct dots are all different,
and such that every row and column of the array contains exactly one dot.
The number of Welch–Costas arrays which exist for a given size depends on the `eulerPhi` function.

Construct 4×4 arrays:

```
>>> (5 - 1).eulerPhi
2

>>> 5.welchCostasArrayList
>>> .collect(normal:/1)
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

Construct 7×7 arrays:

```
>>> (7 - 1).eulerPhi
2

>>> 7.welchCostasArrayList
>>> .collect(normal:/1)
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

Plot a 13×13 array:

~~~spl svg=A
13.welchCostasArrayList
.anyOne
.normal
.matrixPlot
~~~

![](sw/spl/Help/Image/welchCostasArrayList-A.svg)

Plot a 43×43 array:

~~~spl png=B
97.welchCostasArrayList
.anyOne
.normal
.Bitmap
~~~

![](sw/spl/Help/Image/welchCostasArrayList-B.png)

* * *

See also: erdosTuranConstruction, optimalGolombRulers, powerMod, primitiveRootList

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CostasArray.html),
_W_
[1](https://en.wikipedia.org/wiki/Costas_array)
