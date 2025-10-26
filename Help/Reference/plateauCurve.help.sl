# plateauCurve

- _plateauCurve(a, m, n)_

Answer the specified Plateau curve.

~~~spl svg=A
(-2.pi -- 2.pi).discretize(
	200,
	plateauCurve(1, 1.25, 1)
).Line
~~~

![](sw/spl/Help/Image/plateauCurve-A.svg)

At _m=2n_ the curve is a circle:

~~~spl svg=B
(-1/2.pi -- 1/2.pi).functionPlot(
	plateauCurve(1, 2, 1)
)
~~~

![](sw/spl/Help/Image/plateauCurve-B.svg)

At _3m=2n_:

~~~spl svg=C
(-1.pi -- 1.pi).discretize(
	200,
	plateauCurve(1, 1.5, 1)
).Line
~~~

![](sw/spl/Help/Image/plateauCurve-C.svg)

* * *

See also: sin

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PlateauCurves.html)
