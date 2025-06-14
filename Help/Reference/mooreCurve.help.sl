# mooreCurve

- _mooreCurve(n)_

Answer the line segments representing the _n_-th step Moore curve.

Lengths of successive approximations to the Moore curve:

```
>>> 1:4.collect { :n |
>>> 	n.mooreCurve.size
>>> }
[16 64 256 1024]
```

Drawing of the 3rd step of the Moore curve:

~~~spl svg=A
3.mooreCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/mooreCurve-A.svg)

Drawing of the 4th step of the Moore curve:

~~~spl svg=B
4.mooreCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/mooreCurve-B.svg)

* * *

See also: angleVector, hilbertCurve, substitutionSystem

Guides: Curve Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Moore_curve)
