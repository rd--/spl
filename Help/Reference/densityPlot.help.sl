# densityPlot

- _densityPlot(aBlock:/2, xInterval, yInterval)_

Answer a density plot of _aBlock_ as a function of _x_ and _y_ over their respective intervals.

Plot a function:

~~~spl png=A
{ :x :y |
	x.sin * y.sin
}.densityPlot(-1 -- 1, -1 -- 1)
~~~

![](sw/spl/Help/Image/densityPlot-A.png)

~~~spl png=B
{ :x :y |
	(x + y.squared).sin
}.densityPlot(-3 -- 3, -1 -- 1)
~~~

![](sw/spl/Help/Image/densityPlot-B.png)

~~~spl png=C
{ :x :y |
	(x + y.cos).sin
}.densityPlot(-3 -- 3, -3 -- 3)
~~~

![](sw/spl/Help/Image/densityPlot-C.png)

* * *

See also: arrayPlot, Colour, Greymap, Image, matrixPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DensityPlot.html)
