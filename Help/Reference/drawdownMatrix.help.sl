# drawdownMatrix

- _drawdownMatrix(m₁, m₂, m₃)_

Answer the _drawdown_ weaving matrix given
_m₁_ is the _threading_ matrix (_Th_),
_m2_ is the _tieup_ matrix  (_Tu_) and
_m3_ is the _treadling_ matrix (_Tr_).
The answer matrix is given by _m₃×m₂ᵀ×m₁_.

A 2×2 twill pattern:

~~~spl svg=A
let m1 = [
	4 3 2 1 4 3 2 1
].integerSequenceMatrix('Column');
let m2 = [
	0 0 1 1;
	0 1 1 0;
	1 1 0 0;
	1 0 0 1
];
let m3 = [
	1 2 3 4 1 2 3 4
].integerSequenceMatrix('Row');
drawdownMatrix(m1, m2, m3)
.matrixPlot
~~~

![](sw/spl/Help/Image/drawdownMatrix-A.svg)

A diamond pattern:

~~~spl svg=B
let m1 = [
	1 2 3 4 3 2 1 4 3 2 1
	2 3 4 1 2 3 4 1 2 3 4
].integerSequenceMatrix('Column');
let m2 = [
	0 0 1 1;
	0 1 1 0;
	1 1 0 0;
	1 0 0 1
];
let m3 = [
	1 2 3 4 1 2 3 4 1 2 3
	4 3 2 1 4 3 2 1 2 3 4
].integerSequenceMatrix('Row');
drawdownMatrix(m1, m2, m3)
.matrixPlot
~~~

![](sw/spl/Help/Image/drawdownMatrix-B.svg)

* * *

See also: integerSequenceMatrix, matrixPlot

Guides: Matrix Functions
