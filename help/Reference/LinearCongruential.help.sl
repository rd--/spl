# LinearCongruential

- _LinearCongruential(anInteger)_

Answer a pseudo random number generator seeded with _anInteger_.

`LinearCongruential` implements `RandomNumberGenerator` and `Stream`:

```
>>> let rng = LinearCongruential(12345);
>>> (rng.isLinearCongruential, rng.isRandomNumberGenerator, rng.isStream)
(true, true, true)
```

The first three random numbers given the seed _12345_:

```
>>> LinearCongruential(12345).next(3)
[0.15776 0.86476 0.89335]
```

Plot random floating point numbers between `zero` and `one`:

~~~
LinearCongruential(98765).next(99).linePlot
~~~

* * *

See also: MersenneTwister, RandomNumberGenerator, Sfc32, SplitMix, Stream

Further Reading: Thomson 1958

Categories: Random
