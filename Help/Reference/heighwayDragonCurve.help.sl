# heighwayDragonCurve

- _heighwayDragonCurve(n)_

Answer the line segments representing the _n_-th Heighway dragon curve.

The 1st step of the Heighway dragon curve:

```
>>> 1.heighwayDragonCurve
[0 0; 1 0; 1 1]
```

The 2nd step of the Heighway dragon curve:

```
>>> 2.heighwayDragonCurve
[0 0; 1 0; 1 1; 0 1; 0 2]
```

Lengths of successive approximations to the Heighway dragon curve:

```
>>> 1:11.collect { :n |
>>> 	n.heighwayDragonCurve.size
>>> }
[3 5 9 17 33 65 129 257 513 1025 2049]
```

Drawing of the 6th step of the Heighway dragon curve:

~~~spl svg=A
6.heighwayDragonCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/heighwayDragonCurve-A.svg)

Drawing of the 9th step of the Heighway dragon curve:

~~~spl svg=B
9.heighwayDragonCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/heighwayDragonCurve-B.svg)

* * *

See also: angleVector, peanoCurve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DragonCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Dragon_curve)
