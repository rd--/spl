# randomCycle

- _randomCycle(r k)_

Answer a pseudo-random single cycle permutation of the integers from `one` to the integer _k_,
using Sattolo’s algorithm.

A random single cycle permutation of the symmetric group _S10_:

```
>>> let r = Sfc32(12345);
>>> let p = r.randomCycle(10);
>>> let [c] = p.cycles;
>>> (p, c)
(
	Permutation[3 1 5 10 9 2 6 7 4 8],
	[1 3 5 9 4 10 8 7 6 2]
)
```

* * *

See also: cycles, randomPermutation, randomSample, sattoloShuffle

Guides: Permutation Functions, Random Number Functions

References:
_Julia_
[1](https://docs.julialang.org/en/v1/stdlib/Random/#Random.randcycle),
