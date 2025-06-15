# discretePlot

- _discretePlot(y)_
- _discretePlot(x → y)_

Plot discrete data.
Also called _pin_ and _stem_ plots.

Plot a sequence of fifty places:

~~~spl svg=A
1:50.collect(primePi:/1).discretePlot
~~~

![](sw/spl/Help/Image/discretePlot-A.svg)

Plot a random permutation of the integers up to ninety nine:

~~~spl svg=B
let r = Sfc32(368142);
let l = r.randomSample(1:99, 99);
l.discretePlot
~~~

![](sw/spl/Help/Image/discretePlot-B.svg)

A dense discrete plot of a cosine function:

~~~spl svg=C
(-7.pi -- 13.pi).subdivide(256).collect { :x |
	x * (x / 3).cos
}.discretePlot
~~~

![](sw/spl/Help/Image/discretePlot-C.svg)

* * *

See also: functionPlot, graphPlot, linePlot, matrixPlot, parametricPlot, scatterPlot, surfacePlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DiscretePlot.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/stem.html)

Categories: Plotting
