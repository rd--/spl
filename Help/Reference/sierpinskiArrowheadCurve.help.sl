# sierpinskiArrowheadCurve

- _sierpinskiArrowheadCurve(n)_

Answer the line segments representing the _n_-th step Sierpiński arrowhead curve.

Lengths of successive approximations to the Sierpiński arrowhead curve:

```
>>> 1:4.collect { :n |
>>> 	n.sierpinskiArrowheadCurve.size
>>> }
[4 10 28 82]
```

Drawing of the 2nd step of the Sierpiński arrowhead curve:

~~~spl svg=A
2.sierpinskiArrowheadCurve.Line
~~~

![](sw/spl/Help/Image/sierpinskiArrowheadCurve-A.svg)

Drawing of the 3rd step of the Sierpiński arrowhead curve:

~~~spl svg=B
5.sierpinskiArrowheadCurve.Line
~~~

![](sw/spl/Help/Image/sierpinskiArrowheadCurve-B.svg)

* * *

See also: sierpinskiCarpet, sierpinskiCurve, sierpinskiSieve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SierpinskiArrowheadCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Sierpiński_curve)
