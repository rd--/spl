# drawdownMatrix

- _drawdownMatrix(m₁, m₂, m₃)_
- _drawdownMatrix(i₁, m, i₂)_

Answer the _drawdown_ weaving matrix given
_m₁_ is the _threading_ matrix (_Th_),
_m2_ is the _tieup_ matrix  (_Tu_) and
_m3_ is the _treadling_ matrix (_Tr_).
The answer matrix is given by _m₃×m₂ᵀ×m₁_.

The threading and treadling matrices may be specified as integer sequences,
in which case the matrices are derived using `integerSequenceMatrix`,
the threading matrix with _k='RowReverse'_,
the treadling matrix with _k='Column'_.
The _reverse_ for the threading matrix indicates that the rows are numbered from the last to the first,
aligning the one row of the threading matrix with the one column of the treadling matrix where they meet at the tieup matrix.

A 2×2 twill pattern:

~~~spl svg=A
let i1 = [1 2 3 4].repeat(4);
let m = [
	0 0 1 1;
	0 1 1 0;
	1 1 0 0;
	1 0 0 1
];
let i2 = i1;
drawdownMatrix(i1, m, i2)
.matrixPlot
~~~

![](sw/spl/Help/Image/drawdownMatrix-A.svg)

A diamond pattern:

~~~spl svg=B
let i1 = [
	4 3 2 1 2 3 4 1 2 3 4
	3 2 1 4 3 2 1 4 3 2 1
];
let m = [
	0 0 1 1;
	0 1 1 0;
	1 1 0 0;
	1 0 0 1
];
let i2 = i1.reverse;
drawdownMatrix(i1, m, i2)
.matrixPlot
~~~

![](sw/spl/Help/Image/drawdownMatrix-B.svg)

A plain weave:

~~~spl svg=C
let i1 = [1 2].repeat(8);
let m = [0 1; 1 0];
let i2 = i1;
drawdownMatrix(i1, m, i1)
.matrixPlot
~~~

![](sw/spl/Help/Image/drawdownMatrix-C.svg)

A more intricate diamond pattern:

~~~spl png=D
let i1 = [
	1 2 3 4 5 6 7 8 7 6
	5 4 3 2 3 4 5 6 7 6
	5 4 3 2 1 2 3 4 5 6
	5 4 3 2 1 2 3 4 5 6
	7 6 5 4 3 2 3 4 5 6
	7 8 7 6 5 4 3 2
];
let m = [
	1 1 1 0 0 0 1 0;
	0 1 1 1 0 0 0 1;
	1 0 1 1 1 0 0 0;
	0 1 0 1 1 1 0 0;
	0 0 1 0 1 1 1 0;
	0 0 0 1 0 1 1 1;
	1 0 0 0 1 0 1 1;
	1 1 0 0 0 1 0 1
];
let i2 = [
	1 2 3 4 5 6 7 8 7 6
	5 4 3 2 3 4 5 6 7 6
	5 4 3 2 1 2 3 4 5 6
	5 4 3 2 1 2 3 4 5 6
	7 6 5 4 3 2 3 4 5 6
	7 8 7 6 5 4 3 2
];
drawdownMatrix(i1, m, i1)
.Bitmap(3)
~~~

![](sw/spl/Help/Image/drawdownMatrix-D.png)

* * *

See also: Bitmap, integerSequenceMatrix, matrixPlot

Guides: Matrix Functions

Further Reading: Fujita 1962
