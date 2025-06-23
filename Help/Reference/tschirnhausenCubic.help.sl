# tschirnhausenCubic

- _tschirnhausenCubic(t)_

Parametric curve studied by Ricatti in 1712, Euler in 1781, Sturm in 1857, and Sylvester in 1868.

Line drawing:

~~~spl svg=A
(-1 -- 1).discretize(
	500,
	1.tschirnhausenCubic
).Line
~~~

![](sw/spl/Help/Image/tschirnhausenCubic-A.svg)

* * *

See also: discretize, inverseNorwichSpiral

Guides: Curve Functions

References:
_Ferréol_
[1](https://mathcurve.com/courbes2d.gb/tschirnhausen/tschirnhausen.shtml),
_Mathematica_
[1](https://mathworld.wolfram.com/TschirnhausenCubic.html),
_W_
[1](https://en.wikipedia.org/wiki/Tschirnhausen_cubic)
