# randomPermutation

- _randomPermutation(anInteger, aRandom)_

Answer a pseudorandom permutation of the integers from `one` to _anInteger_.

Two random permutation in the symmetric group _S10_:

```
>>> let rng = Sfc32(13579);
>>> 10.randomPermutation(2, rng)
[
	[1 6 7 9 3; 2 5 10 8 4].cycles,
	[1 5 4 3 8; 2 9 6 7].cycles
]
```

* * *

See also: cycles, randomSample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomPermutation.html)
