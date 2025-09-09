# pathPlot

- _pathPlot([[x₁ y₁; x₂ y₂…])_

Plot path data from a collection _c_.
The plot is an animated drawing where a point follows the indicated path.

If no time points are specified, each segment is assigned a duration of one second:

~~~spl svg=A
[0 0; 1 1; 5 1; 5 5; 1 1; 1 0; 0 0]
.pathPlot
~~~

![](sw/spl/Help/Image/pathPlot-A.svg)

Line drawing of same path data:

~~~spl svg=B
[0 0; 1 1; 5 1; 5 5; 1 1; 1 0; 0 0]
.linePlot
~~~

![](sw/spl/Help/Image/pathPlot-B.svg)

* * *

See also: linePlot, scatterPlot

Guides: Plotting Functions
