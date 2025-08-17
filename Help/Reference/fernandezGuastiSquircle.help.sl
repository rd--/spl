# fernandezGuastiSquircle

- _fernandezGuastiSquircle(r, s)_

Answer a Fernández-Guasti squircle curve with radius _r_ and squareness _s_.

At _s=0_, a circle:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	fernandezGuastiSquircle(1, 0)
)
~~~

![](sw/spl/Help/Image/fernandezGuastiSquircle-A.svg)


At _s=1_, a square:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	fernandezGuastiSquircle(1, 1)
)
~~~

![](sw/spl/Help/Image/fernandezGuastiSquircle-B.svg)


At _s=0.928_, a squircle:

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	fernandezGuastiSquircle(1, 0.928)
)
~~~

![](sw/spl/Help/Image/fernandezGuastiSquircle-C.svg)

Varying _s_, note non-linearity:

~~~spl svg=D
(0 -- 2.pi).functionPlot(
	[0 0.5 0.75 0.825 0.95 1].collect { :s |
		fernandezGuastiSquircle(1, s)
	}
)
~~~

![](sw/spl/Help/Image/fernandezGuastiSquircle-D.svg)

* * *

See also: superellipseCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Squircle.html),
_W_
[1](https://en.wikipedia.org/wiki/Squircle)
