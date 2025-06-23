# norwichSpiral

- _norwichSpiral(a=1)_

Parametric curve studied by Ricatti in 1712, Euler in 1781, Sturm in 1857, and Sylvester in 1868.

Line drawing:

~~~spl svg=A
(-0.45.pi -- 0.45.pi).discretize(
	500,
	1.norwichSpiral
).Line
~~~

![](sw/spl/Help/Image/norwichSpiral-A.svg)

* * *

See also: discretize, inverseNorwichSpiral

Guides: Curve Functions

References:
_Ferréol_
[1](https://mathcurve.com/courbes2d.gb/sturm/spirale_sturm.shtml)
