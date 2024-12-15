# stepPlot

- _stepPlot(aList)_

Plot values in steps.

At vector:

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
let rng = Sfc32(12783);
[0 1].atRandom([23], rng).stepPlot
~~~

![](sw/spl/Help/Image/stepPlot-C.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, linePlot, matrixPlot, parametricPlot, scatterPlot, surfacePlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListLinePlot.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/plot.html)

Categories: Plotting
