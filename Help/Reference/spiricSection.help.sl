# spiricSection

- _spiricSection(a, b, c)_

Answer the implicit equation of a spiric section.

Plot _y,x_ form:

~~~spl svg=A
let i = (-2.pi -- 2.pi).discretize(50);
spiricSection(1, 2, 0.8)
.swap
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/spiricSection-A.svg)

Plot with _b=5/4_ and _c=1/2_:

~~~spl svg=B
let i = (-2.pi -- 2.pi).discretize(50);
spiricSection(1, 1.25, 0.5)
.swap
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/spiricSection-B.svg)

* * *

See also: cassiniOval

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SpiricSection.html)
_W_
[1](https://en.wikipedia.org/wiki/Spiric_section)
