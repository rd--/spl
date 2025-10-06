# bicuspidCurve

- _bicuspidCurve(a=1)_

Answer the implicit equation for the bicuspid curve.

Plot the bicuspid curve with _a=1_ at _z=0_::

~~~spl svg=A
let i = (-2 -- 2).subdivide(35);
bicuspidCurve(1)
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/bicuspidCurve-A.svg)

* * *

See also: bowCurve, stirrupCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BicuspidCurve.html)
