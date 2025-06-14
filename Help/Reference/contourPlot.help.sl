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
let wattsCurve = { :a :b :c |
	let a2 = a ^ 2;
	let b2 = b ^ 2;
	let c2 = c ^ 2;
	{ :x :y |
		let x2 = x ^ 2;
		let y2 = y ^ 2;
		let r2 = x2 + y2;
		(r2 * ((r2 - a2 - b2 + c2) ^ 2))
		+
		(4 * a2 * y2 * (r2 - b2))
	}
};
let z = 1.1 * ((b ^ 2) - ((a - c) ^ 2)).sqrt;
let i = (z.- -- z).discretize(50);
wattsCurve(a, b, c)
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/contourPlot-F.svg)

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
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/contour.htm)
