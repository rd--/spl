# densityPlot

- _densityPlot(f₂, x₁—x₂, y₁—y₂)_

Answer a density plot of _f_ as a function of _x_ and _y_ over their respective intervals.

Plot a function:

~~~spl png=A
{ :x :y |
	x.sin * y.sin
}.densityPlot(-1 -- 1, -1 -- 1)
~~~

![](sw/spl/Help/Image/densityPlot-A.png)

Plot a function:

~~~spl png=B
{ :x :y |
	(x + y.squared).sin
}.densityPlot(-3 -- 3, -1 -- 1)
~~~

![](sw/spl/Help/Image/densityPlot-B.png)

Plot a function:

~~~spl png=C
{ :x :y |
	(x + y.cos).sin
}.densityPlot(-3 -- 3, -3 -- 3)
~~~

![](sw/spl/Help/Image/densityPlot-C.png)

Plot a function:

~~~spl png=D
{ :x :y |
	x.cos + y.cos
}.densityPlot(0 -- 2.pi, 0 -- 2.pi)
~~~

![](sw/spl/Help/Image/densityPlot-D.png)

Plot a trigonometric function:

~~~spl png=E
{ :x :y |
	x + ((x ^ 2) + (y ^ 2)).sin
}.densityPlot(-4 -- 4, -4 -- 4)
~~~

![](sw/spl/Help/Image/densityPlot-E.png)

* * *

See also: arrayPlot, Colour, contourPlot, Greymap, Image, matrixPlot, reliefPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DensityPlot.html)
