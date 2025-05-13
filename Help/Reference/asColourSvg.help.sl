# asColourSvg

- _asColourSvg(aMatrix)_

Answer a colour Svg image representing _aMatrix_.
The elements should must implement `asColour`.

A 3×3 matrix:

~~~spl svg=A
[
	0 0.6 0; 0.4 0.1 0.8; 0.7 0.9 0.7:;
	1 0 0.9; 0.6 0.6 1; 1 0.8 0.3
].asColourSvg
~~~

![](sw/spl/Help/Image/asColourSvg-A.svg)

A 5×11 matrix:

~~~spl svg=B
Sfc32(731894)
.randomReal([0 1], [5 11 3])
.asColourSvg
~~~

![](sw/spl/Help/Image/asColourSvg-B.svg)

* * *

See also: arrayPlot, asGreyscaleSvg, matrixPlot

Categories: Graphics
