# wattsCurve

- _wattsCurve(a, b, c)_

Answer the implicit equation for Watt’s curve.

Contour plot of Watts curve:

~~~spl svg=A
let a = 1;
let b = 2.sqrt;
let c = 1;
let z = 1.1 * ((b ^ 2) - ((a - c) ^ 2)).sqrt;
let i = (z.- -- z).discretize(50);
wattsCurve(a, b, c)
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/wattsCurve-A.svg)

* * *

See also: Circle

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WattsCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Watt%27s_curve)
