# fromBipolarCoordinates

- _fromBipolarCoordinates(a, [σ τ])_

Answer the _(x, y)_ Cartesian coordinates corresponding to the bipolar coordinates _(σ, τ)_,
where σ is in _[0,2π)_ and τ is in _(-∞,∞)_.

A curve with constant τ in bipolar coordinates,
is a circle in cartesian coordinates:

~~~spl svg=A
(0 -- 2.pi).functionPlot { :sigma |
	fromBipolarCoordinates(1, [sigma, 1])
}
~~~

![](sw/spl/Help/Image/fromBipolarCoordinates-A.svg)

A curve with constant σ in bipolar coordinates,
is a circle in cartesian coordinates,
note spacing of coordinates:

~~~spl svg=B
(-7 -- 7).subdivide(100).collect { :tau |
	fromBipolarCoordinates(1, [1, tau])
}.PointCloud
~~~

![](sw/spl/Help/Image/fromBipolarCoordinates-B.svg)

Plot varying τ:

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	[0.5, 0.75 .. 2].collect { :tau |
		{ :sigma |
			fromBipolarCoordinates(
				1,
				[sigma, tau]
			)
		}
	}
)
~~~

![](sw/spl/Help/Image/fromBipolarCoordinates-C.svg)

Plot varying σ:

~~~spl svg=D
[0.75, 1 .. 2.5].collect { :sigma |
	(-5 -- 5).subdivide(100).collect { :tau |
		fromBipolarCoordinates(
			1,
			[sigma, tau]
		)
	}.PointCloud
}.LineDrawing
~~~

![](sw/spl/Help/Image/fromBipolarCoordinates-D.svg)

Draw Apollonian circles:

~~~spl svg=E
let k = 50;
let n = 4;
let c = { :x |
	fromBipolarCoordinates(1, x)
};
let r = { :i :j |
	i.subdivide(j)
};
let sigmaCircles = { :i |
	i.r(n).collect { :sigma |
		(-10 -- 10).r(k * 3).collect { :tau |
			c([sigma, tau])
		}
	}
};
let tauCircles = { :i |
	i.r(n).collect { :tau |
		(-1.pi -- 1.pi).r(k).collect { :sigma |
			c([sigma, tau])
		}
	}
};
[
	sigmaCircles(0.5 -- 0.5.pi),
	sigmaCircles(-0.5.pi -- -0.5),
	tauCircles(0.5 -- 2),
	tauCircles(-2 -- -0.5)
].catenate.linePlot
~~~

![](sw/spl/Help/Image/fromBipolarCoordinates-E.svg)

* * *

See also: fromPolarCoordinates

Guides: Coordinate System Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BipolarCoordinates.html),
_W_
[1](https://en.wikipedia.org/wiki/Bipolar_coordinates)
[2](https://en.wikipedia.org/wiki/Apollonian_circles)

Categories: Converting, Geometry
