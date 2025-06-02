# standardMap

- _standardMap(k)_

A two-dimensional area-preserving map,
also known as the Taylor-Greene-Chirikov map.

Plot the first _n_ terms of the map for each of _m_ randomly selected initial coordinates with parameter _k_:

~~~spl svg=A
let k = 0.13;
let m = 17;
let n = 13;
Sfc32(637214).
randomReal([0 2.pi], [m 2])
.collect { :each |
	standardMap(k)
	.nestList(each, n)
}
.catenate
.fromPolarCoordinates
.scatterPlot
~~~

![](sw/spl/Help/Image/standardMap-A.svg)

* * *

See also: deJongMap, henonMap, martinMap

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StandardMap.html),
_Meier_
[1](http://www.3d-meier.de/tut19/Seite159.html),
_W_
[1](https://en.wikipedia.org/wiki/Standard_map)
