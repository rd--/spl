# LaggedFibonacci

- _LaggedFibonacci(s, r, k, m=2^64)_

Implement an additive lagged Fibonacci pseudo-random number generator.

```
>>> LaggedFibonacci(273, 607, 42)
>>> .next(7)
[
	0.67501070516724
	0.48303471972594
	0.05002333992113
	0.96195732093044
	0.06461019385786
	0.16505659424259
	0.23597716870810
]
```

Scatter plot of two-hundred and fifty terms:

~~~spl svg=A
LaggedFibonacci(273, 607, 42)
.next(250)
.scatterPlot
~~~

![](Help/Image/LaggedFibonacci-A.svg)

Difference between empirical and expected mean and standard deviation:

```
>>> let r = LaggedFibonacci(273, 607, 42);
>>> let n = r.next(10 ^ 4);
>>> (
>>> 	0.5 - n.mean,
>>> 	1/12.sqrt - n.standardDeviation
>>> )
(-0.0031561, 0.0008324)
```

* * *

See also: LinearCongruential, RandomNumberGenerator, Stream

Guides: Random Number Generators

References:
_W_
[1](https://en.wikipedia.org/wiki/Lagged_Fibonacci_generator)
