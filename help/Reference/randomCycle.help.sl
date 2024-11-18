# randomCycle

- _randomCycle(anInteger, aRandomNumberGenerator)_

Answer a pseudo-random single cycle permutation of the integers from `one` to _anInteger_,
using Sattolo’s algorithm.

A random single cycle permutation of the symmetric group _S10_:

```
>>> let r = Sfc32(12345);
>>> let c = [1 3 5 9 4 10 8 7 6 2];
>>> r.randomCycle(10)
[c].cycles
```

* * *

See also: cycles, randomPermutation, randomSample, sattoloShuffle

References:
_Julia_
[1](https://docs.julialang.org/en/v1/stdlib/Random/#Random.randcycle),

Categories: Random, Permutation
