# seedRandom

- _seedRandom(r, s)_

Resets the pseudo-random number generator _r_ using _s_ as a seed.

Use `seedRandom` to make random numbers repeatable:

```
>>> system.seedRandom(2166136261);
>>> system.nextRandomFloat
0.12549
```

The seed can be a `String`:

```
>>> system.seedRandom('seedString');
>>> system.nextRandomFloat
0.72733
```

* * *

See also: hash, randomChoice, randomComplex, randomInteger, randomPrime, randomReal, randomSample, randomSubsequence, randomVariate

Guides: Random Number Generators

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SeedRandom.html)

Categories: Random
