# MersenneTwister

- _MersenneTwister(anInteger)_

Answer a pseudo random number generator seeded with _anInteger_.
Implements the _Mt19937_ algorithm, part of the _PractRand_ test suite.

`MersenneTwister` implements `RandomNumberGenerator` and `Stream`:

```
>>> let rng = MersenneTwister(12345);
>>> (rng.isMersenneTwister, rng.isRandomNumberGenerator, rng.isStream)
(true, true, true)
```

The first three random numbers given the seed _12345_:

```
>>> MersenneTwister(12345).next(3)
[0.92962 0.31638 0.18392]
```

Plot 99 random floating point numbers between `zero` and `one`:

~~~
MersenneTwister(98765).next(99).plot
~~~

* * *

See also: LinearCongruential, RandomNumberGenerator, Sfc32, SplitMix, Stream

References:
_PractRand_
[1](https://pracrand.sourceforge.net/RNG_engines.txt),
_W_
[1](https://en.wikipedia.org/wiki/Mersenne_Twister)

Further Reading: Matsumoto 1998

Categories: Random
