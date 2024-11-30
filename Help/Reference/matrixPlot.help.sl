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

Plot a 100×100 matrix:

~~~
{ :i :j |
	[
		(i = j) -> 2,
		((i = (j + 1)) || (i = (j - 1))) -> -1,
		true -> 0
	].which
}.table(1:100, 1:100).inverse.matrixPlot
~~~

Plot the imaginary parts of a discrete Fourier transform 33×33 matrix:

~~~
{ :i :j |
	(2.pi.i * i * j / 32).exp.imaginary
}.table(0:32, 0:32).matrixPlot
~~~

Plot a table of values of five sine waves in random directions:

~~~
let r = Sfc32(31684).randomReal(0, 10, [5 2]);
let i = (0, 0.05 .. 5);
{ :x :y |
	r.collect { :each | each.dot([x, y]).sin }.sum
}.table(i, i).matrixPlot
~~~

Plot the `sin` function at integer points:

~~~
{ :x :y |
	(x * y / 100).sin
}.table(-50:50, -50:50).matrixPlot
~~~

* * *

See also: discretePlot, functionPlot, linePlot, scatterPlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MatrixPlot.html)

Further Reading: Moreland 2009
