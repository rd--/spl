# Permutation

- _Permutation(x)_

`Permutation` is a `Type` holding a permutation.

A permutation may be specified using either of two allowed notations,
_one-line_ notation (also called permutation list notation),
and _cyclic notation_.

The two notations do not overlap,
the predicates `isPermutationCycles` and `isPermutationList`
decide if a sequence is valid as one or the other notation,
or as neither.

A permutation in cyclic notation:

```
>>> Permutation([1 3 2; 4 5])
>>> .list
[3 1 2 5 4]
```

A permutation in one-line (permutation list) notation:

```
>>> Permutation([3 1 2 5 4])
>>> .cycles
[1 3 2; 4 5]
```

Identity permutation predicate:

```
>>> let p = Permutation([]);
>>> p.isIdentity
true
```

When comparing permutations, the degree is not considered:

```
>>> let p = [1 2 3; 4].Permutation;
>>> let q = [1 2 3; 4; 5].Permutation;
>>> p = q
true
```

A `Permutation` applied to a single point using `image`:

```
>>> let p = [1 3 2; 4 5].Permutation;
>>> p.image(3)
2
```

Points not present in the permutation are mapped onto themselves:

```
>>> let p = [1 3 2; 4 5].Permutation;
>>> p.image(7)
7
```

Apply identity permutation:

```
>>> let p = [].Permutation;
>>> p.apply([1 3 2 5 4])
[1 3 2 5 4]
```

Apply a permutation:

```
>>> let p = [1 3 2; 4; 5].Permutation;
>>> p.apply([1 2 3 4 5])
[2 3 1 4 5]
```

Answer the `max` of a permuation,
i.e. the maximum entry in any cycle:

```
>>> let p = [1 4 3; 2 5];
>>> p.Permutation.max
5
```

The `max` of a `Permutation` is the `max` of the `support`:

```
>>> let p = [1 4 3; 2 5].Permutation;
>>> (p.max, p.support.max)
(5, 5)
```

The identity permutation has `max` zero:

```
>>> [].Permutation.max
0
```

`inverse` answers the inverse permutation:

```
>>> [1 4 3; 2 5].Permutation.inverse
[1 3 4; 2 5].Permutation
```

`list` answers the permutation list:

```
>>> [1 4 2; 3].Permutation.list
[4 1 3 2]
```

Permutation list as permutation:

```
>>> Permutation([4 5 1 3 2])
>>> .cycles
[1 4 3; 2 5]
```

Permutation cycles as permutation list:

```
>>> [1 4 3; 2 5].Permutation.list
[4 5 1 3 2]
```

`matrrix` answers the permutation matrix:

```
>>> [1 4 2; 3].Permutation
>>> .matrix
[
	0 0 0 1;
	1 0 0 0;
	0 0 1 0;
	0 1 0 0
]
```

Product of two permutations:

```
>>> let p = [1 2 3; 4].Permutation;
>>> let q = [1; 2 3; 4].Permutation;
>>> p * q
[1 3; 2; 4].Permutation
```

Multiplication of permutations is not commutative:

```
>>> let p = [1 2 3; 4].Permutation;
>>> let q = [1; 2 3; 4].Permutation;
>>> q * p
[1 2; 3; 4].Permutation

>>> let p = Permutation([2 1 3]);
>>> let q = Permutation([3 1 2]);
>>> ((p * q).list, (q * p).list)
([1 3 2], [3 2 1])
```

For clarity there are the methods `leftActionProduct`:

```
>>> let p = [2 1 3].Permutation;
>>> let q = [3 1 2].Permutation;
>>> p.leftActionProduct(q).list
[3 2 1]
```

and `rightActionProduct`:

```
>>> let p = [2 1 3].Permutation;
>>> let q = [3 1 2].Permutation;
>>> p.rightActionProduct(q).list
[1 3 2]
```

The inversions of a permutation:

```
>>> [3 2 4 1 5].Permutation
>>> .inversions
[1 2; 1 4; 2 4; 3 4]
```

The `runs` of a permutation, c.f. `orderedSubstrings`:

