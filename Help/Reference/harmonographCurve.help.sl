# harmonographCurve

- _harmonographCurve(f, p, a, d)_

Implement the parametric equation for a Harmonograph,
_f_ specifies frequency,
_p_ phase,
_a_ amplitude,
and _d_ damping (as a percentage).
Each parameter must be a list of four, two or one places.

With frequency ratio one half,
the Lemniscate of Gerono:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	harmonographCurve(
		[1 2], [1/2.pi 0], [1], [0]
	)
)
~~~

![](sw/spl/Help/Image/harmonographCurve-A.svg)

With frequency ratio three quarters,
the Lincoln Laboratory:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	harmonographCurve(
		[3 4], [1/2.pi 0], [1], [0]
	)
)
~~~

![](sw/spl/Help/Image/harmonographCurve-B.svg)

The Lincoln Laboratory curve with _d=1%_ and domain _0-8π_:

~~~spl svg=C
(0 -- 8.pi).functionPlot(
	400,
	harmonographCurve(
		[3 4], [1/2.pi 0], [1], [1]
	)
)
~~~

![](sw/spl/Help/Image/harmonographCurve-C.svg)

* * *

See also: lissajousCurve, hypotrochoid, sin

Guides: Curve Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Harmonograph)
