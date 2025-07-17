# galileanSpiral

- _galileanSpiral(a, b)_

The Galilean spiral describes the trajectory of a point uniformly accelerated along a line rotating about a point.

Drawing with _b=-1_:

~~~spl svg=A
(-10 -- 10).discretize(
	100,
	galileanSpiral(1, -1)
).Line
~~~

![](sw/spl/Help/Image/galileanSpiral-A.svg)

Drawing with _b=1/8_:

~~~spl svg=A
(-10 -- 10).discretize(
	500,
	galileanSpiral(1, 0.125)
).Line
~~~

![](sw/spl/Help/Image/galileanSpiral-B.svg)

* * *

See also: archimedeanSpiral

Guides: Curve Functions

References:
_Ferréol_
[1](https://mathcurve.com/courbes2d.gb/galilee/galilee.shtml),
_Mathematica_
[1](https://mathworld.wolfram.com/GalileanSpiral.html)
