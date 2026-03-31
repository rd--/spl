# levyCCurve

- _levyCCurve(n, k='A')_

Answer the line segments representing the _n_-th Lévy C curve.

The 1st step of the Lévy C curve:

```
>>> 1.levyCCurve
[0 0; 0.7071 0.7071; 1.4142 0]
```

The 2nd step of the Lévy C curve:

```
>>> 2.levyCCurve
[0 0; 0 1; 1 1; 2 1; 2 0]
```

Lengths of successive approximations to the Lévy C curve,
_2^n+1_,
OEIS [A000051](https://oeis.org/A000051):

```
>>> 0:9.collect { :n |
>>> 	n.levyCCurve.size
>>> }
[2 3 5 9 17 33 65 129 257 513]

>>> 2 ^ 0:9 + 1
[2 3 5 9 17 33 65 129 257 513]
```

Drawing of the 6th step of the Lévy C curve:

~~~spl svg=A
6.levyCCurve.Line
~~~

![](Help/Image/levyCCurve-A.svg)

Drawing of the 9th step of the Lévy C curve:

~~~spl svg=B
9.levyCCurve.Line
~~~

![](Help/Image/levyCCurve-B.svg)

An alternate construction of the Lévy C curve
answers the first _n_ terms in lattice (integer) coordinates:

~~~spl svg=C
512.levyCCurve('B').Line
~~~

![](Help/Image/levyCCurve-C.svg)

_x_-coordinates of the Lévy C curve,
OEIS [A332251](https://oeis.org/A332251):

~~~spl svg=D oeis=A332251
115.levyCCurve('B')
.column(1)
.discretePlot
~~~

![](Help/Image/levyCCurve-D.svg)

_y_-coordinates of the Lévy C curve,
OEIS [A332252](https://oeis.org/A332252):

~~~spl svg=E oeis=A332252
115.levyCCurve('B')
.column(2)
.discretePlot
~~~

![](Help/Image/levyCCurve-E.svg)

* * *

See also: angleVector, peanoCurve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LevyFractal.html),
_Riddle_
[1](https://larryriddle.agnesscott.org/ifs/levy/levy.htm),
_W_
[1](https://en.wikipedia.org/wiki/L%C3%A9vy_C_curve)
