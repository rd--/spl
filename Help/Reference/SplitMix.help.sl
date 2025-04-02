# SplitMix

- _SplitMix(anInteger)_

Answer a pseudo random number generator seeded with _anInteger_.

`SplitMix` implements `RandomNumberGenerator` and `Stream`:

```
>>> let rng = SplitMix(12345);
>>> (
>>> 	rng.isSplitMix,
>>> 	rng.isRandomNumberGenerator,
>>> 	rng.isStream
>>> )
(true, true, true)
```

The first three random numbers given the seed _12345_:

```
>>> SplitMix(12345).next(3)
[0.68734 0.78585 0.06825]
```

Plot 99 random floating point numbers between `zero` and `one`:

~~~spl svg=A
SplitMix(98765).next(99).linePlot
~~~

![](sw/spl/Help/Image/SplitMix-A.svg)

Plot histogram:

~~~spl svg=B
SplitMix(387912)
.next(10 ^ 4)
.histogramPlot
~~~

![](sw/spl/Help/Image/SplitMix-B.svg)

Difference between empirical and expected mean and standard deviation:

```
>>> let r = SplitMix(387912);
>>> let n = r.next(10 ^ 4);
>>> (0.5 - n.mean, 1/12.sqrt - n.standardDeviation)
(-0.0019250, -0.0011305)
```

* * *

See also: LinearCongruential, MersenneTwister, RandomNumberGenerator, Sfc32, Stream

Further Reading: Steele 2014

Categories: Random
