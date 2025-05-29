# duffingMap

- _duffingMap(a, b)_

The Duffing map,
also called the Holmes map,
a discrete form of the Duffing equation.

Plot small iteration count:

~~~spl svg=A
duffingMap(2.75, 0.15)
.nestList([0.25 0.75], 99)
.scatterPlot
~~~

![](sw/spl/Help/Image/duffingMap-A.svg)

* * *

See also: henonMap, henonAreaPreservingMap, martinMap

Guides: Chaotic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Duffing_map)
