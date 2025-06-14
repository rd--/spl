# levyCCurve

- _levyCCurve(n)_

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

Lengths of successive approximations to the Lévy C curve:

```
>>> 1:9.collect { :n |
>>> 	n.levyCCurve.size
>>> }
[3 5 9 17 33 65 129 257 513]
```

Drawing of the 6th step of the Lévy C curve:

~~~spl svg=A
6.levyCCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/levyCCurve-A.svg)

Drawing of the 9th step of the Lévy C curve:

~~~spl svg=B
9.levyCCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/levyCCurve-B.svg)

* * *

See also: angleVector, peanoCurve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LevyFractal.html),
_W_
[1](https://en.wikipedia.org/wiki/L%C3%A9vy_C_curve)
