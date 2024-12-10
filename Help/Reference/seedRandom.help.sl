# seedRandom

- _seedRandom(anInteger | aString)_

Resets the system-wide pseudo-random number generator, using _anInteger_ as a seed.

Use `seedRandom` to make random numbers repeatable:

```
>>> 2166136261.seedRandom;
>>> system.nextRandomFloat
0.12549
```

The seed can be a `String`:

```
>>> 'seedString'.seedRandom;
>>> system.nextRandomFloat
0.72733
```

* * *

See also: hash, randomChoice, randomComplex, randomInteger, randomPrime, randomReal, randomSample, randomSubsequence, randomVariate

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SeedRandom.html)

Categories: Random
