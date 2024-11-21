# Permutation

A `Type` holding a permutation.

To construct a permutation use `asPermutation` or `cycles`.

Identity permutation predicate:

```
>>> let p = [].cycles;
>>> p.isIdentity
true
```

When comparing permutations, the degree is not considered:

```
>>> let p = [1 2 3; 4].cycles;
>>> let q = [1 2 3; 4; 5].cycles;
>>> p = q
true
```

A `Permutation` applied to a single point using `image`:

```
>>> let p = [1 3 2; 4 5].cycles;
>>> p.image(3)
2
```

Points not present in the cycles are mapped onto themselves:

```
>>> let p = [1 3 2; 4 5].cycles;
>>> p.image(7)
7
```

Apply identity permutation:

```
>>> let p = [].cycles;
>>> p.apply([1 3 2 5 4])
[1 3 2 5 4]
```

Apply a permutation:

```
>>> let p = [1 3 2; 4; 5].cycles;
>>> p.apply([1 2 3 4 5])
[2 3 1 4 5]
```

Answer the `max` of a permuation,
i.e. the maximum entry in any cycle:

```
>>> let p = [1 4 3; 2 5];
>>> p.cycles.max
5
```

The `max` of a `Permutation` is the `max` of the `support`:

```
>>> let p = [1 4 3; 2 5].cycles;
>>> (p.max, p.support.max)
(5, 5)
```

The identity permutation has `max` zero:

```
>>> [].cycles.max
0
```

Answer inverse permutation:

```
>>> [1 4 3; 2 5].cycles.inverse
[1 3 4; 2 5].cycles
```

Answer permutation list:

```
>>> [1 4 2; 3].cycles.list
[4 1 3 2]
```

Permutation list as permutation:

```
>>> [4 5 1 3 2].asPermutation
[1 4 3; 2 5].cycles
```

Permutation cycles as permutation list:

```
>>> let p = [1 4 3; 2 5].cycles;
>>> p.list
[4 5 1 3 2]
```

Answer permutation matrix:

```
>>> let p = [1 4 2; 3].cycles;
>>> p.matrix
[
	0 0 0 1;
	1 0 0 0;
	0 0 1 0;
	0 1 0 0
]
```

Product of two permutations:

```
>>> let p = [1 2 3; 4].cycles;
>>> let q = [1; 2 3; 4].cycles;
>>> p * q
[1 3; 2; 4].cycles
```

Multiplication of permutations is not commutative:

```
>>> let p = [1 2 3; 4].cycles;
>>> let q = [1; 2 3; 4].cycles;
>>> q * p
[1 2; 3; 4].cycles

>>> let p = [2 1 3].asPermutation;
>>> let q = [3 1 2].asPermutation;
>>> ((p * q).list, (q * p).list)
([1 3 2], [3 2 1])
```

For clarity there are the methods `leftActionProduct`:

```
>>> let p = [2 1 3].asPermutation;
>>> let q = [3 1 2].asPermutation;
>>> p.leftActionProduct(q).list
[3 2 1]
```

and `rightActionProduct`:

```
>>> let p = [2 1 3].asPermutation;
>>> let q = [3 1 2].asPermutation;
>>> p.rightActionProduct(q).list
[1 3 2]
```

The inversions of a permutation:

```
>>> let p = [3,2,4,1,5].asPermutation;
>>> p.inversions
[1 2; 1 4; 2 4; 3 4]
```

The `runs` of a permutation, c.f. `orderedSubstrings`:

```
>>> [2 4 1 3].asPermutation.runs
[2 4; 1 3]

>>> [6 1 7 3 4 5 2].asPermutation.runs
[6; 1 7; 3 4 5; 2]

>>> [1 2 3 4].asPermutation.runs
[[1 2 3 4]]

>>> [4 3 2 1].asPermutation.runs
[4; 3; 2; 1]

>>> [1].asPermutation.runs
[[1]]
```

The `decreasingRuns`:

```
>>> [2,8,3,9,6,4,5,1,7].asPermutation.decreasingRuns
[2; 8 3; 9 6 4; 5 1; 7]
```

The runs of two random permutations:

```
>>> let p = Sfc32(12345).randomPermutationList(13, 2);
>>> (p, p.collect(runs:/1))
(
	[
		[1 2 3; 4 5 8 7 9; 6 12; 11 13].cycles,
		[1 7 10 11; 2 8 3; 4 12 9 13 5 6].cycles
	],
	[
		[2 3; 1 5 8 12; 9; 7; 4 10 13; 6 11],
		[7 8; 2 12; 6; 4 10; 3 13; 11; 1 9; 5]
	]
)
```

`dictionary` answers a `Map` form of a permutation:

```
>>> [2 1 3].asPermutation.dictionary
[1 -> 2, 2 -> 1, 3 -> 3].asMap

>>> [1 2 5 3 7; 4; 6].cycles.dictionary
[1 -> 2, 2 -> 5, 3 -> 7, 4 -> 4, 5 -> 3, 6 -> 6, 7 -> 1].asMap
```

Cauchy’s two-line notation lists the elements of S in the first row,
and the image of each element below it in the second row.

```
>>> [1 2 6; 3 5].cycles.twoLineNotation
[
	1 2 3 4 5 6;
	2 6 5 4 3 1
]

>>> [1 2 5 3 7; 4; 6].cycles.twoLineNotation
[
	1 2 3 4 5 6 7;
	2 5 7 4 3 6 1
]
```

The `^` operator answers a permutation raised to an integer power:

```
>>> let p = [1 4 5 6 2 3].asPermutation;
>>> p * p
[1; 2 6 5 4 3].cycles
```

The `rank` of a permutation is its zero-based index into the lexicographic ordering of the symmetric group to which it belongs:

```
>>> [1 2 4 6 3 5].asPermutation.rank
10
```

The rank of the identity permutation is in all cases zero:

```
>>> [1; 2; 3; 4; 5; 6].cycles.rank
0
```

Answer the indices of the peaks of a permutation:

```
>>> [1 3 2 4 5].asPermutation.peaks
[2]

>>> [4 1 3 2 6 5].asPermutation.peaks
[3 5]

>>> [].asPermutation.peaks
[]
```

The permutation that maps a sequence to its sort is equal to `reducedPermutation`:

```
>>> let l = [4 2 7];
>>> l.findPermutation(l.sorted)
[1 2; 3].cycles

>>> [4 2 5].reducedPermutation
[2 1 3]
```

A _descent_ of a permutation _p_ is an integer _i_ such that _p(i) > p(i + 1)_:

```
>>> [3 1 2].asPermutation.descents
[1]

>>> [1 4 3 2].asPermutation.descents
[2 3]

>>> [4 3 2 1].asPermutation.descents
[1 2 3]
```

An _ascent_ is the inverse of a descent:

```
>>> [3 1 2].asPermutation.ascents
[2]

>>> [1 4 3 2].asPermutation.ascents
[1]

>>> [4 3 2 1].asPermutation.ascents
[]

>>> [1 2 3 4].asPermutation.ascents
[1 2 3]
```

The sum of the `descents` is called the `majorIndex`:

```
>>> [2 1 3].asPermutation.majorIndex
1

>>> [3 4 1 2].asPermutation.majorIndex
2

>>> [4 3 2 1].asPermutation.majorIndex
6

>>> [4 6 2 5 1 3].asPermutation.majorIndex
6
```

* * *

See also: inversePermutation, permutationCycle, permutationList, permutationProduct, permutationPower, permute

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Permutation.html)

Categories: Permutations, Type
