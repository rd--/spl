# logarithmicSpiral

- _logarithmicSpiral(a, b)_

The logarithmic spiral is a spiral whose polar equation is given by _r=ae^bθ_,
also known as the growth spiral or equiangular spiral.

A line drawing:

~~~spl svg=A
(0 -- 8.pi).discretize(
	200,
	logarithmicSpiral(1, 1/7)
).Line
~~~

![](sw/spl/Help/Image/logarithmicSpiral-A.svg)

The golden spiral is a logarithmic spiral whose growth factor is φ:

~~~spl svg=B
let b = 1.goldenRatio.log / 0.5.pi;
(0 -- 8.pi).discretize(
	200,
	logarithmicSpiral(1, b)
).Line
~~~

![](sw/spl/Help/Image/logarithmicSpiral-B.svg)

* * *

See also: archimedeanSpiral, eulerSpiral, goldenRatio

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LogarithmicSpiral.html)
[2](https://mathworld.wolfram.com/GoldenSpiral.html),
_W_
[1](https://en.wikipedia.org/wiki/Logarithmic_spiral)
[2](https://en.wikipedia.org/wiki/Golden_spiral)
