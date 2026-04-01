# heighwayDragonCurve

- _heighwayDragonCurve(n, k='A')_

Answer the line segments representing the _n_-th Heighway dragon curve.

The 1st step of the Heighway dragon curve:

```
>>> 1.heighwayDragonCurve('A')
[0 0; 1 0; 1 1]
```

The 2nd step of the Heighway dragon curve:

```
>>> 2.heighwayDragonCurve('A')
[0 0; 1 0; 1 1; 0 1; 0 2]
```

Lengths of successive approximations to the Heighway dragon curve,
OEIS [A000051](https://oeis.org/A000051):

```
>>> 0:11.collect { :n |
>>> 	n.heighwayDragonCurve('A').size
>>> }
[2 3 5 9 17 33 65 129 257 513 1025 2049]

>>> 2 ^ 0:11 + 1
[2 3 5 9 17 33 65 129 257 513 1025 2049]
```

Drawing of the 6th step of the Heighway dragon curve:

~~~spl svg=A
6.heighwayDragonCurve('A').Line
~~~

![](Help/Image/heighwayDragonCurve-A.svg)

Drawing of the 9th step of the Heighway dragon curve:

~~~spl svg=B
9.heighwayDragonCurve('A').Line
~~~

![](Help/Image/heighwayDragonCurve-B.svg)

_x_-coordinates of the dragon curve,
OEIS [A332383](https://oeis.org/A332383):

~~~spl svg=C oeis=A332383
7.heighwayDragonCurve('A').column(1)
.discretePlot
~~~

![](Help/Image/heighwayDragonCurve-C.svg)

_y_-coordinates of the dragon curve,
OEIS [A332384](https://oeis.org/A332384):

~~~spl svg=D oeis=A332384
7.heighwayDragonCurve('A').column(2)
.discretePlot
~~~

![](Help/Image/heighwayDragonCurve-D.svg)

_Note_: `heighwayDragonCurve` and `dragonCurve` are aliases.
The examples here show the _'A'_ construction of the curve.

* * *

See also: angleVector, dragonCurve, peanoCurve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DragonCurve.html),
_Riddle_
[1](https://larryriddle.agnesscott.org/ifs/heighway/heighway.htm),
_W_
[1](https://en.wikipedia.org/wiki/Dragon_curve)
