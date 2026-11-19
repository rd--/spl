# galileanSpiral

- _galileanSpiral(a, b)_

The Galilean spiral describes the trajectory of a point uniformly accelerated along a line rotating about a point.

Drawing with _b=-1_:

~~~spl svg=A
(-10.0 -- 10.0).discretize(
	100L,
	galileanSpiral(1.0, -1.0)
).Line
~~~

![](Help/Image/galileanSpiral-A.svg)

Drawing with _b=1/8_:

~~~spl svg=B
(-10.0 -- 10.0).discretize(
	500L,
	galileanSpiral(1.0, 0.125)
).Line
~~~

![](Help/Image/galileanSpiral-B.svg)

* * *

See also: archimedeanSpiral

Guides: Curve Functions

References:
_Ferréol_
[1](https://mathcurve.com/courbes2d.gb/galilee/galilee.shtml),
_Mathematica_
[1](https://mathworld.wolfram.com/GalileanSpiral.html)
