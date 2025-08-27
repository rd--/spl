# parametricPlot

- _parametricPlot(u, x:/1, y:/1)_

Answer a parametric plot of a curve with _x_ and _y_ coordinates as function of the domain _u_.

Plot a parametric curve:

~~~spl svg=A
(0 -- 2.pi).parametricPlot(
	{ :u | u.sin },
	{ :u | (u * 2).sin }
)
~~~

![](sw/spl/Help/Image/parametricPlot-A.svg)

Circle:

~~~spl svg=B
(0 -- 2.pi).parametricPlot(cos:/1, sin:/1)
~~~

![](sw/spl/Help/Image/parametricPlot-B.svg)

Undersampling:

~~~spl svg=C
(0 -- 100).parametricPlot(
	{ :u | u * u.sin },
	{ :u | u * u.cos }
)
~~~

![](sw/spl/Help/Image/parametricPlot-C.svg)

Lemniscate of Bernoulli:

~~~spl svg=D
(0 -- 2.pi).parametricPlot(
	{ :u |
		u.cos / (1 + u.sin.square)
	},
	{ :u |
		(u.sin * u.cos)
		/
		(1 + u.sin.square)
	}
)
~~~

![](sw/spl/Help/Image/parametricPlot-D.svg)

Specify subdivision of domain:

~~~spl svg=E
let a = 3;
let b = 3.25;
(0 -- 8.pi).parametricPlot(400,
	{ :t |
		(a * b * t.cos) - (a * (b * t).cos)
	},
	{ :t |
		(a * b * t.sin) - (a * (b * t).sin)
	}
)
~~~

![](sw/spl/Help/Image/parametricPlot-E.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, linePlot, matrixPlot, scatterPlot, surfacePlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ParametricPlot.html.en)
