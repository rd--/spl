# greyscaleMatrix

- _greyscaleMatrix(m)_

Answer a matrix of greyscale `Colour` values representing the matrix _m_.

A 3×3 matrix:

~~~spl svg=A
[
	1 2 1;
	3 0 1;
	0 0 -1
].greyscaleMatrix
.ColourGrid
.LineDrawing
~~~

![](Help/Image/greyscaleMatrix-A.svg)

A 5×9 matrix:

~~~spl svg=B
[5 9].iota
.greyscaleMatrix
.ColourGrid
.LineDrawing
~~~

![](Help/Image/greyscaleMatrix-B.svg)

* * *

See also: ColourGrid, LineDrawing, colourMatrixPlot, matrixPlot

Guides: Colour Functions, Image Functions

Categories: Graphics
