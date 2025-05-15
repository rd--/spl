# asGreyscaleSvg

- _asGreyscaleSvg(m)_

Answer a greyscale Svg image representing the matrix _m_.

A 3×3 matrix:

~~~spl svg=A
[
	1 2 1;
	3 0 1;
	0 0 -1
].asGreyscaleSvg
~~~

![](sw/spl/Help/Image/asGreyscaleSvg-A.svg)

A 5×9 matrix:

~~~spl svg=B
[5 9].iota.asGreyscaleSvg
~~~

![](sw/spl/Help/Image/asGreyscaleSvg-B.svg)

* * *

See also: asColourSvg, matrixPlot

Guides: Colour Functions

Categories: Graphics
