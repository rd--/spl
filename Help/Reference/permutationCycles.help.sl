# permutationCycles

- _permutationCycles(p)_

Answer a disjoint cycle representation of the permutation _p_.

Cyclic form of a permutation list of length 3:

```
>>> [3 2 1].permutationCycles
[[1 3]]
```

Permutation with two three-cycles:

```
>>> [4 1 5 2 6 3].permutationCycles
[1 4 2; 3 5 6]
```

Permutation with three two-cycles:

```
>>> [6 4 5 2 3 1].permutationCycles
[1 6; 2 4; 3 5]
```

Cyclic form of a permutation list of length 10:

```
>>> [2 5 3 6 1 8 7 9 4 10]
>>> .permutationCycles
[1 2 5; 4 6 8 9]
```

Identity permutation list, written with unary cycles:

```
>>> [1 .. 5]
>>> .permutationListToPermutationCycles(false)
[1; 2; 3; 4; 5]
```

When applied to a `Permutation` object the answer has unary cycles removed:

```
>>> let p = [1 .. 5].asPermutation;
>>> p.permutationCycles
[]
```

The cyclic form of a permutation list of length 6:

```
>>> [6 3 2 5 4 1].permutationCycles
[1 6; 2 3; 4 5]
```

Permutation cycles with unary cycles deleted can be considered a sparse representation of permutation lists:

```
>>> let l = [
>>> 	02 03 01 04 05 06 07 08 09 10
>>> 	12 11 13 14 15 16 17 18 19 20
>>> ];
>>> l.permutationCycles
[1 2 3; 11 12]
```

A histogram of the cycle count for the permutations of the symmetric group _S6_:

```
>>> let p = [1 .. 6].permutations;
>>> let k = p.collect { :each |
>>> 	each
>>> 	.permutationListToPermutationCycles(
>>> 		false
>>> 	)
>>> 	.size
>>> };
>>> k.asIdentityMultiset.sortedElements
[
	1 -> 120,
	2 -> 274,
	3 -> 225,
	4 -> 85,
	5 -> 15,
	6 -> 1
]
```

* * *

See also: isPermutationCycles, isPermutationList, permutationList, permutationMatrix

Guides: Permutation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationCycles.html)

Categories: Permutations
