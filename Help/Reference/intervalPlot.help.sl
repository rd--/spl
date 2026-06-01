# intervalPlot

- _intervalPlot([i₁ i₂ …])_

Plot the intervals _i_,
which may be specified either as a `List` of `Interval` objects,
or as either a two or three column matrix.
Intervals are drwn as a vertical line,
the median is indicated by a dot.

Linearly decreasing symmetrical intervals about zero:

~~~spl svg=A
let a = [1 .. 20].reverse;
Interval(0 - a, a).intervalPlot
~~~

![](Help/Image/intervalPlot-A.svg)

Linearly decreasing and then increasing symmetrical intervals about zero:

~~~spl svg=B
let a = [1 .. 10];
let b = a.reverse ++ a;
Interval(0 - b, b).intervalPlot
~~~

![](Help/Image/intervalPlot-B.svg)

Linearly increasing intervals with distinct gradients for bounds and median,
specified as a three column matrix:

~~~spl svg=C
let a = [1 .. 20];
let b = a * 1.25;
let c = a * 2;
[a b c].transpose.intervalPlot
~~~

![](Help/Image/intervalPlot-C.svg)

Geometrically decreasing increasing symmetrical intervals about zero:

~~~spl svg=D
let a = 25.geometricProgression(10, 0.9);
Interval(0 - a, a).intervalPlot
~~~

![](Help/Image/intervalPlot-D.svg)

* * *

See also: linePlot, scatterPlot

Guides: Plotting Functions
