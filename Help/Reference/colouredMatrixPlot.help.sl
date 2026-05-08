# colouredMatrixPlot

- _colouredMatrixPlot(m)_

Answer a plot that gives a colourful visual representation of the elements in the matrix _m_.

Plot a solution to Scott’s 8×8 pentomino problem (Scott 1958):

~~~spl svg=A
[
	3 3 2  4  4  4  4  4;
	3 2 2  2  5  5  5  6;
	3 3 2  5  5  6  6  6;
	7 7 8  0  0 13 13  6;
	7 7 8  0  0 11 13 13;
	9 7 8 11 11 11 12 13;
	9 8 8 11 10 12 12 12;
	9 9 9 10 10 10 10 12
].colouredMatrixPlot
~~~

![](Help/Image/colouredMatrixPlot-A.svg)

Plot one of 2,339 solutions to the 6×10 pentomino problem (Haselgrove 1960):

~~~spl svg=B
let [a, b, c] = [10, 11, 12];
[
	1 2 2 3 3 3 3 4 4 4;
	1 2 2 5 3 6 6 6 6 4;
	1 2 5 5 5 7 8 8 6 4;
	1 9 a 5 7 7 7 8 b b;
	1 9 a a c c 7 8 8 b;
	9 9 9 a a c c c b b
].colouredMatrixPlot
~~~

![](Help/Image/colouredMatrixPlot-B.svg)

Plot one of two solutions to the 3×20 pentomino problem:

~~~spl svg=C
let [a, b] = [10, 11];
[
	0 0 1 2 2 2 3 3 3 3 4 5 5 5 6 6 7 8 8 8;
	0 1 1 1 2 2 3 9 9 4 4 4 5 6 6 a 7 7 7 8;
	0 0 1 b b b b b 9 9 9 4 5 6 a a a a 7 8
].colouredMatrixPlot
~~~

![](Help/Image/colouredMatrixPlot-C.svg)

* * *

See also: arrayPlot, ColourGrid, matrixPlot

Guides: Plotting Functions
