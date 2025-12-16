# asGreyscaleDrawing

- _asGreyscaleDrawing(m)_

Answer a greyscale `LineDrawing` representing the matrix _m_.

A 3×3 matrix:

~~~spl svg=A
[
	1 2 1;
	3 0 1;
	0 0 -1
].asGreyscaleDrawing
~~~

![](sw/spl/Help/Image/asGreyscaleDrawing-A.svg)

A 5×9 matrix:

~~~spl svg=B
[5 9].iota.asGreyscaleDrawing
~~~

![](sw/spl/Help/Image/asGreyscaleDrawing-B.svg)

* * *

See also: asColourDrawing, matrixPlot

Guides: Colour Functions, Image Functions

Categories: Graphics
