# katsuraFukudaMap

- _katsuraFukudaMap(k)_

Answer the iterative form of the Katsura-Fukuda map.

First few terms:

```
>>> 3/7.sqrt.katsuraFukudaMap
>>> .nestList(2 / 3, 6)
[
	0.666666
	0.968858
	0.197551
	0.600326
	0.997015
	0.020695
	0.080377
]
```

Plot first few terms:

~~~spl svg=A
3/7.sqrt.katsuraFukudaMap
.nestList(2 / 3, 150)
.scatterPlot
~~~

![](sw/spl/Help/Image/katsuraFukudaMap-A.svg)

* * *

Further Reading: Katsura
