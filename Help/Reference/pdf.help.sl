# pdf

- _pdf(d, x)_

Answer the probability density function for the distribution _d_ evaluated at _x_.

`pdf` of _x_ gives the probability that an observed value will be _x_.

Plot `pdf` for a standard normal distribution:

~~~
let d = NormalDistribution(0, 1);
(-5 -- 5).functionPlot { :x |
	d.pdf(x)
}
~~~

![](sw/spl/Help/Image/pdf-A.svg)

* * *

See also: cdf

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ProbabilityDensityFunction.html)
[1](https://reference.wolfram.com/language/ref/PDF.html),
_W_
[1](https://en.wikipedia.org/wiki/Probability_density_function)

Categories: Random
