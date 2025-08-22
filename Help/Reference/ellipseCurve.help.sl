# ellipseCurve

- _ellipseCurve(r, θ)_

Answer the parametric equation for the ellipse with radii _r_ and rotation θ.
The radii _a,b_ specify the semi-major axis and semi-minor axis respectively.

Plot three ellipses, including a circle:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	[1 1; 1 1.5; 1.5 1].collect { :r |
		ellipseCurve(r, 0)
	}
)
~~~

![](sw/spl/Help/Image/ellipseCurve-A.svg)

Plot an ellipse through four rotatations:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	[0, 0.25, 0.5, 0.75].pi.collect { :theta |
		ellipseCurve([1 1.pi], theta)
	}
)
~~~

![](sw/spl/Help/Image/ellipseCurve-B.svg)

* * *

See also: Ellipse

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Ellipse.html),
_W_
[1](https://en.wikipedia.org/wiki/Ellipse)
