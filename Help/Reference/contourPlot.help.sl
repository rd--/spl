# contourPlot

- _contourPlot(f:/2, x, y, z)_

Answer a contour plot of _f_ as a function of _x_ and _y_ at values in _z_.

A contour plot of a sparsely sampled trigonometric function at one _z_ value:

~~~spl svg=A
let i = (0 -- 4.pi).subdivide(10);
{ :x :y |
	x.cos + y.cos
}.contourPlot(i, i, [0.5])
~~~

![](sw/spl/Help/Image/contourPlot-A.svg)

A contour plot of a very sparsely sampled trigonometric function at three _z_ values:

~~~spl svg=B
let i = (0 -- 4.pi).subdivide(5);
{ :x :y |
	x.cos + y.cos
}.contourPlot(i, i, [-0.75 0 0.75])
~~~

![](sw/spl/Help/Image/contourPlot-B.svg)

* * *

See also: bourkeContourAlgorithm, densityPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContourPlot.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/contour.htm)
