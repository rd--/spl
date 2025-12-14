# gaussIteratedMap

- _gaussIteratedMap(α, β)_

+SmallFloat{
	gaussIteratedMap { :alpha :beta |
		{ :x |
			(-alpha * x.square).exp + beta
		}
	}
}

A discrete dynamical system defined by a quadratic difference equation.

Cobweb plot at _α=4.9_ and _β=-0.58_,
a four cycle:

~~~spl svg=A
gaussIteratedMap(4.9, -0.58)
.cobwebPlot(0.315, 4)
~~~

![](sw/spl/Help/Image/gaussIteratedMap-A.svg)

Plot first few terms at _α=4.9_ and _β=-0.58_:

~~~spl svg=B
gaussIteratedMap(4.9, -0.58)
.nestList(0.473, 99)
.scatterPlot
~~~

![](sw/spl/Help/Image/gaussIteratedMap-B.svg)

Sparse plot of a fragment of the bifurcation diagram:

~~~spl svg=C
(-0.85 -- 0.75).discretize(50) { :beta |
	gaussIteratedMap(4.9, beta)
	.nestList(0.5, 11)
	.last(4)
	.collect { :y |
		[beta, y]
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/gaussIteratedMap-C.svg)

* * *

See also: henonMap, logisticMap

Guides: Chaotic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Gauss_iterated_map)
