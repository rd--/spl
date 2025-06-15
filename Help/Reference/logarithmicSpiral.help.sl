# logarithmicSpiral

- _logarithmicSpiral(a, b)_

The logarithmic spiral is a spiral whose polar equation is given by _r=ae^bθ_,
also known as the growth spiral or equiangular spiral.

A line drawing:

~~~spl svg=A
(0 -- 8.pi).discretize(
	200,
	logarithmicSpiral(1, 1/7)
).Line.asLineDrawing
~~~

![](sw/spl/Help/Image/logarithmicSpiral-A.svg)

* * *

See also: archimedeanSpiral, eulerSpiral

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LogarithmicSpiral.html),
_W_
[1](https://en.wikipedia.org/wiki/Logarithmic_spiral)
