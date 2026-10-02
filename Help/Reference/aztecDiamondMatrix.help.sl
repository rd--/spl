# aztecDiamondMatrix

- _aztecDiamondMatrix(n)_

An Aztec diamond of order _n_ consists of all squares of a square lattice whose centers _x,y_ satisfy _|x|+|y|≤n_.

The first few Aztec diamond matrices:

```
>>> 1.aztecDiamondMatrix
[
	1 1;
	1 1
]

>>> 2.aztecDiamondMatrix
[
	0 1 1 0;
	1 1 1 1;
	1 1 1 1;
	0 1 1 0
]

>>> 3.aztecDiamondMatrix
[
	0 0 1 1 0 0;
	0 1 1 1 1 0;
	1 1 1 1 1 1;
	1 1 1 1 1 1;
	0 1 1 1 1 0;
	0 0 1 1 0 0
]

>>> 4.aztecDiamondMatrix
[
	0 0 0 1 1 0 0 0;
	0 0 1 1 1 1 0 0;
	0 1 1 1 1 1 1 0;
	1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1;
	0 1 1 1 1 1 1 0;
	0 0 1 1 1 1 0 0;
	0 0 0 1 1 0 0 0
]

>>> 5.aztecDiamondMatrix
[
	0 0 0 0 1 1 0 0 0 0;
	0 0 0 1 1 1 1 0 0 0;
	0 0 1 1 1 1 1 1 0 0;
	0 1 1 1 1 1 1 1 1 0;
	1 1 1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1 1;
	0 1 1 1 1 1 1 1 1 0;
	0 0 1 1 1 1 1 1 0 0;
	0 0 0 1 1 1 1 0 0 0;
	0 0 0 0 1 1 0 0 0 0
]
```

Order five Aztec diamond matrix:

~~~spl svg=A
5.aztecDiamondMatrix.matrixPlot
~~~

![](Help/Image/aztecDiamondMatrix-A.svg)

* * *

See also: boxMatrix, crossMatrix, diamondMatrix, diskMatrix, manhattanDistance

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AztecDiamond.html),
_W_
[1](https://en.wikipedia.org/wiki/Aztec_diamond)

Categories: Math, Matrix
