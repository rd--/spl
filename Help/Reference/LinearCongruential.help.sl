# LinearCongruential

- _LinearCongruential(anInteger)_

Answer a pseudo random number generator seeded with _anInteger_.

`LinearCongruential` implements `RandomNumberGenerator` and `Stream`:

```
>>> let rng = LinearCongruential(12345);
>>> (
>>> 	rng.isLinearCongruential,
>>> 	rng.isRandomNumberGenerator,
>>> 	rng.isStream
>>> )
(true, true, true)
```

The first three random numbers given the seed _12345_:

```
>>> LinearCongruential(12345).next(3)
[0.15776 0.86476 0.89335]
```

Plot random floating point numbers between `zero` and `one`:

~~~spl svg=A
LinearCongruential(98765)
.next(99)
.linePlot
~~~

![](sw/spl/Help/Image/LinearCongruential-A.svg)

Plot histogram:

~~~spl svg=B
LinearCongruential(387912)
.next(10 ^ 4)
.histogramPlot
~~~

![](sw/spl/Help/Image/LinearCongruential-B.svg)

Difference between empirical and expected mean and standard deviation:

```
>>> let r = LinearCongruential(387912);
>>> let n = r.next(10 ^ 4);
>>> (
>>> 	0.5 - n.mean,
>>> 	1/12.sqrt - n.standardDeviation
>>> )
(-0.002115, -0.002121)
```

* * *

See also: MersenneTwister, RandomNumberGenerator, Sfc32, SplitMix, Stream

Guides: Random Number Generators

References:
_W_
[1](https://en.wikipedia.org/wiki/Linear_congruential_generator)

Further Reading: Thomson 1958

Categories: Random
