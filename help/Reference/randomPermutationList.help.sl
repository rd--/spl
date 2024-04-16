# randomPermutationList

- _randomPermutationList(anInteger, count, aRandom)_

Answer a `List` of _count_ pseudo-random permutations of the integers from `one` to _anInteger_.

Two random permutation in the symmetric group _S10_:

```
>>> let rng = Sfc32(13579);
>>> 10.randomPermutationList(2, rng)
[
	[1 6 7 9 3; 2 5 10 8 4].cycles,
	[1 5 4 3 8; 2 9 6 7; 10].cycles
]
```

* * *

See also: cycles, randomPermutation, randomSample

Categories: Permutations
