# circleMap

- _circleMap(k, Ω)_

A one-dimensional map that maps a circle onto itself.

Plot the first few terms with _k=1,Ω=0.15_ for four randomly selected initial values of θ:

~~~spl svg=A
Sfc32(791742)
.randomReal([-0.25 0.25], 4)
.collect { :theta |
	circleMap(1, 0.15)
	.nestList(theta, 50)
}.linePlot
~~~

![](sw/spl/Help/Image/circleMap-A.svg)


Plot with _k=1,Ω=0.2_:

~~~spl svg=B
Sfc32(348014)
.randomReal([-0.25 0.25], 4)
.collect { :theta |
	circleMap(1, 0.2)
	.nestList(theta, 50)
}.linePlot
~~~

![](sw/spl/Help/Image/circleMap-B.svg)

Plot with _k=1,Ω=0.7_:

~~~spl svg=C
Sfc32(348014)
.randomReal([-0.25 0.25], 4)
.collect { :theta |
	circleMap(1, 0.7)
	.nestList(theta, 50)
}.linePlot
~~~

![](sw/spl/Help/Image/circleMap-C.svg)

* * *

See also: standardMap

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CircleMap.html),
_W_
[1](https://en.wikipedia.org/wiki/Arnold_tongue)
