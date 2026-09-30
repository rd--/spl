# loziMap

- _loziMap(a, b)_

The Lozi map modifies the two-dimensional Hénon map.

Lozi map with _a=1.4_ and _b=0.3_:

~~~spl svg=A
loziMap(1.4, 0.3)
.nestList([0 0], 99)
.scatterPlot
~~~

![](Help/Image/loziMap-A.svg)

Lozi map with varying _a_ and _b=-0.85_:

~~~spl svg=B
Sfc32(3728914)
.randomReal([0.15 0.85], [10])
.collect { :a |
	loziMap(a, -0.85)
	.nestList([0 0], 25)
	.PointCloud
}.LineDrawing
~~~

![](Help/Image/loziMap-B.svg)

* * *

See also: deJongMap, henonMap, martinMap

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LoziMap.html),
