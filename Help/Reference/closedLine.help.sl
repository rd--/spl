# closedLine

- _closedLine(aMatrix)_

Answer a `Line` where the last point at _aMatrix_ is connected to the first.

Draw a diamond:

~~~spl svg=A
[0 0; 1 1; 2 0; 1 -1]
.closedLine
.asLineDrawing
~~~

![](sw/spl/Help/Image/closedLine-A.svg)

Compare to `Line` at the same matrix,
which is not closed:

~~~spl svg=B
[0 0; 1 1; 2 0; 1 -1]
.Line
.asLineDrawing
~~~

![](sw/spl/Help/Image/closedLine-B.svg)

* * *

See also: asLineDrawing, Line
