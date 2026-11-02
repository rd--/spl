# randomPermutationList

- _randomPermutationList(r, n, ⍴)_

Answer a `List` of _⍴_ pseudo-random permutation lists of the integers from `one` to _n_,
drawn from the random number generator _r_.

A random permutation in the symmetric group _S16_:

```
>>> Sfc32(890142)
>>> .randomPermutationList(16)
[6 5 15 11 7 16 2 10 4 1 12 8 9 13 3 14]
```

Two random permutation in the symmetric group _S10_:

```
>>> Sfc32(13579)
>>> .randomPermutationList(10, [2])
[
	[
		1 7 8;
		3 9 5 4;
		6 10
	].permutationList(10),
	[
		1 5 8 9 4;
		2 7;
		3 6
	].permutationList(10)
]
```

* * *

See also: cycles, randomPermutation, randomSample

Guides: Permutation Functions, Random Number Functions
