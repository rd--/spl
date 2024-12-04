# linePlot

- _linePlot(c)_

Plot data from a collection _c_.

Plots are adjusted to have an aspect ratio of 1.618:1,
if the ratio of the input data is not close to `one`.

If _c_ is a vector, plot as list of _y_ values.
Plot a six-vector:

~~~spl svg=A
[1 1 2 3 5 8].linePlot
~~~

![](sw/spl/Help/Image/linePlot-A.svg)

If _c_ is a matrix of one column, plot as list of _y_ values.
Plot a 5×1 matrix:

~~~spl svg=B
[1; 3; 2; 5; 4].linePlot
~~~

![](sw/spl/Help/Image/linePlot-B.svg)

If _c_ is a matrix of two columns, plot a list of _x,y_ pairs.
Plot a 5×2 matrix:

~~~spl svg=C
let n = 5;
(0, 3 .. 3 * n).collect { :k |
	[
		(k * 2.pi / n).cos,
		(k * 2.pi / n).sin
	]
}.linePlot
~~~

![](sw/spl/Help/Image/linePlot-C.svg)

If _c_ is a matrix of three columns, plot a list of _x,y,z_ triples.
Plot an 8×3 matrix:

~~~spl svg=D
[
	0 0 0;
	0 0 1;
	1 0 1;
	1 1 1;
	1 1 2;
	1 2 2;
	2 2 2;
	2 2 3
].linePlot
~~~

![](sw/spl/Help/Image/linePlot-D.svg)

Plot the prime counting sequence:

~~~spl svg=E
1:50.collect(primePi:/1).linePlot
~~~

![](sw/spl/Help/Image/linePlot-E.svg)

C.f. `functionPlot`:

~~~spl svg=F
1:50.functionPlot(primePi:/1)
~~~

![](sw/spl/Help/Image/linePlot-F.svg)

Plot a trigonometric function:

~~~spl svg=G
(-6 -- 6).subdivide(100).collect { :x |
	1 / (4 * x.cos + 5)
}.linePlot
~~~

![](sw/spl/Help/Image/linePlot-G.svg)

C.f. `functionPlot`:

~~~spl svg=H
(-6 -- 6).functionPlot { :x |
	1 / (4 * x.cos + 5)
}
~~~

![](sw/spl/Help/Image/linePlot-H.svg)

* * *

See also: discretePlot, functionPlot, matrixPlot, parametricPlot, scatterPlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListLinePlot.html)

Categories: Plotting
