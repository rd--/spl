# ellipseCurve

- _ellipseCurve([x y], [r₁ r₂], θ)_

Answer the parametric equation for the ellipse centered at _x,y_ with radii _r₁,r₂_ and rotation θ.
The radii specify the semi-major axis and semi-minor axis respectively.

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

* * *

See also: circleCurve, Ellipse

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Ellipse.html),
_W_
[1](https://en.wikipedia.org/wiki/Ellipse)
