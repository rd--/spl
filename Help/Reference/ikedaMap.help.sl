# ikedaMap

- _ikedaMap(u)_

Implement the Ikeda map, a discrete-time dynamical system.

Plot the first few terms of the trajectories a few randomly selected coordinates with _u=0.85_:

~~~spl svg=A
Sfc32(678214)
.randomReal([-1 1], [25 2])
.collect { :v |
	ikedaMap(0.85)
	.nestList(v, 10)
}.catenate.PointCloud
~~~

![](sw/spl/Help/Image/ikedaMap-A.svg)

* * *

See also: logisticMap

Guides: Chaotic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Ikeda_map)

Further Reading: Ikeda 1979
