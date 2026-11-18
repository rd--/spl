# bicuspidCurve

- _bicuspidCurve(a=1.0)_

Answer the implicit equation for the bicuspid curve.

Plot the bicuspid curve with _a=1_ at _z=0_:

~~~spl svg=A
let i = (-2.0 -- 2.0).subdivide(35);
bicuspidCurve(1.0)
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/bicuspidCurve-A.svg)

* * *

See also: bowCurve, stirrupCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BicuspidCurve.html)
