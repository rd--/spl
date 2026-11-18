# cassiniOval

- _cassiniOval(a, b)_

Answer the implicit equation for the Cassini oval curve.

Plot a _y,x_ Cassini oval with _a=9/10_ and _b=1_ at _z=0:

~~~spl svg=A
let i = (-2.0 -- 2.0).subdivide(25);
cassiniOval(9.0 / 10.0, 1.0)
.swap
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/cassiniOval-A.svg)

* * *

See also: bicuspidCurve, spiricSection

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CassiniOvals.html),
_W_
[1](https://en.wikipedia.org/wiki/Cassini_oval)
