# reliefPlot

- _reliefPlot(m)_

Answer a relief plot of a matrix _m_ of height values.

Plot a function:

~~~spl png=A
let i = (-1.0 -- 1.0).discretize(100);
{ :x :y |
	x.sin * y.sin
}.table(i, i).reliefPlot
~~~

![](Help/Image/reliefPlot-A.png)

Plot trigonometric function:

~~~spl png=B
let x = (-4.0 -- 4.0).discretize(100);
{ :i :j |
	i + ((j ^ 2) + (3 * i)).sin
}.table(x, x).reliefPlot
~~~

![](Help/Image/reliefPlot-B.png)

* * *

See also: Colour, Greymap, Image, arrayPlot, contourPlot, densityPlot, matrixPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ReliefPlot.html)
