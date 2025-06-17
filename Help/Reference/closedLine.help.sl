# closedLine

- _closedLine([v₁ v₂ …])_

Answer a `Line` where the last vertex in _v_ is connected to the first.

Draw a diamond:

~~~spl svg=A
[0 0; 1 1; 2 0; 1 -1].closedLine
~~~

![](sw/spl/Help/Image/closedLine-A.svg)

Compare to `Line` at the same matrix,
which is not closed:

~~~spl svg=B
[0 0; 1 1; 2 0; 1 -1].Line
~~~

![](sw/spl/Help/Image/closedLine-B.svg)

* * *

See also: Line, Polygon
