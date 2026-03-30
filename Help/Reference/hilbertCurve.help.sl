# hilbertCurve

- _hilbertCurve(n)_

Answer the line segments representing the _n_-th step Hilbert curve.

The 1st step of the Hilbert curve:

```
>>> 1.hilbertCurve
[0 0; 0 1; 1 1; 1 0]
```

The 2nd step of the Hilbert curve:

```
>>> 2.hilbertCurve
[
	0 0; 1 0; 1 1; 0 1;
	0 2; 0 3; 1 3; 1 2;
	2 2; 2 3; 3 3; 3 2;
	3 1; 2 1; 2 0; 3 0
]
```

Lengths of successive approximations to the Hilbert curve:

```
>>> 1:5.collect { :n |
>>> 	n.hilbertCurve.size
>>> }
[4 16 64 256 1024]
```

Drawing of the 4th step of the Hilbert curve:

~~~spl svg=A
4.hilbertCurve.Line
~~~

![](Help/Image/hilbertCurve-A.svg)

Drawing of the 5th step of the Hilbert curve:

~~~spl svg=B
5.hilbertCurve.Line
~~~

![](Help/Image/hilbertCurve-B.svg)

_x_-coordinates of Hilbert curve for _n=5_,
OEIS [A059252](https://oeis.org/A059252):

~~~spl svg=C oeis=A059252
5.hilbertCurve
.first(150)
.column(1)
.stepPlot
~~~

![](Help/Image/hilbertCurve-C.svg)

_y_-coordinates of Hilbert curve for _n=5_,
OEIS [A059253](https://oeis.org/A059253):

~~~spl svg=D oeis=A059253
5.hilbertCurve
.first(150)
.column(2)
.stepPlot
~~~

![](Help/Image/hilbertCurve-D.svg)

Hilbert curve in _n×n_ grid by descending antidiagonals,
OEIS [A163363](https://oeis.org/A163363),
also
OEIS [A163359](https://oeis.org/A163359)
plus one:

~~~spl svg=E oeis=A163363
let h = 4.hilbertCurve.round;
0:13.antidiagonalArray { :n :k |
	h.indexOf([n, k])
}.catenate.discretePlot
~~~

![](Help/Image/hilbertCurve-E.svg)

First differences of _y_-coordinates of Hilbert curve for _n=5_,
OEIS [A163538](https://oeis.org/A163538):

~~~spl svg=F oeis=A163538
5.hilbertCurve
.first(150)
.column(2)
.differences
.discretePlot
~~~

![](Help/Image/hilbertCurve-F.svg)

First differences of _x_-coordinates of Hilbert curve for _n=5_,
OEIS [A163539](https://oeis.org/A163539):

~~~spl svg=G oeis=A163539
5.hilbertCurve
.first(150)
.column(1)
.differences
.discretePlot
~~~

![](Help/Image/hilbertCurve-G.svg)

* * *

See also: angleVector, peanoCurve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HilbertCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Hilbert_curve)
