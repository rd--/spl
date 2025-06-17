# botanicCurve

- _botanicCurve(c, d)_

The botanic curve is the conchoid of the rhodonea,
given by the polar equation _r=1+d·sin(cθ)_.

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

With parameters _c=1/2,d=2_, called Freeth’s nephroid:

~~~spl svg=D
(0 -- 4.pi).subdivide(100)
.collect(
	botanicCurve(1 / 2, 2)
).Line
~~~

![](sw/spl/Help/Image/botanicCurve-D.svg)

With parameter _c=1_ called the limaçon,
and with _d=2_ called the limaçon trisectrix:

~~~spl svg=E
(0 -- 2.pi).subdivide(100)
.collect(
	botanicCurve(1, 2)
).Line
~~~

![](sw/spl/Help/Image/botanicCurve-E.svg)

With parameters _c=2,d=2_ called Ceva’s trisectrix:

~~~spl svg=F
(0 -- 2.pi).subdivide(100)
.collect(
	botanicCurve(2, 2)
).Line
~~~

![](sw/spl/Help/Image/botanicCurve-F.svg)

* * *

See also: butterflyCurve, epitrochoid, hypotrochoid, lissajousCurve, rhodonea

Guides: Curve Functions

References:
_Wassenaar_
[1](https://www.2dcurves.com/roulette/rouletteb.html)
[2](https://www.2dcurves.com/derived/strophoidn.html)
[3](https://www.2dcurves.com/roulette/roulettel.html)
[4](https://www.2dcurves.com/sextic/sextict.html)
