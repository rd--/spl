# parametricPlot

- _parametricPlot(domain, xBlock:/1, yBlock:/1)_

Answer a parametric plot of a curve with _x_ and _y_ coordinates as function of _domain_.

Plot a parametric curve:

~~~spl svg=A
(0 -- 2.pi).parametricPlot(
	{ :u | u.sin },
	{ :u | (u * 2).sin }
)
~~~

![](sw/spl/Help/Image/parametricPlot-A.svg)

Circle:

~~~
(0 -- 2.pi).parametricPlot(cos:/1, sin:/1)
~~~

![](sw/spl/Help/Image/parametricPlot-B.svg)

Undersampling:

~~~spl svg=A
(0 -- 100).parametricPlot(
	{ :u | u * u.sin },
	{ :u | u * u.cos }
)
~~~

![](sw/spl/Help/Image/parametricPlot-C.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, linePlot, matrixPlot, scatterPlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ParametricPlot.html.en)
