# sierpinskiArrowheadCurve

- _sierpinskiArrowheadCurve(n, k='A')_

Answer the line segments representing the _n_-th step Sierpiński arrowhead curve.

Lengths of successive approximations to the Sierpiński arrowhead curve,
OEIS [A034472](https://oeis.org/A034472):

```
>>> 0:4.collect { :n |
>>> 	n.sierpinskiArrowheadCurve('A').size
>>> }
[2 4 10 28 82]

>>> 3 ^ 0:4 + 1
[2 4 10 28 82]
```

Drawing of the 2nd step of the Sierpiński arrowhead curve:

~~~spl svg=A
2.sierpinskiArrowheadCurve('A').Line
~~~

![](Help/Image/sierpinskiArrowheadCurve-A.svg)

Drawing of the 3rd step of the Sierpiński arrowhead curve:

~~~spl svg=B
5.sierpinskiArrowheadCurve('A').Line
~~~

![](Help/Image/sierpinskiArrowheadCurve-B.svg)

_x_-coordinate of the Sierpiński arrowhead curve,
OEIS [A334483](https://oeis.org/A334483):

~~~spl svg=C oeis=A334483
5.sierpinskiArrowheadCurve('B')
.column(1)
.scatterPlot
~~~

![](Help/Image/sierpinskiArrowheadCurve-C.svg)

_y_-coordinate of the Sierpiński arrowhead curve,
OEIS [A334484](https://oeis.org/A334484):

~~~spl svg=D oeis=A334484
5.sierpinskiArrowheadCurve('B')
.column(2)
.scatterPlot
~~~

![](Help/Image/sierpinskiArrowheadCurve-D.svg)

The Sierpiński arrowhead curve:

~~~spl svg=E
5.sierpinskiArrowheadCurve('B').Line
~~~

![](Help/Image/sierpinskiArrowheadCurve-E.svg)

* * *

See also: sierpinskiCarpet, sierpinskiCurve, sierpinskiSieve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SierpinskiArrowheadCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Sierpiński_curve)
