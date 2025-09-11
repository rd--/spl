# rotaryHarmonographCurve

- _rotaryHarmonographCurve([f p a d])_

Implement the parametric equation for a rotary Harmonograph,
_f_ specifies frequency,
_p_ phase,
_a_ amplitude,
and _d_ damping (as a percentage).

The ratio _1:1_ draws a circle,
the radius depending on the initial phase difference:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	[0 1/2 3/4].pi.collect { :p |
		rotaryHarmonographCurve(
			[1 p 1 0]
		)
	}
)
~~~

![](sw/spl/Help/Image/rotaryHarmonographCurve-A.svg)

The ratio _2:1_:

~~~spl svg=B
(0 -- 2.pi).discretize(
	100,
	rotaryHarmonographCurve(
		[2 0 1 0]
	)
).Line
~~~

![](sw/spl/Help/Image/rotaryHarmonographCurve-B.svg)

The ratio _-2:1_:

~~~spl svg=C
(0 -- 2.pi).discretize(
	100,
	rotaryHarmonographCurve(
		[-2 0 1 0]
	)
).Line
~~~

![](sw/spl/Help/Image/rotaryHarmonographCurve-C.svg)

The ratio _3:2_:

~~~spl svg=D
(0 -- 4.pi).discretize(
	100,
	rotaryHarmonographCurve(
		[3/2 0 1 0]
	)
).Line
~~~

![](sw/spl/Help/Image/rotaryHarmonographCurve-D.svg)

The ratio _-3:2_:

~~~spl svg=E
(0 -- 4.pi).discretize(
	100,
	rotaryHarmonographCurve(
		[-3/2 0 1 0]
	)
).Line
~~~

![](sw/spl/Help/Image/rotaryHarmonographCurve-E.svg)

A near unison:

~~~spl svg=F
(0 -- 32.pi).discretize(
	400,
	rotaryHarmonographCurve(
		[1.05 0 1 0]
	)
).Line
~~~

![](sw/spl/Help/Image/rotaryHarmonographCurve-F.svg)

A near octave, with damping:

~~~spl svg=G
(0 -- 64.pi).discretize(
	800,
	rotaryHarmonographCurve(
		[0.505 2/3.pi 1 0.15]
	)
).Line
~~~

![](sw/spl/Help/Image/rotaryHarmonographCurve-G.svg)

A near negated octave, with damping:

~~~spl svg=H
(0 -- 64.pi).discretize(
	800,
	rotaryHarmonographCurve(
		[-0.505 2/3.pi 1 0.05]
	)
).Line
~~~

![](sw/spl/Help/Image/rotaryHarmonographCurve-H.svg)

A near fifth, negated:

~~~spl svg=I
(0 -- 64.pi).discretize(
	800,
	rotaryHarmonographCurve(
		[-1.515 0 1 0.35]
	)
).Line
~~~

![](sw/spl/Help/Image/rotaryHarmonographCurve-I.svg)

A minor sixth:

~~~spl svg=J
(0 -- 12.pi).discretize(
	800,
	rotaryHarmonographCurve(
		[8/5 0 1 0]
	)
).Line
~~~

![](sw/spl/Help/Image/rotaryHarmonographCurve-J.svg)

* * *

See also: harmonographCurve, lateralHarmonographCurve, lissajousCurve, hypotrochoid, sin

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Harmonograph.html),
_W_
[1](https://en.wikipedia.org/wiki/Harmonograph)

Further Reading: Ashton 2003
