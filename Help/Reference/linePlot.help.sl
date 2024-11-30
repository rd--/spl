# linePlot

- _linePlot(c)_

Plot data from a collection _c_.

If _c_ is a vector, plot as list of _y_ values.
Plot a six-vector:

~~~
[1 1 2 3 5 8].linePlot
~~~

If _c_ is a matrix of one column, plot as list of _y_ values.
Plot a 5×1 matrix:

~~~
[1; 3; 2; 5; 4].linePlot
~~~

If _c_ is a matrix of two columns, plot a list of _x,y_ pairs.
Plot an 8×2 matrix:

~~~
(0, 3 .. 21).collect { :k |
	[
		(k * 2.pi / 7).cos,
		(k * 2.pi / 7).sin
	]
}.linePlot
~~~

If _c_ is a matrix of three columns, plot a list of _x,y,z_ triples.
Plot a 6×3 matrix:

~~~
[
	0 0 0;
	1 0 1;
	1 1 2;
	2 2 2;
	2 4 3;
	3 6 4
].linePlot
~~~

Plot the prime counting sequence:

~~~
1:50.collect(primePi:/1).linePlot
~~~

C.f. `functionPlot`:

~~~
1:50.functionPlot(primePi:/1)
~~~

Plot a trigonometric function:

~~~
(-6 -- 6).subdivide(500).collect { :x |
	1 / (4 * x.cos + 5)
}.linePlot
~~~

C.f. `functionPlot`:

~~~
(-6 -- 6).functionPlot { :x |
	1 / (4 * x.cos + 5)
}
~~~

* * *

See also: discretePlot, functionPlot, matrixPlot, scatterPlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListLinePlot.html)

Categories: Plotting