```
>>> [2 4 1 3].Permutation.runs
[2 4; 1 3]

>>> [6 1 7 3 4 5 2].Permutation.runs
[6; 1 7; 3 4 5; 2]

>>> [1 2 3 4].Permutation.runs
[[1 2 3 4]]

>>> [4 3 2 1].Permutation.runs
[4; 3; 2; 1]

>>> [1].Permutation.runs
[[1]]
```

The `decreasingRuns`:

```
>>> [2 8 3 9 6 4 5 1 7]
>>> .Permutation
>>> .decreasingRuns
[2; 8 3; 9 6 4; 5 1; 7]
```

The runs of two random permutations:

```
>>> let r = Sfc32(12345);
>>> let p = r.randomPermutation(13, [2]);
>>> (p, p.collect(runs:/1))
(
	[
		[
			1 2 3;
			4 5 8 7 9;
			6 12;
			11 13
		].Permutation,
		[
			1 7 10 11;
			2 8 3;
			4 12 9 13 5 6
		].Permutation
	],
	[
		[
			2 3;
			1 5 8 12;
			9;
			7;
			4 10 13;
			6 11
		],
		[
			7 8;
			2 12;
			6;
			4 10;
			3 13;
			11;
			1 9;
			5
		]
	]
)
```

`dictionary` answers a `Map` form of a permutation:

```
>>> [2 1 3].Permutation
>>> .dictionary
[1: 2, 2: 1, 3: 3]

>>> [1 2 5 3 7; 4; 6].Permutation
>>> .dictionary
[
	1: 2,
	2: 5,
	3: 7,
	4: 4,
	5: 3,
	6: 6,
	7: 1
]
```

Cauchy’s two-line notation lists the elements of S in the first row,
and the image of each element below it in the second row.

```
>>> [1 2 6; 3 5].Permutation
>>> .twoLineNotation
[
	1 2 3 4 5 6;
	2 6 5 4 3 1
]

>>> [1 2 5 3 7; 4; 6].Permutation
>>> .twoLineNotation
[
	1 2 3 4 5 6 7;
	2 5 7 4 3 6 1
]
```

The `^` operator answers a permutation raised to an integer power:

```
>>> [1 4 5 6 2 3].Permutation ^ 2
[1; 2 6 5 4 3].Permutation
```

The `rank` of a permutation is its zero-based index into the lexicographic ordering of the symmetric group to which it belongs:

```
>>> [1 2 4 6 3 5].Permutation.rank
10
```

The rank of the identity permutation is in all cases zero:

```
>>> [1; 2; 3; 4; 5; 6].Permutation.rank
0
```

Answer the indices of the peaks of a permutation:

```
>>> [1 3 2 4 5].Permutation.peaks
[2]

>>> [4 1 3 2 6 5].Permutation.peaks
[3 5]

>>> [].Permutation.peaks
[]
```

The permutation that maps a sequence to its sort is equal to `reducedPermutation`:

```
>>> let l = [4 2 7];
>>> l.findPermutation(l.sorted)
[1 2; 3].Permutation

>>> [4 2 5].reducedPermutation
[2 1 3]
```

A _descent_ of a permutation _p_ is an integer _i_ such that _p(i) > p(i + 1)_:

```
>>> [3 1 2].Permutation.descents
[1]

>>> [1 4 3 2].Permutation.descents
[2 3]

>>> [4 3 2 1].Permutation.descents
[1 2 3]
```

An _ascent_ is the inverse of a descent:

```
>>> [3 1 2].Permutation.ascents
[2]

>>> [1 4 3 2].Permutation.ascents
[1]

>>> [4 3 2 1].Permutation.ascents
[]

>>> [1 2 3 4].Permutation.ascents
[1 2 3]
```

The sum of the `descents` is called the `majorIndex`:

```
>>> [2 1 3].Permutation
>>> .majorIndex
1

>>> [3 4 1 2].Permutation
>>> .majorIndex
2

>>> [4 3 2 1].Permutation
>>> .majorIndex
6

>>> [4 6 2 5 1 3].Permutation
>>> .majorIndex
6
```

* * *

See also: inversePermutation, permutationCycle, permutationList, permutationProduct, permutationPower, permute

Guides: Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Permutation.html),
_W_
[1](https://en.wikipedia.org/wiki/Permutation)

Categories: Permutations, Type
