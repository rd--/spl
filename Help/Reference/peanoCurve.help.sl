# peanoCurve

- _peanoCurve(n)_

Answer the line segments representing the _n_-th step Peano curve.

The 1st step of the Peano curve:

```
>>> 1.peanoCurve
[0 0; 1 0; 2 0; 2 1; 1 1; 0 1; 0 2; 1 2; 2 2]
```

Lengths of successive approximations to the Peano curve,
powers of nine,
OEIS [A001019](https://oeis.org/A001019):

```
>>> 0:3.collect { :n |
>>> 	n.peanoCurve.size
>>> }
[1 9 81 729]

>>> 9 ^ 0:7
[1 9 81 729 6561 59049 531441 4782969]
```

Drawing of the 2nd step of the Peano curve:

~~~spl svg=A
2.peanoCurve.Line
~~~

![](Help/Image/peanoCurve-A.svg)

Drawing of the 3rd step of the Peano curve:

~~~spl svg=B
3.peanoCurve.Line
~~~

![](Help/Image/peanoCurve-B.svg)

_x_-coordinates of the Peano curve,
OEIS [A163528](https://oeis.org/A163528):

~~~spl svg=C oeis=A163528
2.peanoCurve
.column(1)
.discretePlot
~~~

![](Help/Image/peanoCurve-C.svg)

_y_-coordinates of the Peano curve,
OEIS [A163529](https://oeis.org/A163529):

~~~spl svg=D oeis=A163529
2.peanoCurve
.column(2)
.discretePlot
~~~

![](Help/Image/peanoCurve-D.svg)

* * *

See also: angleVector, hilbertCurve, sierpinskiCurve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PeanoCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Peano_curve)
