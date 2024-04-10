# LinearCongruential

- _LinearCongruential(anInteger)_

Answer a pseudo random number generator seeded with _anInteger_.

`LinearCongruential` implements `Random` and `Stream`:

```
>>> let rng = LinearCongruential(12345);
>>> (rng.isLinearCongruential, rng.isRandom, rng.isStream)
(true, true, true)
```

The first three random numbers given the seed _12345_:

```
>>> LinearCongruential(12345).next(3)
[0.15776 0.86476 0.89335]
```

Plot 99 random floating point numbers between `zero` and `one`:

~~~
LinearCongruential(98765).next(99).plot
~~~

* * *

See also: Mersenne, Random, Sfc32, SplitMix, Stream

Further Reading: Thomson (1958)

Categories: Random
