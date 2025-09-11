# lateralHarmonographCurve

- _lateralHarmonographCurve([f p a d])_

Implement the parametric equation for a lateral Harmonograph,
_f_ specifies frequency,
_p_ phase,
_a_ amplitude,
and _d_ damping (as a percentage).

The ratio _1:1_ draws a straight line or an ellipse or a circle,
depending on the initial phase difference:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	[0 1/4 1/2 3/4 1].pi.collect { :p |
		lateralHarmonographCurve(
			[1 p 1 0]
		)
	}
)
~~~

![](sw/spl/Help/Image/lateralHarmonographCurve-A.svg)

The ratio _2:1_:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	[0 1/4 1/2 3/4 1].pi.collect { :p |
		lateralHarmonographCurve(
			[2 p 1 0]
		)
	}
)
~~~

![](sw/spl/Help/Image/lateralHarmonographCurve-B.svg)

The ratio _3:2_:

~~~spl svg=C
(0 -- 4.pi).functionPlot(
	[0 1/4].pi.collect { :p |
		lateralHarmonographCurve(
			[1.5 p 1 0]
		)
	}
)
~~~

![](sw/spl/Help/Image/lateralHarmonographCurve-C.svg)

A near unison, with damping:

~~~spl svg=D
(0 -- 64.pi).functionPlot(
	800,
	lateralHarmonographCurve(
		[1.035 1 1 0.35]
	)
)
~~~

![](sw/spl/Help/Image/lateralHarmonographCurve-D.svg)

A near octave, with damping:

~~~spl svg=E
(0 -- 64.pi).functionPlot(
	800,
	lateralHarmonographCurve(
		[0.50135 1 1 0.5]
	)
)
~~~

![](sw/spl/Help/Image/lateralHarmonographCurve-E.svg)

A whole tone:

~~~spl svg=F
(0 -- 16.pi).functionPlot(
	800,
	lateralHarmonographCurve(
		[9/8 0 1 0]
	)
)
~~~

![](sw/spl/Help/Image/lateralHarmonographCurve-F.svg)

* * *

See also: lissajousCurve, hypotrochoid, sin

Guides: Curve Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Harmonograph)

Further Reading: Ashton 2003
