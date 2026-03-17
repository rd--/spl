# perlinGainFunction

- _perlinGainFunction(b)_

Answer Perlin’s gain function for modelling a smooth and monotonic curve-shaped over _(0, 1)_.

Plot with various gain parameters:

~~~spl svg=A
(0 -- 1).functionPlot(
	[0.1 0.2 0.3 0.7 0.9].collect { :g |
		g.perlinGainFunction
	}
)
~~~

![](Help/Image/perlinGainFunction-A.svg)

* * *

See also: perlinBiasFunction, schlickGainFunction

Guides: Sigmoid Functions

Further Reading: Perlin 1989
