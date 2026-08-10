# logarithmicMean

- _logarithmicMean(x, y)_

The logarithmic mean is a function of two non-negative numbers,
equal to the difference divided by the logarithm of the quotient.
It is larger than the geometric mean and smaller than the arithmetic mean.

Plot where _x=1_, comparing with arithmetic and geometric means:

~~~spl svg=A
(1 -- 100).functionPlot(
	[
		{ :y |
			[1 y].arithmeticMean
		},
		{ :y |
			1.logarithmicMean(y)
		},
		{ :y |
			[1 y].geometricMean
		}
	]
)
~~~

![](Help/Image/logarithmicMean-A.svg)

* * *

See also: arithmeticMean, geometricMean, stolarskyMean

References:
_W_
[1](https://en.wikipedia.org/wiki/Logarithmic_mean)
