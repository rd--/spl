# schlickBiasFunction

- _schlickBiasFunction(b)_

Answer Schlick’s bias function for modelling a smooth and monotonic curve-shaped over _(0, 1)_.

Plot with various bias parameters:

~~~spl svg=A
(0 -- 1).functionPlot(
	[0.1 0.2 0.3 0.7 0.9].collect { :b |
		b.schlickBiasFunction
	}
)
~~~

![](sw/spl/Help/Image/schlickBiasFunction-A.svg)

* * *

See also: perlinBiasFunction, schlickGainFunction

Further Reading: Schlick 1994
