# Sfc32

- _Sfc32(anInteger)_

Answer a pseudo random number generator seeded with _anInteger_.
Sfc stands for _Small Fast Counter_,
the algorithm is part of the _PractRand_ test suite, which it passes.

`Sfc32` implements `RandomNumberGenerator` and `Stream`:

```
>>> let rng = Sfc32(12345);
>>> (
>>> 	rng.isSfc32,
>>> 	rng.isRandomNumberGenerator,
>>> 	rng.isStream
>>> )
(true, true, true)
```

The first three random numbers given the seed _12345_,
_next(k)_ answers next _k_ items:

```
>>> Sfc32(12345).next(3)
[0.8011 0.4735 0.9835]
```

Use `reset` to return to the initial state:

```
>>> let r = Sfc32(98765);
>>> let l = r.next(3);
>>> r.reset;
>>> (l, r.next(3))
(
	[0.4956 0.40961 0.18187],
	[0.4956 0.40961 0.18187]
)
```

Plot 99 random floating point numbers between `zero` and `one`:

~~~spl svg=A
Sfc32(98765).next(99).linePlot
~~~

![](sw/spl/Help/Image/Sfc32-A.svg)

Plot histogram:

~~~spl svg=B
Sfc32(387912)
.next(10 ^ 4)
.histogramPlot
~~~

![](sw/spl/Help/Image/Sfc32-B.svg)

Difference between empirical and expected mean and standard deviation:

```
>>> let r = Sfc32(387912);
>>> let n = r.next(10 ^ 4);
>>> (
>>> 	0.5 - n.mean,
>>> 	1/12.sqrt - n.standardDeviation
>>> )
(0.0022756, 0.0011151)
```

* * *

See also: LinearCongruential, MersenneTwister, RandomNumberGenerator, SplitMix, Stream

Guides: Random Number Generators

References:
_PractRand_
[1](https://pracrand.sourceforge.net/RNG_engines.txt)

Categories: Random
