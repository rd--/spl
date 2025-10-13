# ellipseCurve

- _ellipseCurve([x y], [r₁ r₂], θ)_

Answer the parametric equation for the ellipse centered at _x,y_ with radii _r₁,r₂_ and rotation θ.
The radii specify the semi-major axis and semi-minor axis respectively.
The domain is _(0,2π)_.

The function is circular,
the answer outside of _(0,2π)_ is as expected:

```
>>> [-1 -1/2 0 1/2 1 3/2 2 5/2].pi
>>> .collect(
>>> 	ellipseCurve([0 0], [1 1], 0)
>>> )
[-1 0; 0 -1; 1 0; 0 1; -1 0; 0 -1; 1 0; 0 1]
```

Plot three ellipses, including a circle:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	[1 1; 1 1.5; 1.5 1].collect { :r |
		ellipseCurve([0 0], r, 0)
	}
)
~~~

![](sw/spl/Help/Image/ellipseCurve-A.svg)

Plot an ellipse through four rotatations:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	[0, 0.25, 0.5, 0.75].pi.collect { :theta |
		ellipseCurve([0 0], [1 1.pi], theta)
	}
)
~~~

![](sw/spl/Help/Image/ellipseCurve-B.svg)

Draw equidistant points:

~~~spl svg=C
(0 -- 2.pi).discretize(
	75,
	ellipseCurve([0 0], [1 1.75], -1/4.pi)
).PointCloud
~~~

![](sw/spl/Help/Image/ellipseCurve-C.svg)

Plot ¾ of a circular ellipse beginning at ¼:

~~~spl svg=D
(1/4.pi -- 7/4.pi).discretize(
	35,
	ellipseCurve([0 0], [1 1], 0)
).PointCloud
~~~

![](sw/spl/Help/Image/ellipseCurve-D.svg)

* * *

See also: circleCurve, Ellipse

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Ellipse.html),
_W_
[1](https://en.wikipedia.org/wiki/Ellipse)
