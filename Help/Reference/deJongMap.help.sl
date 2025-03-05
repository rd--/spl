# deJongMap

- _deJongMap(a, b, c, d)_

Iterative map function by Peter de Jong.

Plot small iteration count:

~~~spl svg=A
deJongMap(-2.24, 0.43, -0.65, -2.43)
.nestList([0 0], 99)
.scatterPlot
~~~

![](sw/spl/Help/Image/deJongMap-A.svg)

Plot small iteration count:

~~~spl svg=B
deJongMap(-2.7, -0.09, -0.86, -2.2)
.nestList([0 0], 143)
.scatterPlot
~~~

![](sw/spl/Help/Image/deJongMap-B.svg)

* * *

See also: henonMap, henonAreaPreservingMap, martinMap

Further Reading: Dewdney 1987
