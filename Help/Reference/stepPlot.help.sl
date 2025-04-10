# stepPlot

- _stepPlot(aList)_

Plot values in steps.

At integer vector:

~~~spl svg=A
[1 1 2 3 5 8 13 21].stepPlot
~~~

![](sw/spl/Help/Image/stepPlot-A.svg)

At matrix, specifying _x_ and _y_ coordinates:

~~~spl svg=B
1:50.collect { :n |
	[n.nthPrime, n.eulerPhi]
}.stepPlot
~~~

![](sw/spl/Help/Image/stepPlot-B.svg)

Plot boolean signal:

~~~spl svg=C
let r = Sfc32(12783);
[0 1]
.randomChoice(r, [23])
.stepPlot
~~~

![](sw/spl/Help/Image/stepPlot-C.svg)

At heterogenous vector,
with `Fraction` entries:

~~~spl svg=D
[0 1 1/2 2/3 3/2 5/4 8/7].stepPlot
~~~

![](sw/spl/Help/Image/stepPlot-D.svg)

At list of vectors:

~~~spl svg=E
[
	5  7 13 21;
	1  3  5
].stepPlot
~~~

![](sw/spl/Help/Image/stepPlot-E.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, linePlot, matrixPlot, parametricPlot, scatterPlot, surfacePlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListLinePlot.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/plot.html)

Categories: Plotting
