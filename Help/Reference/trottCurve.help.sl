# trottCurve

- _trottCurve(x, y)_

Implement the implicit equation of the Trott curve.

Plot:

~~~spl svg=A
let i = (-1 -- 1).discretize(50);
trottCurve:/2.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/trottCurve-A.svg)

* * *

See also: contourPlot

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TrottCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Bitangents_of_a_quartic)
