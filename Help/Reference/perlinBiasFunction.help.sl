# perlinBiasFunction

- _perlinBiasFunction(b)_

Answer Perlin’s bias function for modelling a smooth and monotonic curve-shaped over _(0, 1)_.

Plot with various bias parameters:

~~~spl svg=A
(0 -- 1).functionPlot(
	[0.1 0.2 0.3 0.7 0.9].collect { :b |
		b.perlinBiasFunction
	}
)
~~~

![](sw/spl/Help/Image/perlinBiasFunction-A.svg)

* * *

See also: perlinGainFunction, schlickBiasFunction

Further Reading: Perlin 1989
