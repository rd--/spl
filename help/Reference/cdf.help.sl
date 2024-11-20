# cdf

- _cdf(d, x)_

Answer the cumulative distribution function for the distribution _d_ evaluated at _x_.

`cdf` of _x_ gives the probability that an observed value will be less than or equal to _x_.

Plot `cdf` for a standard normal distribution:

~~~
let d = NormalDistribution(0, 1);
(-3 -- 3).functionPlot { :x | d.cdf(x) }
~~~

* * *

See also: pdf

Categories: Random
