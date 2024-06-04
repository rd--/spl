# randomPermutation

- _randomPermutation(r, n)_

Answer a pseudo-random permutation of the integers from `one` to _n_,
using the random number generator _r_.

A random permutation in the symmetric group _S10_:

```
>>> Sfc32(47123).randomPermutation(10)
[1 7 5 3 6; 2 4 10; 8 9].cycles
```

* * *

See also: cycles, fisherYatesShuffle, randomCycle, randomPermutationList, randomSample, shuffle, shuffled

References:
_Julia_
[1](https://docs.julialang.org/en/v1/stdlib/Random/#Random.randperm),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomPermutation.html),
_Mathworks_
[1](https://www.mathworks.com/help/matlab/ref/randperm.html)
