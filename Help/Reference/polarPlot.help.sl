# polarPlot

- _polarPlot(domain, aBlock:/1 | aList)_

Generate a polar plot of a curve with radius r as a function of angle θ in _domain_.

A circle:

~~~
(0 -- pi).polarPlot(sin:/1)
~~~

![](sw/spl/Help/Image/polarPlot-A.svg)

Another circle:

~~~
(0 -- 2.pi).polarPlot { :t | 1 }
~~~

![](sw/spl/Help/Image/polarPlot-B.svg)

A knot:

~~~
(0 -- pi).polarPlot { :t | (3 * t).sin * t }
~~~

![](sw/spl/Help/Image/polarPlot-C.svg)

An oscillation around a circle:

~~~
(0 -- 2.pi).polarPlot([
	{ :t |
		1
	},
	{ :t |
		1 + (1 / 10 * (10 * t).sin)
	}
])
~~~

![](sw/spl/Help/Image/polarPlot-D.svg)

An Archimedean spiral:

~~~
(0 -- 20).polarPlot { :t | t ^ (1 / 2) }
~~~

![](sw/spl/Help/Image/polarPlot-E.svg)

Another Archimedean spiral:

~~~
(0 -- 20).polarPlot { :t | t ^ 1 }
~~~

![](sw/spl/Help/Image/polarPlot-F.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, linePlot, matrixPlot, parametricPlot, scatterPlot, surfacePlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PolarPlot.html)

Categories: Plotting
