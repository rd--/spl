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
[0 4.pi; 2E-2 2].surfacePlot(
	dinisSurface(1, 0.2)
)
~~~

![](sw/spl/Help/Image/surfacePlot-G.svg)

A pseudosphere:

~~~spl svg=H
[-2 2; 0 2.pi].surfacePlot(pseudosphere:/2)
~~~

![](sw/spl/Help/Image/surfacePlot-H.svg)

A one-dimensional potential energy equation plotted as the parameter λ is varied:

~~~spl svg=I
[0 4; -2.5 2.5].surfacePlot { :lambda :x |
	let a = 0.25 * (x ^ 4);
	let c = ((2 * lambda) - 4) * x;
	a - (x ^ 2) - c + 9
}
~~~

![](sw/spl/Help/Image/surfacePlot-I.svg)

Plot Möbius strip:

~~~spl svg=J
[0 2.pi; -1 1].surfacePlot(
	moebiusStrip(0.35)
)
~~~

![](sw/spl/Help/Image/surfacePlot-J.svg)

Plot one half of Plücker’s conoid:

~~~spl svg=K
[0 1.pi; 0 1].surfacePlot(
	pleuckersConoid(2)
)
~~~

![](sw/spl/Help/Image/surfacePlot-K.svg)

Plot a double cone:

~~~spl svg=L
[0 2.pi; -1 1].surfacePlot { :theta :h |
	let x = h * theta.cos;
	let y = h * theta.sin;
	let z = h;
	[x y z]
}
~~~

![](sw/spl/Help/Image/surfacePlot-L.svg)

Plot a torus:

~~~spl svg=M
let f:/2 = torus(2.5);
(0 -- 2.pi).surfacePlot { :u :v |
	let [x, y, z] = f(u, v);
	[x, z, y]
)
~~~

![](sw/spl/Help/Image/surfacePlot-M.svg)

Plot a catenoid:

~~~spl svg=N
(-1.pi -- 1.pi).surfacePlot(
	catenoid(2.5)
)
~~~

![](sw/spl/Help/Image/surfacePlot-N.svg)

Plot a helicoid:

~~~spl svg=O
[-1.pi 1.pi; -1 1].surfacePlot(
	helicoid(1)
)
~~~

![](sw/spl/Help/Image/surfacePlot-O.svg)

Plot a hyperbolic helicoid:

~~~spl svg=P
[-1.pi 1.pi; -1 1].surfacePlot(
	hyperbolicHelicoid(2)
)
~~~

![](sw/spl/Help/Image/surfacePlot-P.svg)

Plot an umbilic torus:

~~~spl svg=Q
(-1.pi -- 1.pi).surfacePlot { :u :v |
	let [x, y, z] = umbilicTorus(u, v);
	[x, z, y]
}
~~~

![](sw/spl/Help/Image/surfacePlot-Q.svg)

Plot a hyperbolic paraboloid:

~~~spl svg=R
[0 1; -1.pi 1.pi].surfacePlot { :u :v |
	[u, v, u * v]
}
~~~

![](sw/spl/Help/Image/surfacePlot-R.svg)

Plot a maxima parabaloid:

~~~spl svg=S
(-3 -- 3).surfacePlot { :x :y |
	[x * 1.5, y, 4 - (x.square + y.square)]
}
~~~

![](sw/spl/Help/Image/surfacePlot-S.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, LineDrawing, linePlot, matrixPlot, meshGrid, parametricPlot, scatterPlot

Guides: Plotting Functions, Surface Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DinisSurface.html)
[2](https://mathworld.wolfram.com/Pseudosphere.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/surf.html),
_W_
[1](https://en.wikipedia.org/wiki/Surface_plot_(mathematics))
[2](https://en.wikipedia.org/wiki/Ruled_surface)

Categories: Plotting
