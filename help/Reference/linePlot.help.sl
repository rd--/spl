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
	[(k * 2.pi / 7).cos, (k * 2.pi / 7).sin]
}.linePlot
~~~

If _c_ is a matrix of three columns, plot a list of _x,y,z_ triples.
Plot a 6×3 matrix:

~~~
[0 0 0; 1 0 1; 1 1 2; 2 2 2; 2 4 3; 3 6 4].linePlot
~~~

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListLinePlot.html)
