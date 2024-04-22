# SplitMix

- _SplitMix(anInteger)_

Answer a pseudo random number generator seeded with _anInteger_.

`SplitMix` implements `Random` and `Stream`:

```
>>> let rng = SplitMix(12345);
>>> (rng.isSplitMix, rng.isRandom, rng.isStream)
(true, true, true)
```

The first three random numbers given the seed _12345_:

```
>>> SplitMix(12345).next(3)
[0.68734 0.78585 0.06825]
```

Plot 99 random floating point numbers between `zero` and `one`:

~~~
SplitMix(98765).next(99).plot
~~~

* * *

See also: LinearCongruential, Mersenne, Random, Sfc32, Stream

Further Reading: Steele 2014

Categories: Random
