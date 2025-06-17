# eulerSpiral

- _eulerSpiral(θ)_

The Euler spiral is a curve whose curvature changes linearly with its curve length.
Also called a clothoid or Cornu spiral.

Draw:

~~~spl svg=A
(-4 -- 4).discretize(100, eulerSpiral:/1).Line
~~~

![](sw/spl/Help/Image/fresnelC-C.svg)

* * *

See also: archimedeanSpiral, logarithmicSpiral

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CornuSpiral.html),
_W_
[1](https://en.wikipedia.org/wiki/Euler_spiral)
