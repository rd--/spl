# radialAxisPlot

- _radialAxisPlot(d)_

Answer a radial axis plot where the data points are displayed on radial axes equally spaced around the origin,
also known as a radar plot.

Plot multidimensional data,
a 6-vector:

~~~spl svg=A
[
	9 7 9 5 5 7
].radialAxisPlot
~~~

![](Help/Image/radialAxisPlot-A.svg)

Plot multiple datasets,
here specified in a 3×6 matrix:

~~~spl svg=B
[
	9 7 9 5 5 7;
	6 2 3 8 8 7;
	6 8 3 4 1 9
].radialAxisPlot
~~~

![](Help/Image/radialAxisPlot-B.svg)

Visualize multidimensional data by placing each dimension on an axis with a shared origin,
a 6-vector:

~~~spl svg=C
[9 13 5 7 3 11].radialAxisPlot
~~~

![](Help/Image/radialAxisPlot-C.svg)

Shows every axis in the same range,
an 8-vector:

~~~spl svg=D
[1 5 10 15 20 25 50 100]
.radialAxisPlot
~~~

![](Help/Image/radialAxisPlot-D.svg)

Plot multiple datasets,
a 4×6 matrix:

~~~spl svg=E
[
	9 13  5  7  3 11;
	5  9  8 13 10  9;
	6  7  4 13  3  6;
	3 13  2 12  6 11
].radialAxisPlot
~~~

![](Help/Image/radialAxisPlot-E.svg)

Plot multidimensional points on multiple radial axes,
a 3×5 matrix:

~~~spl svg=F
[
	1 1 1 1 1;
	1 2 3 4 5;
	5 5 5 5 5
].radialAxisPlot
~~~

![](Help/Image/radialAxisPlot-F.svg)

Display a single point using multiple axes:

~~~spl svg=G
[1 2 3].radialAxisPlot
~~~

![](Help/Image/radialAxisPlot-G.svg)

Plot multidimensional points on multiple radial axes,
a 3×5 matrix:

~~~spl svg=H
[
	1 3 2 4 5;
	2 4 6 2 3;
	3 1 2 1 4
].radialAxisPlot
~~~

![](Help/Image/radialAxisPlot-H.svg)

A non-intersecting data-set from _ST|10-1, 080262_
(Xenakis 1989, p.139):

~~~spl svg=I
[
	5   5 10  5 15  9 16;
	15 30 20 20 20 22 34;
	25 38 25 35 25 25 36;
	55 47 40 50 43 45 62;
	75 55 50 65 48 50 65;
	80 68 60 75 65 70 76;
	90 90 80 90 82 89 88
].radialAxisPlot
~~~

![](Help/Image/radialAxisPlot-I.svg)

A plot of a 2×6 matrix indicating expected and actual values:

~~~spl svg=J
[
	50 45 20 20 25 20;
	45 20 60 25 35 15
].radialAxisPlot
~~~

![](Help/Image/radialAxisPlot-J.svg)

* * *

See also: linePlot, parallelAxisPlot, polarPlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RadialAxisPlot.html),
_W_
[1](https://en.wikipedia.org/wiki/Radar_chart)
