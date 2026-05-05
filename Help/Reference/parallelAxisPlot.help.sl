# parallelAxisPlot

- _parallelAxisPlot(m)_

Answer a parallel axis plot for the _y_-coordinates given by the matrix _m_,
using equally spaced axes.
This is a particular kind of parallel coordinates plot.

Plot a set of multidimensional points:

~~~spl svg=A
[
	6  2 7 3  3;
	6  5 9 8  8;
	7 10 6 2 10;
	8  1 8 3  7;
	8  7 8 6  1
].parallelAxisPlot
~~~

![](Help/Image/parallelAxisPlot-A.svg)

Visualise multidimensional data by placing each dimension on axes that are parallel to each other:

~~~spl svg=B
[
	4 5 10 7 3;
	9 8 2 2 5;
	5 3 2 7 4
].parallelAxisPlot
~~~

![](Help/Image/parallelAxisPlot-B.svg)

Visualize some common operations:

~~~spl svg=C
let n = 25;
let a = Sfc32(678321).randomReal([0 20], [n]);
let b = a.sorted;
[
	a,
	b,
	-b,
	2 * b,
	(2 * b) + 15,
	b.exp,
	1 / b
].transpose.parallelAxisPlot
~~~

![](Help/Image/parallelAxisPlot-C.svg)

In the case where the range of each column is equal the basic shape is equivalent to `linePlot`:

~~~spl svg=D
[
	1 1 1 1 1;
	1 2 3 4 5;
	5 5 5 5 5
].parallelAxisPlot
~~~

![](Help/Image/parallelAxisPlot-D.svg)

The _special diagram_ Xenakis gives to connect the orchestral composition with density is a transposed parallel coordinates plot (Xenakis 1989, p.139),
the lines do not intersect:

~~~spl svg=E
[
	5 10 10 30 20 5 10 10;
	5 25 8 9 8 13 22 10;
	10 10 5 15 10 10 20 20;
	5 15 15 15 15 10 15 10;
	15 5 5 18 5 17 17 18;
	9 13 3 20 5 20 19 11;
	16 18 2 26 3 11 12 12
].collect { :x |
	+.foldList(0, x)
}.transpose.radialAxisPlot
~~~

![](Help/Image/parallelAxisPlot-E.svg)

* * *

See also: linePlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ParallelAxisPlot.html),
_W_
[1](https://en.wikipedia.org/wiki/Parallel_coordinates)
