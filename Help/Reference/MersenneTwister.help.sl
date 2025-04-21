# MersenneTwister

- _MersenneTwister(anInteger)_

Answer a pseudo random number generator seeded with _anInteger_.
Implements the _Mt19937_ algorithm, part of the _PractRand_ test suite.

`MersenneTwister` implements `RandomNumberGenerator` and `Stream`:

```
>>> let rng = MersenneTwister(12345);
>>> (
>>> 	rng.isMersenneTwister,
>>> 	rng.isRandomNumberGenerator,
>>> 	rng.isStream
>>> )
(true, true, true)
```

The first three random numbers given the seed _12345_:

```
>>> MersenneTwister(12345).next(3)
[0.92962 0.31638 0.18392]
```

Plot 99 random floating point numbers between `zero` and `one`:

~~~spl svg=A
MersenneTwister(98765).next(99).linePlot
~~~

![](sw/spl/Help/Image/MersenneTwister-A.svg)

Plot histogram:

~~~spl svg=B
MersenneTwister(387912)
.next(10 ^ 4)
.histogramPlot
~~~

![](sw/spl/Help/Image/MersenneTwister-B.svg)

Difference between empirical and expected mean and standard deviation:

```
>>> let r = MersenneTwister(387912);
>>> let n = r.next(10 ^ 4);
>>> (
>>> 	0.5 - n.mean,
>>> 	1/12.sqrt - n.standardDeviation
>>> )
(-0.0028843, 0.0004717)
```

* * *

See also: LinearCongruential, RandomNumberGenerator, Sfc32, SplitMix, Stream

Guides: Random Number Generators

References:
_PractRand_
[1](https://pracrand.sourceforge.net/RNG_engines.txt),
_W_
[1](https://en.wikipedia.org/wiki/Mersenne_Twister)

Further Reading: Matsumoto 1998

Categories: Random
