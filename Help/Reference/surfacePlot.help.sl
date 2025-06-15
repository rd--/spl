# surfacePlot

- _surfacePlot(i, n, f:/2)_
- _surfacePlot([u v], [uₙ vₙ], f:/2)_
- _surfacePlot(m)_

Make a drawing of a three-dimensional surface.

In the ternary case the _x_ and _y_ domains can be specified equally as _i_,
or separately as _u_ and _v_,
and likewise the divisions as _n_ or _uₙ_ and _vₙ_.
The divisions may be elided in which case they are set automatically.
The `Block` _f_ answers the _z_ value at each _x,y_ place.

In the unary case,
if _m_ is an _m×n_ array,
the entries are taken as _z_ values and the indices are taken as _x_ and _y_ values.

If _m_ is an _m×n×3_ array,
the entries are taken to be _x,y,z_ triples.

In each case the plot is made as a ruled surface over the specified places.

At `Interval`, which is implicitly discretized by `surfacePlot`:

~~~spl svg=A
(-2 -- 2).surfacePlot { :x :y |
	let z = x * (0 - (x ^ 2) - (y ^ 2)).exp;
	[x, y, z * 7]
}
~~~

![](sw/spl/Help/Image/surfacePlot-A.svg)

A `sin` and `cos` plot with dampened _z_:

~~~spl svg=B
(-4 -- 4).surfacePlot { :x :y |
	let z = x.sin + y.cos;
	[x, y, z * 4]
}
~~~

![](sw/spl/Help/Image/surfacePlot-B.svg)

A `sin` plot:

~~~spl svg=C
(-7 -- 7).surfacePlot { :x :y |
	let r = ((x ^ 2) + (y ^ 2)).sqrt;
	let q = r + 1E-9;
	let z = q.sin / q;
	[x, y, z * 17]
}
~~~

![](sw/spl/Help/Image/surfacePlot-C.svg)

A `sin` and `cos` plot with dampened _z_:

~~~spl svg=D
(-3 -- 3).surfacePlot { :x :y |
	let z = (y * x.sin) - (x * y.cos);
	[x, y, z]
}
~~~

![](sw/spl/Help/Image/surfacePlot-D.svg)

A height plot:

~~~spl svg=E
(-2 -- 2).surfacePlot { :x :y |
	let n = (x ^ 2) + (y ^ 2);
	n * (0 - n).exp * 47
}
~~~

![](sw/spl/Help/Image/surfacePlot-E.svg)

A dilated half sphere:

~~~spl svg=F
(-0.5 -- 0.5).surfacePlot { :u :v |
	let theta = 2.pi * u;
	let phi = v.pi;
	[
		theta.cos * phi.sin,
		theta.sin * phi.sin,
		phi.cos * 7
	]
}
~~~

![](sw/spl/Help/Image/surfacePlot-F.svg)

Dini’s surface:

~~~spl svg=G
let a = 1;
let b = 0.2;
[0 4.pi; 2E-2 2].surfacePlot { :u :v |
	let i = v.cos + (0.5 * v).tan.log;
	[
		a * u.cos * v.sin,
		a * u.sin * v.sin,
		(a * i) + (b * u)
	]
}
~~~

![](sw/spl/Help/Image/surfacePlot-G.svg)

A pseudosphere:

~~~spl svg=H
[-2 2; 0 2.pi].surfacePlot { :u :v |
	let i = v.cos + (0.5 * v).tan.log;
	[
		u.secanth * v.cos,
		u.secanth * v.sin,
		u - u.tanh
	]
}
~~~

![](sw/spl/Help/Image/surfacePlot-H.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, LineDrawing, linePlot, matrixPlot, meshGrid, parametricPlot, scatterPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DinisSurface.html)
[2](https://mathworld.wolfram.com/Pseudosphere.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/surf.html)

Categories: Plotting
