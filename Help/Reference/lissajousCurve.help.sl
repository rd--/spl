# lissajousCurve

- _lissajousCurve(δ, a, b)_

Answer a `Block` implementing the Lissajous, or Bowditch, curve with the specified parameters.

With parameters _a=1,b=2_ (Lemniscate of Gerono):

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	lissajousCurve(1/2.pi, 1, 2)
)
~~~

![](sw/spl/Help/Image/lissajousCurve-A.svg)

With parameters _a=3,b=2_:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	lissajousCurve(1/2.pi, 3, 2)
)
~~~

![](sw/spl/Help/Image/lissajousCurve-B.svg)

With parameters _a=3,b=4_ (Lincoln Laboratory):

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	lissajousCurve(1/2.pi, 3, 4)
)
~~~

![](sw/spl/Help/Image/lissajousCurve-C.svg)

With parameters _a=5,b=4_:

~~~spl svg=D
(0 -- 2.pi).functionPlot(
	lissajousCurve(1/2.pi, 5, 4)
)
~~~

![](sw/spl/Help/Image/lissajousCurve-D.svg)

With parameters _a=1,b=3_ (Australian Broadcasting Corporation):

~~~spl svg=E
(0 -- 2.pi).functionPlot(
	lissajousCurve(1/2.pi, 1, 3)
)
~~~

![](sw/spl/Help/Image/lissajousCurve-E.svg)

With parameters _δ=3π/4,a=2,b=3_:

~~~spl svg=F
(0 -- 2.pi).functionPlot(
	lissajousCurve(3/4.pi, 2, 3)
)
~~~

![](sw/spl/Help/Image/lissajousCurve-F.svg)

With parameters _a=b=1_ and varying δ,
plot a circle and two ellipses:

~~~spl svg=G
(0 -- 2.pi).functionPlot(
	[1/4 1/2 3/4].collect { :n |
		lissajousCurve(n.pi, 1, 1)
	}
)
~~~

![](sw/spl/Help/Image/lissajousCurve-G.svg)

Evaluate symbolically:

```
>> lissajousCurve(`δ`, `a`, `b`)
>> .value(`t`)
[(sin (+ (* a t) δ)), (sin (* b t))]
```

* * *

See also: botanicCurve, butterflyCurve, harmonographCurve, hypotrochoid, sin

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LissajousCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Lissajous_curve)
