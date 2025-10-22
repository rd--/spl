# contourPlot

- _contourPlot(f₂, x, y, z)_

Answer a contour plot of _f₂_ as a function of _x_ and _y_ at values in _z_.

A contour plot of a sparsely sampled trigonometric function at one _z_ value:

~~~spl svg=A
let i = (0 -- 4.pi).subdivide(50);
{ :x :y |
	x.cos + y.cos
}.contourPlot(i, i, [0.5])
~~~

![](sw/spl/Help/Image/contourPlot-A.svg)

A contour plot of a sparsely sampled trigonometric function at three _z_ values:

~~~spl svg=B
let i = (0 -- 4.pi).subdivide(20);
{ :x :y |
	x.cos + y.cos
}.contourPlot(i, i, [-0.75 0 0.75])
~~~

![](sw/spl/Help/Image/contourPlot-B.svg)

Display the contours of the Matlab peaks function at _z = 1_:

~~~spl svg=C
let i = (-3 -- 3).subdivide(20);
{ :x :y |
	x.matlabPeaksFunction(y)
}.contourPlot(i, i, [1])
~~~

![](sw/spl/Help/Image/contourPlot-C.svg)

Display the contours of the Matlab peaks function at three _z_ levels:

~~~spl svg=D
let i = (-3 -- 3).subdivide(20);
{ :x :y |
	x.matlabPeaksFunction(y)
}.contourPlot(i, i, [-4 0 2])
~~~

![](sw/spl/Help/Image/contourPlot-D.svg)

Contour plot of an exponential function:

~~~spl svg=E
let i = (-5 -- 5).subdivide(20);
{ :x :y |
	(0 - ((x / 3) ^ 2) - ((y / 3) ^ 2)).exp
	+
	(0 - ((x + 2) ^ 2) - ((y + 2) ^ 2)).exp
}.contourPlot(i, i, [0.2, 0.4 .. 1.2])
~~~

![](sw/spl/Help/Image/contourPlot-E.svg)

Contour plot of Watts curve:

~~~spl svg=F
let a = 3.1;
let b = 1.1;
let c = 3.0;
let z = 1.1 * ((b ^ 2) - ((a - c) ^ 2)).sqrt;
let i = (z.- -- z).discretize(50);
wattsCurve(a, b, c)
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/contourPlot-F.svg)

Plot the trident curve given by _xy+x³+x²+x-1=0_:

~~~spl svg=G
let i = (-10 -- 10).subdivide(100);
[1 1 1 1].tridentCurve.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/contourPlot-G.svg)

Plot the implicit curve _sin(x+y)-cos(xy)+1=0_:

~~~spl svg=H
let i = (-5 -- 5).subdivide(35);
{ :x :y |
	(x + y).sin - (x * y).cos + 1
}.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/contourPlot-H.svg)

Plot the bow curve:

~~~spl svg=I
let i = (-0.5 -- 0.5).subdivide(50);
bowCurve:/2.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/contourPlot-I.svg)

Plot the stirrup curve:

~~~spl svg=J
let i = (-5 -- 5).subdivide(50);
stirrupCurve:/2.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/contourPlot-J.svg)

Plot the bicuspid curve:

~~~spl svg=K
let i = (-2 -- 2).subdivide(35);
bicuspidCurve(1).contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/contourPlot-K.svg)

Plot the equation for a generalised circle:

~~~spl svg=L
let [a, b, c, d] = [1, 2, 0, 0];
let i = (-2 -- 2).subdivide(35);
{ :x :y |
	[
		a * x * x,
		a * y * y,
		b * x,
		c * y,
		d
	].sum
}.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/contourPlot-L.svg)

Plot a _y,x_ Cassini oval:

~~~spl svg=M
let i = (-2 -- 2).subdivide(25);
cassiniOval(0.9, 1)
.swap
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/contourPlot-M.svg)

* * *

See also: bourkeContourAlgorithm, densityPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContourPlot.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/contour.html)
[2](https://au.mathworks.com/help/matlab/ref/fcontour.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/contour.htm),
_W_
[1](https://en.wikipedia.org/wiki/Contour)
[2](https://en.wikipedia.org/wiki/Contour_plot)
[3](https://en.wikipedia.org/wiki/Implicit_curve)
