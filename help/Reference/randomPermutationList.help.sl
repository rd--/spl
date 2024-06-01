# randomPermutationList

- _randomPermutationList(anInteger, count, aRandomNumberGenerator)_

Answer a `List` of _count_ pseudo-random permutations of the integers from `one` to _anInteger_.

Two random permutation in the symmetric group _S10_:

```
>>> let rng = Sfc32(13579);
>>> 10.randomPermutationList(2, rng)
[
	[1 7 8; 3 9 5 4; 6 10].cycles,
	[1 5 8 9 4; 2 7; 3 6].cycles
]
```

* * *

See also: cycles, randomPermutation, randomSample

Categories: Permutations
