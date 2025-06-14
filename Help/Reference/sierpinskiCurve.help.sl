# sierpinskiCurve

- _sierpinskiCurve(anInteger)_

Answer the line segments representing the _anInteger_-th step Sierpiński curve.

Lengths of successive approximations to the Sierpiński curve:

```
>>> 1:3.collect { :n |
>>> 	n.sierpinskiCurve.size
>>> }
[17 65 257]
```

Drawing of the 2nd step of the Sierpiński curve:

~~~spl svg=A
2.sierpinskiCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/sierpinskiCurve-A.svg)

Drawing of the 3rd step of the Sierpiński curve:

~~~spl svg=B
3.sierpinskiCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/sierpinskiCurve-B.svg)

* * *

See also: angleVector, hilbertCurve, kochCurve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SierpinskiCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Sierpiński_curve)
