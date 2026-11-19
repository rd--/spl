# fromBipolarCoordinates

- _fromBipolarCoordinates(a, [σ τ])_

Answer the _(x,y)_ Cartesian coordinates corresponding to the bipolar coordinates _(σ,τ)_,
where σ is in _[0,2π)_ and τ is in _(-∞,∞)_.
_a_ is a multiplier for _(x,y)_.

A curve with constant τ in bipolar coordinates,
is a circle in cartesian coordinates:

~~~spl svg=A
(0.0 -- 2.pi).functionPlot { :sigma |
	fromBipolarCoordinates(1.0, [sigma, 1.0])
}
~~~

![](Help/Image/fromBipolarCoordinates-A.svg)

A curve with constant σ in bipolar coordinates,
is a circle in cartesian coordinates,
note spacing of coordinates:

~~~spl svg=B
(-7.0 -- 7.0).subdivide(100L).collect { :tau |
	fromBipolarCoordinates(1.0, [1.0, tau])
}.PointSet
~~~

![](Help/Image/fromBipolarCoordinates-B.svg)

Plot varying τ:

~~~spl svg=C
(0.0 -- 2.pi).functionPlot(
	[0.5, 0.75 .. 2.0].collect { :tau |
		{ :sigma |
			fromBipolarCoordinates(
				1.0,
				[sigma, tau]
			)
		}
	}
)
~~~

![](Help/Image/fromBipolarCoordinates-C.svg)

Plot varying σ:

~~~spl svg=D
[0.75, 1.0 .. 2.5].collect { :sigma |
	(-5.0 -- 5.0).subdivide(100L).collect { :tau |
		fromBipolarCoordinates(
			1.0,
			[sigma, tau]
		)
	}.PointSet
}
~~~

![](Help/Image/fromBipolarCoordinates-D.svg)

Draw Apollonian circles:

~~~spl svg=E
let k = 50L;
let n = 4L;
let c = { :x |
	fromBipolarCoordinates(1.0, x)
};
let sigmaCircles = { :i |
	i.subdivide(n).collect { :sigma |
		(-10.0 -- 10.0).subdivide(
			k * 3L
		).collect { :tau |
			c([sigma, tau])
		}
	}
};
let tauCircles = { :i |
	i.subdivide(n).collect { :tau |
		(-1.pi -- 1.pi).subdivide(
			k
		).collect { :sigma |
			c([sigma, tau])
		}
	}
};
[
	sigmaCircles(0.5 -- 0.5.pi),
	sigmaCircles(-0.5.pi -- -0.5),
	tauCircles(0.5 -- 2.0),
	tauCircles(-2.0 -- -0.5)
].catenate.linePlot
~~~

![](Help/Image/fromBipolarCoordinates-E.svg)

* * *

See also: fromPolarCoordinates

Guides: Coordinate System Functions, Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BipolarCoordinates.html),
_W_
[1](https://en.wikipedia.org/wiki/Bipolar_coordinates)
[2](https://en.wikipedia.org/wiki/Apollonian_circles)
