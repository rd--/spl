# asColourDrawing

- _asColourDrawing(m)_

Answer a colour `LineDrawing` representing the matrix _m_.
The elements of _m_ must implement `asColour`.

A 3×3×3 array,
understood as a 3×3 or _(r,g,b)_ triples:

~~~spl svg=A
[
	0 0.6 0; 0.4 0.1 0.8; 0.7 0.9 0.7:;
	1 0 0.9; 0.6 0.6 1; 1 0.8 0.3
].asColourDrawing
~~~

![](sw/spl/Help/Image/asColourDrawing-A.svg)

A 5×11×3 array,
understood as a 5×11 matrix of _(r,g,b)_ triples:

~~~spl svg=B
Sfc32(731894)
.randomReal([0 1], [5 11 3])
.asColourDrawing
~~~

![](sw/spl/Help/Image/asColourDrawing-B.svg)

_Note_:
This is `asLineDrawing` of `ColourGrid`.

* * *

See also: arrayPlot, asGreyscaleDrawing, asLineDrawing, ColourGrid, matrixPlot

Guides: Colour Functions, Image Functions

Categories: Graphics
