# schlickGainFunction

- _schlickGainFunction(b)_

Answer Schlick’s gain function for modeling smooth and monotonic curve-shaped over _(0, 1)_.

Plot with various gain parameters:

~~~spl svg=A
(0 -- 1).functionPlot(
	[0.1 0.2 0.3 0.7 0.9].collect { :g |
		g.schlickGainFunction
	}
)
~~~

![](sw/spl/Help/Image/schlickGainFunction-A.svg)

* * *

See also: perlinGainFunction, schlickBiasFunction

Guides: Sigmoid Functions

Further Reading: Schlick 1994
