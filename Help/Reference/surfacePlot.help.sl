# surfacePlot

- _surfacePlot(aList)_

Make a drawing of a three-dimensional surface.

If _aList_ is an _N×M_ array,
the entries are taken as _z_ value and the indices are taken as _x_ and _y_ values.

If _aList_ is an _N×M×3_ array,
the entries are taken to be _x,y,z_ triples.

In each case the plot is made as a ruled surface over the specified places.


~~~
let i = (-2 -- 2).subdivide(15);
{ :x :y |
	let z = x * (0 - (x ^ 2) - (y ^ 2)).exp;
	[x, y, z + 1]
}.table(i, i).surfacePlot
~~~

![](sw/spl/Help/Image/surfacePlot-A.svg)

~~~
let i = (-5 -- 5).subdivide(15);
{ :x :y |
	let z = x.sin + y.cos;
	[x, y, z / 6 + 3]
}.table(i, i).surfacePlot
~~~

![](sw/spl/Help/Image/surfacePlot-B.svg)

~~~
let i = (-10 -- 10).subdivide(15);
{ :x :y |
	let r = ((x ^ 2) + (y ^ 2)).sqrt + 1E-9;
	let z = r.sin / r;
	[x, y, z + 6]
}.table(i, i).surfacePlot
~~~

![](sw/spl/Help/Image/surfacePlot-C.svg)

~~~
let i = (-5 -- 5).subdivide(15);
{ :x :y |
	let z = (y * x.sin) - (x * y.cos);
	[x, y, z / 6 + 3]
}.table(i, i).surfacePlot
~~~

![](sw/spl/Help/Image/surfacePlot-D.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, linePlot, matrixPlot, parametricPlot, scatterPlot

References:
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/surf.html)

Categories: Plotting
