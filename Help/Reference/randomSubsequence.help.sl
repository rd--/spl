# randomSubsequence

- _randomSubsequence(r, u, p)_

Answer a sequence consisting of a random subsequence of the sequence _u_,
where each element is included (in order) with independent probability _p_ in _(0,1)_.
This process is known as _Bernoulli sampling_.
The random numbers required are drawn from the random number generator _r_.

```
>>> Sfc32(79431)
>>> .randomSubsequence(1:23, 0.3)
[6 7 10 14 16 17]
```

With _p=1_ selects all of the input sequence:

```
>>> Sfc32(381412)
>>> .randomSubsequence(1:23, 1)
[1 .. 23]
```


With _p=0_ selects none of the input sequence:

```
>>> Sfc32(381412)
>>> .randomSubsequence(1:23, 0)
[]
```

* * *

See also: randomChoice, randomCycle, randomPermutation, randomSample

Guides: Random Functions

References:
_Julia_
[1](https://docs.julialang.org/en/v1/stdlib/Random/#Random.randsubseq),
_W_
[1](https://en.wikipedia.org/wiki/Bernoulli_sampling)

Categories: Random
