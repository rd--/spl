# surfacePlot

- _surfacePlot(domain, aBlock:/2)_
- _surfacePlot(aList)_

Make a drawing of a three-dimensional surface.

In the binary case _domain_ specifies both the _x_ and _y_ domains,
and _aBlock_ answers the _z_ value at each _x,y_ place.

In the unary case,
if _aList_ is an _N×M_ array,
the entries are taken as _z_ values and the indices are taken as _x_ and _y_ values.

If _aList_ is an _N×M×3_ array,
the entries are taken to be _x,y,z_ triples.

In each case the plot is made as a ruled surface over the specified places.

At `Interval`, which is implicitly disretized by `surfacePlot`:

~~~
(-2 -- 2).surfacePlot { :x :y |
	let z = x * (0 - (x ^ 2) - (y ^ 2)).exp;
	[x, y, z + 1]
}
~~~

![](sw/spl/Help/Image/surfacePlot-A.svg)

~~~
(-5 -- 5).surfacePlot { :x :y |
	let z = x.sin + y.cos;
	[x, y, z / 6 + 3]
}
~~~

![](sw/spl/Help/Image/surfacePlot-B.svg)

~~~
(-10 -- 10).surfacePlot { :x :y |
	let r = ((x ^ 2) + (y ^ 2)).sqrt;
	let q = r + 1E-9;
	let z = q.sin / q;
	[x, y, z + 6]
}
~~~

![](sw/spl/Help/Image/surfacePlot-C.svg)

~~~
(-5 -- 5).surfacePlot { :x :y |
	let z = (y * x.sin) - (x * y.cos);
	[x, y, z / 6 + 3]
}
~~~

![](sw/spl/Help/Image/surfacePlot-D.svg)

~~~
(-2 -- 2).surfacePlot { :x :y |
	let n = (x ^ 2) + (y ^ 2);
	n * (0 - n).exp * 3 + 9
}
~~~

![](sw/spl/Help/Image/surfacePlot-E.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, LineDrawing, linePlot, matrixPlot, parametricPlot, scatterPlot

References:
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/surf.html)

Categories: Plotting
