# randomSubsequence

- _randomSubsequence(aSequence, aNumber, aRandomNumberGenerator)_
- _randomSubsequence(alpha, beta)_ => _randomSubsequence(alpha, beta, system)_

Answer a sequence consisting of a random subsequence of _aSequence_,
where each element is included (in order) with independent probability _aNumber_.
This process is known as _Bernoulli sampling_.
The binary form uses the system wide random number generator.

```
>>> let r = Sfc32(79431);
>>> 1:23.randomSubsequence(0.3, r)
[6 7 10 14 16 17]
```

* * *

See also: randomChoice, randomCycle, randomPermutation, randomSample

References:
_Julia_
[1](https://docs.julialang.org/en/v1/stdlib/Random/#Random.randsubseq),
_W_
[1](https://en.wikipedia.org/wiki/Bernoulli_sampling)
