# arrayPlot

- _arrayPlot(a)_

Answer a plot that gives a visual representation of the elements in the array _a_.

A 3×3×3 matrix:

~~~spl svg=A
[
	0 0.6 0; 0.4 0.1 0.8; 0.7 0.9 0.7:;
	1 0 0.9; 0.6 0.6 1; 1 0.8 0.3
].arrayPlot
~~~

![](sw/spl/Help/Image/arrayPlot-A.svg)

A 5×7×3 matrix:

~~~spl svg=B
Sfc32(821343)
.randomReal([0.15 1], [5 7 3])
.arrayPlot
~~~

![](sw/spl/Help/Image/arrayPlot-B.svg)

Plot a 1×6×3 colour map:

~~~spl svg=C
(0, 0.2 .. 1).collect { :h |
	[h 0.6 0.9].hsvToRgb
}.enclose.arrayPlot
~~~

![](sw/spl/Help/Image/arrayPlot-C.svg)

Interpolate between a list of _Rgb_ triples,
plotting a 12×36×3 matrix:

~~~spl svg=D
let c = [
	1 0 0;
	1 0.65 0;
	1 1 0;
	0 1 0;
	0 0 1;
	0.25 0 1;
	0.5 0 1
];
let g = (1 -- c.size).discretize(36).collect(
	c.listInterpolation(
		linearInterpolation:/3
	)
);
(0.4 -- 1).discretize(12).collect { :each |
	each * g
}.arrayPlot
~~~

![](sw/spl/Help/Image/arrayPlot-D.svg)

* * *

See also: asColourDrawing, Bitmap, discretePlot, functionPlot, graphPlot, Greymap, Image, linePlot, matrixPlot, parametricPlot, scatterPlot, surfacePlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayPlot.html)

Categories: Plotting
