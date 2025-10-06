# cassiniOval

- _cassiniOval(a, b)_

Answer the implicit equation for the Cassini oval curve.

Plot a _y,x_ Cassini oval with _a=9/10_ and _b=1_ at _z=0:

~~~spl svg=A
let i = (-2 -- 2).subdivide(25);
cassiniOval(9 / 10, 1)
.swap
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/cassiniOval-A.svg)

* * *

See also: bicuspidCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CassiniOvals.html),
_W_
[1](https://en.wikipedia.org/wiki/Cassini_oval)
