# matrixPlot

- _matrixPlot(m)_

Answer a plot that gives a visual representation of the elements in a matrix.

Plot a 3×3 matrix:

~~~
[
	1 2 1;
	3 0 1;
	0 0 -1
].matrixPlot
~~~

![](sw/spl/Help/Image/matrixPlot-A.svg)

Plot a 10×10 matrix (see also _n = 100_):

~~~
let n = 10;
{ :i :j |
	[
		(i = j) -> 2,
		(
			(i = (j + 1))
			||
			(i = (j - 1))
		) -> -1,
		true -> 0
	].which
}.table(1:n, 1:n).inverse.matrixPlot
~~~

![](sw/spl/Help/Image/matrixPlot-B.svg)

Plot the imaginary parts of a discrete Fourier transform 24×24 matrix (see also _n = 33_):

~~~
let n = 24;
{ :i :j |
	(2.pi.i * i * j / n).exp.imaginary
}.table(0:n, 0:n).matrixPlot
~~~

![](sw/spl/Help/Image/matrixPlot-C.svg)

Plot a table of values of five sine waves in random directions (see also _k = 100_):

~~~
let r = Sfc32(31684);
let n = r.randomReal(0, 10, [5 2]);
let k = 35;
let i = (0 -- 5).subdivide(k);
{ :x :y |
	n.collect { :each |
		each.dot([x, y]).sin
	}.sum
}.table(i, i).matrixPlot
~~~

![](sw/spl/Help/Image/matrixPlot-D.svg)

Plot the `sin` function at integer points:

~~~
let i = -20:20;
{ :x :y |
	(x * y / 50).sin
}.table(i, i).matrixPlot
~~~

![](sw/spl/Help/Image/matrixPlot-E.svg)

Plot a random 50×10 matrix:

~~~
Sfc32(17492)
.randomReal(0, 1, [50 10])
.matrixPlot
~~~

![](sw/spl/Help/Image/matrixPlot-F.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, linePlot, parametricPlot, scatterPlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MatrixPlot.html)

Further Reading: Moreland 2009
