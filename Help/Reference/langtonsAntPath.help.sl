# langtonsAntPath

- _langtonsAntPath(n, c=[0 0], b=[], d=3)_

Answer the _n_-place path of Langton’s ant as a sequence of _x,y_ coordinates.
_c_ is the initial coordinate,
_b_ is the list of coordinates of cells that are initially set,
_d_ is the initial direction (1=right, 2=up, 3=left, 4=down).

_x_-coordinates of Langton’s ant,
starting at _0,0_ on an initially empty grid facing left,
OEIS [A274369](https://oeis.org/A274369):

~~~spl svg=A oeis=A274369
115.langtonsAntPath
.column(1)
.discretePlot
~~~

![](Help/Image/langtonsAntPath-A.svg)

_y_-coordinates of Langton’s ant,
starting at _0,0_ on an initially empty grid facing left,
OEIS [A274370](https://oeis.org/A274370):

~~~spl svg=B oeis=A274370
115.langtonsAntPath
.column(2)
.discretePlot
~~~

![](Help/Image/langtonsAntPath-B.svg)

_(x,y)_-coordinates visited by Langton’s ant,
starting at _0,0_ on an initially empty grid facing left:

~~~spl svg=C
1000.langtonsAntPath
.deleteDuplicates
.scatterPlot
~~~

![](Help/Image/langtonsAntPath-C.svg)

Path of Langton’s ant,
starting at _0,0_ on an initially empty grid facing left:

~~~spl svg=D
85.langtonsAntPath.pathPlot
~~~

![](Help/Image/langtonsAntPath-D.svg)

* * *

See also: elementaryCellularAutomaton

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LangtonsAnt.html),
_OEIS_
[1](https://oeis.org/A274369)
[2](https://oeis.org/A274370),
_W_
[1](https://en.wikipedia.org/wiki/Langton%27s_ant)
