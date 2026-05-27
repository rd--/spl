# pointLinePlot

- _pointLinePlot(c)_

Plot data from a collection _c_ as both points,
as in `scatterPlot`,
and lines,
as in `linePlot`.

~~~spl svg=A
[1 1 2 3 5 8].pointLinePlot
~~~

![](Help/Image/pointLinePlot-A.svg)

Nzakara harp figuration (Brennan 2007):

~~~spl svg=B
let p = [1 3; 1 4; 2 4; 2 5; 3 5];
[4 5 1 2 3].collect { :n |
	([1 2 1 2 4 5] + n).mod(5, 1)
}.catenate.collect { :n |
	p[n]
}.transpose.pointLinePlot
~~~

![](Help/Image/pointLinePlot-B.svg)

* * *

* * *

See also: linePlot, pathPlot, scatterPlot

Guides: Plotting Functions

Categories: Plotting
