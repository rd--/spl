# raisedCosinePulse

- _raisedCosinePulse(α)_

Answer a `Block` that will generate the impulse response of a raised-cosine filter with parameter _α_.

Plot raised cosine impulse response at three values of α:

~~~spl svg=A
(-5 -- 5).functionPlot(
	[0.25 0.5 0.75].collect { :alpha |
		raisedCosinePulse(alpha)
	}
)
~~~

![](sw/spl/Help/Image/raisedCosinePulse-A.svg)

* * *

See also: cos, cosineWindow, hannWindow, sincNormalized

Guides: Window Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Raised-cosine_filter)
