# trifolium

- _trifolium(a)_

Answer the trifolium quartic plane curve.

Plot:

~~~spl svg=A
(0 -- 1.pi).discretize(100, 1.trifolium).Line
~~~

![](sw/spl/Help/Image/trifolium-A.svg)

There is also a generalised form:

~~~spl svg=B
(0 -- 1.pi).discretize(
	100,
	trifolium(1, 3, 1 / 3)
).Line
~~~

![](sw/spl/Help/Image/trifolium-B.svg)

Alternate parameters:

~~~spl svg=C
(0 -- 1.pi).discretize(
	100,
	trifolium(2 / 3, -1, 3)
).Line
~~~

![](sw/spl/Help/Image/trifolium-C.svg)

* * *

See also: bifoliate, bifolium, foliumOfDescartes

Guides: Curve Functions

References:
_Ferréol_
[1](https://www.mathcurve.com/courbes2d.gb/trifoliumregulier/trifoliumregulier.shtml)
[2](https://www.mathcurve.com/courbes2d.gb/trifolium/trifolium.shtml),
_Mathematica_
[1](https://mathworld.wolfram.com/Trifolium.html)
_W_
[1](https://en.wikipedia.org/wiki/Trifolium_curve)
