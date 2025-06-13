# botanicCurve

- _botanicCurve(c, d)_

The botanic curve is the conchoid of the rhodonea.

With parameters _c=2/3,d=1_:

~~~spl svg=A
(0 -- 6.pi).functionPlot(
	botanicCurve(2 / 3, 1)
)
~~~

![](sw/spl/Help/Image/botanicCurve-A.svg)

With parameters _c=2/3,d=2_:

~~~spl svg=B
(0 -- 6.pi).functionPlot(
	botanicCurve(2 / 3, 2)
)
~~~

![](sw/spl/Help/Image/botanicCurve-B.svg)

With parameters _c=4,d=1/4_:

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	botanicCurve(4, 1 / 4)
)
~~~

![](sw/spl/Help/Image/botanicCurve-C.svg)

* * *

See also: butterflyCurve, epitrochoid, hypotrochoid, lissajousCurve

Guides: Algebraic Curve Functions

References:
_Wassenaar_
[1](https://www.2dcurves.com/roulette/rouletteb.html)
