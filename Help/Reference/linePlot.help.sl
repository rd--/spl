# linePlot

- _linePlot([y₁ y₂ …])_
- _linePlot([x₁ y₁; x₂ y₂; …])_
- _linePlot([x₁ y₁ z₁; x₂ y₂ z₂; …])_
- _linePlot([x₁ x₂ …] → [y₁ y₂ …])_

Plot data from a collection _c_.

If the ratio of the input data is not close to `one`,
plots are adjusted to have an aspect ratio of _1.618:1_.

If _c_ is a vector,
plot as a list of _y_ values.
Plot a six-vector:

~~~spl svg=A
[1 1 2 3 5 8].linePlot
~~~

![](sw/spl/Help/Image/linePlot-A.svg)

If _c_ is a matrix of one column,
plot as a list of _y_ values.
Plot a 5×1 matrix:

~~~spl svg=B
[1; 3; 2; 5; 4].linePlot
~~~

![](sw/spl/Help/Image/linePlot-B.svg)

If _c_ is a matrix of two columns,
plot as a list of _(x, y)_ pairs.
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

If _c_ is a matrix of three columns,
plot as a list of _(x, y, z)_ triples.
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

Plot a random walk in one dimension:

~~~spl svg=I
Sfc32(31804)
.randomReal([-1 1], 99)
.accumulate
.linePlot
~~~

![](sw/spl/Help/Image/linePlot-I.svg)

Plot a random walk in two dimensions:

~~~spl svg=J
Sfc32(41975)
.randomReal([-1 1], [99 2])
.accumulate
.linePlot
~~~

![](sw/spl/Help/Image/linePlot-J.svg)

Plot a random walk on a lattice:

~~~spl svg=K
let r = Sfc32(80415);
[1 0; -1 0; 0 1; 0 -1].randomChoice(r, 99)
.accumulate
.linePlot
~~~

![](sw/spl/Help/Image/linePlot-K.svg)

If _c_ is an _n×m×2_ array,
plot as a set of _(x, y)_ lines.
Plot two lines:

~~~spl svg=L
[
	0 0; 1 2; 2 0:;
	0 1; 1 0; 2 1
].linePlot
~~~

![](sw/spl/Help/Image/linePlot-L.svg)

If _c_ is a `List` of two column matrices,
plot as a set of _(x, y)_ lines.
Plot two lines with different numbers of points:

~~~spl svg=M
[
	0 0; 2 2; 4 0:;
	0 1; 1 0; 2 4; 3 0; 4 1
].linePlot
~~~

![](sw/spl/Help/Image/linePlot-M.svg)

If _c_ is an _n×m×1_ array,
plot as a set of _y_ values.
Plot list of column vectors:

~~~spl svg=N
[
	1; 5; 3; 7; 5; 9:;
	5; 3; 7; 5; 9; 7
].linePlot
~~~

![](sw/spl/Help/Image/linePlot-N.svg)

If _c_ is a list of vectors,
and is not a one, two or three column matrix,
plot as a set of _y_ data vectors.
Plot multiple sets of _y_ data:

~~~spl svg=O
[
	1 2 3 5  8 13 21;
	1 2 4 8 16 32 64
].linePlot
~~~

![](sw/spl/Help/Image/linePlot-O.svg)

Compare the n^(th) prime to an estimate:

~~~spl svg=P
[
	1:80.collect(prime:/1),
	1:80.collect { :n | n * n.log }
].linePlot
~~~

![](sw/spl/Help/Image/linePlot-P.svg)

Values that are not finite are elided,
and the line segmented:

~~~spl svg=Q
[3 2 9 5 NaN 4 7 6 8 1]
.linePlot
~~~

![](sw/spl/Help/Image/linePlot-Q.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, matrixPlot, parametricPlot, pointLinePlot, scatterPlot, stepPlot, surfacePlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListLinePlot.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/plot.html)
[2](https://mathworks.com/help/matlab/ref/plot3.html),
_W_
[1](https://en.wikipedia.org/wiki/Line_chart)

Categories: Plotting
