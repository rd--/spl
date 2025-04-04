# barronCurve

- _barronCurve(s, t)_

Answer the Barron curve, a generalisation of the `schlickBiasFunction` and `schlickGainFunction`.

Plot curve reproducing Schlick’s gain function, varying _s_:

~~~spl svg=A
(0 -- 1).functionPlot(
	[1/64 1/8 1 8 64].collect { :s |
		barronCurve(s, 0.5)
	}
)
~~~

![](sw/spl/Help/Image/barronCurve-A.svg)

Plot curve reproducing Schlick’s bias function, varying _s_:

~~~spl svg=B
(0 -- 1).functionPlot(
	[1/64 1/8 1 8 64].collect { :s |
		barronCurve(s, 0)
	}
)
~~~

![](sw/spl/Help/Image/barronCurve-B.svg)

* * *

See also: schlickBiasFunction, schlickGainFunction

Guides: Sigmoid Functions

Further Reading: Barron 2000
