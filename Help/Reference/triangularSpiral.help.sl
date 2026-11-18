# triangularSpiral

- _triangularSpiral(n)_

Answer the first _n_ terms of a triangular spiral.

```
>>> 10L.triangularSpiral
[
	0 0; 1 0; 0 1; -1 0; -2 -1;
	-1 -1; 0 -1; 1 -1; 2 -1; 3 -1
]
```

_x_-coordinate of a triangular spiral,
OEIS [A329116](https://oeis.org/A329116):

~~~spl svg=A oeis=A329116
65L.triangularSpiral
.column(1L)
.discretePlot
~~~

![](Help/Image/triangularSpiral-A.svg)

_y_-coordinate of a triangular spiral,
OEIS [A329972](https://oeis.org/A329972):

~~~spl svg=B oeis=A329972
65L.triangularSpiral
.column(2L)
.discretePlot
~~~

![](Help/Image/triangularSpiral-B.svg)

A triangular spiral:

~~~spl svg=C
196.triangularSpiral.pointLinePlot
~~~

![](Help/Image/triangularSpiral-C.svg)

* * *

See also: diamondSpiral, squareSpiral

Guides: Geometry Functions

References:
_OEIS_
[1](https://oeis.org/A329116)
[2](https://oeis.org/A329972)
