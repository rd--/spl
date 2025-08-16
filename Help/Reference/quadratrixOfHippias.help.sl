# quadratrixOfHippias

- _quadratrixOfHippias(a)_

The quadratrix or trisectrix of Hippias,
also called the quadratrix of Dinostratus,
is a curve which is created by a uniform motion.

Plot over _(-π/2,π/2)_:

~~~spl svg=A
(-0.5.pi -- 0.5.pi).functionPlot(
	quadratrixOfHippias(1).clip([-6 6])
)
~~~

![](sw/spl/Help/Image/quadratrixOfHippias-A.svg)

Plot over _(-4π,4π)_:

~~~spl svg=B
(-4.pi -- 4.pi).functionPlot(
	quadratrixOfHippias(1).clip([-6 6])
)
~~~

![](sw/spl/Help/Image/quadratrixOfHippias-B.svg)

* * *

See also: cot, pi

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/QuadratrixofHippias.html),
_W_
[1](https://en.wikipedia.org/wiki/Quadratrix_of_Hippias)
