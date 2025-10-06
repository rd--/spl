# tridentCurve

- _tridentCurve([a b c d])_

Answer the implicit form of the trident of Newton.

Plot at _z=0_:

~~~spl svg=A
let i = (-10 -- 10).subdivide(100);
[1 1 1 1]
.tridentCurve
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/tridentCurve-A.svg)

* * *

See also: contourPlot, tridentOfNewton

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TridentofNewton.html),
_W_
[1](https://en.wikipedia.org/wiki/Trident_curve)
