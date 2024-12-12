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

The first three random numbers given the seed _12345_:

```
>>> Sfc32(12345).next(3)
[0.8011 0.4735 0.9835]
```

Plot 99 random floating point numbers between `zero` and `one`:

~~~spl svg=A
Sfc32(98765).next(99).linePlot
~~~

![](sw/spl/Help/Image/Sfc32-A.svg)

* * *

See also: LinearCongruential, MersenneTwister, RandomNumberGenerator, SplitMix, Stream

References:
_PractRand_
[1](https://pracrand.sourceforge.net/RNG_engines.txt)

Categories: Random
