# harmonographCurve

- _harmonographCurve(f, p, a, d)_

Implement the parametric equation for a general Harmonograph,
_f_ specifies frequency,
_p_ phase,
_a_ amplitude,
and _d_ damping (as a percentage).
Each parameter is a four-vector,
defining the two _x_ and two _y_ pendulum in sequence.
Ordinarily this is method is utilised indirectly,
courtesy `lateralHarmonographCurve` or `rotaryHarmonographCurve`.

With frequency ratio one half,
the Lemniscate of Gerono:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	harmonographCurve(
		[1 0 2 0],
		[1/2.pi 0 0 0],
		[1 0 1 0],
		[0 0 0 0]
	)
)
~~~

![](sw/spl/Help/Image/harmonographCurve-A.svg)

With frequency ratio three quarters,
the Lincoln Laboratory:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	harmonographCurve(
		[3 0 4 0],
		[1/2.pi 0 0 0],
		[1 0 1 0],
		[0 0 0 0]
	)
)
~~~

![](sw/spl/Help/Image/harmonographCurve-B.svg)

The Lincoln Laboratory curve with _d=1%_ and domain _0-8π_:

~~~spl svg=C
(0 -- 8.pi).functionPlot(
	400,
	harmonographCurve(
		[3 0 4 0],
		[1/2.pi 0 0 0],
		[1 0 1 0],
		[1 0 1 0]
	)
)
~~~

![](sw/spl/Help/Image/harmonographCurve-C.svg)

Specifying all four parameters allows for distinct ratios at _x_ and _y_:

~~~spl svg=D
(0 -- 54.pi).functionPlot(
	800,
	harmonographCurve(
		[1      1      1.0125 1.9875],
		[0      0      0      0     ],
		[1      1      1      1     ],
		[0      1      0      1     ]
	)
)
~~~

![](sw/spl/Help/Image/harmonographCurve-D.svg)

A near octave:

~~~spl svg=D
(0 -- 48.pi).functionPlot(
	800,
	harmonographCurve(
		[1 0 2.0125 0],
		[0 0 0 0],
		[1 0 1 0],
		[0.25 0 1 0]
	)
)
~~~

![](sw/spl/Help/Image/harmonographCurve-E.svg)

Near octaves:

~~~spl svg=F
(0 -- 48.pi).functionPlot(
	800,
	harmonographCurve(
		[1      2.050 1    2.025],
		[1/2.pi  0     1.pi  0    ],
		[1      1     1    1    ],
		[0.5    0.5   0.25 0.25 ]
	)
)
~~~

![](sw/spl/Help/Image/harmonographCurve-F.svg)

* * *

See also: lateralHarmonographCurve, CurvelissajousCurve, hypotrochoid, rotaryHarmonographCurve, sin

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Harmonograph.html),
_W_
[1](https://en.wikipedia.org/wiki/Harmonograph)

Further Reading: Ashton 2003
