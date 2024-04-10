# Mersenne

- _Mersenne(anInteger)_

Answer a pseudo random number generator seeded with _anInteger_.
Implements the _Mt19937_ algorithm, part of the _PractRand_ test suite.

`Mersenne` implements `Random` and `Stream`:

```
>>> let rng = Mersenne(12345);
>>> (rng.isMersenne, rng.isRandom, rng.isStream)
(true, true, true)
```

The first three random numbers given the seed _12345_:

```
>>> Mersenne(12345).next(3)
[0.92962 0.31638 0.18392]
```

Plot 99 random floating point numbers between `zero` and `one`:

~~~
Mersenne(98765).next(99).plot
~~~

* * *

See also: LinearCongruential, Random, Sfc32, SplitMix, Stream

References:
_PractRand_
[1](https://pracrand.sourceforge.net/RNG_engines.txt)

Categories: Random
