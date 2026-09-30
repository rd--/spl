# rulkovMap

- _rulkovMap(α, μ=0.001, σ)_

The Rulkov map is a two-dimensional iterated map used to model a biological neuron.

Rulkov map with _α=4.035_ and _σ=-1_:

~~~spl png=A
rulkovMap(4.035, 0.001, -1)
.nestList([-1 -2.9], 2000)
.column(1)
.denseScatterPlot
~~~

![](Help/Image/rulkovMap-A.png)

The shape of the nonlinear function _f_ for the type-B Rulkov map,
where _α=6_ and _y=-3.93_:

~~~spl svg=B
let f/2 = rulkovNonlinearFunction(6);
(-3 -- 3).functionPlot { :x |
	f(x, -3.93)
}
~~~

![](Help/Image/rulkovMap-B.svg)

* * *

See also: deJongMap, henonMap, loziMap, martinMap

Guides: Chaotic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Rulkov_map)

Further Reading: Rulkov (2001, 2002)
