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
>>> Permutation[1 3 2; 4 5]
>>> .list
[3 1 2 5 4]
```

A permutation in one-line (permutation list) notation:

```
>>> Permutation[3 1 2 5 4]
>>> .cycles
[1 3 2; 4 5]
```

Identity permutation predicate:

```
>>> Permutation[].isIdentity
true
```

When comparing permutations, the degree is not considered:

```
>>> let p = Permutation[1 2 3; 4];
>>> let q = Permutation[1 2 3; 4; 5];
>>> p = q
true
```

A `Permutation` applied to a single point using `image`:

```
>>> Permutation[1 3 2; 4 5]
>>> .image(3)
2
```

Points not present in the permutation are mapped onto themselves:

```
>>> Permutation[1 3 2; 4 5]
>>> .image(7)
7
```

Apply identity permutation:

```
>>> Permutation[]
>>> .apply([1 3 2 5 4])
[1 3 2 5 4]
```

Apply a permutation:

```
>>> Permutation[1 3 2; 4; 5]
>>> .apply([1 2 3 4 5])
[2 3 1 4 5]
```

Answer the `max` of a permuation,
i.e. the maximum entry in any cycle:

```
>>> Permutation[1 4 3; 2 5]
>>> .max
5
```

The `max` of a `Permutation` is the `max` of the `support`:

```
>>> let p = Permutation[1 4 3; 2 5];
>>> (p.max, p.support.max)
(5, 5)
```

The identity permutation has `max` zero:

```
>>> Permutation[].max
0
```

`inverse` answers the inverse permutation:

```
>>> Permutation[1 4 3; 2 5]
>>> .inverse
Permutation[1 3 4; 2 5]
```

`list` answers the permutation list:

```
>>> Permutation[1 4 2; 3]
>>> .list
[4 1 3 2]
```

Permutation list as permutation:

```
>>> Permutation[4 5 1 3 2]
>>> .cycles
[1 4 3; 2 5]
```

Permutation cycles as permutation list:

```
>>> Permutation[1 4 3; 2 5]
>>> .list
[4 5 1 3 2]
```

`matrix` answers the permutation matrix:

```
>>> Permutation[1 4 2; 3]
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
>>> let p = Permutation[1 2 3; 4];
>>> let q = Permutation[1; 2 3; 4];
>>> p * q
Permutation[1 3; 2; 4]
```

Multiplication of permutations is not commutative:

```
>>> let p = Permutation[1 2 3; 4];
>>> let q = Permutation[1; 2 3; 4];
>>> q * p
Permutation[1 2; 3; 4]

>>> let p = Permutation[2 1 3];
>>> let q = Permutation[3 1 2];
>>> ((p * q).list, (q * p).list)
([1 3 2], [3 2 1])
```

For clarity there are the methods `leftActionProduct`:

```
>>> let p = Permutation[2 1 3];
>>> let q = Permutation[3 1 2];
>>> p.leftActionProduct(q).list
[3 2 1]
```

and `rightActionProduct`:

```
>>> let p = Permutation[2 1 3];
>>> let q = Permutation[3 1 2];
>>> p.rightActionProduct(q).list
[1 3 2]
```

The inversions of a permutation:

```
>>> Permutation[3 2 4 1 5]
>>> .inversions
[1 2; 1 4; 2 4; 3 4]
```

The `runs` of a permutation, c.f. `orderedSubstrings`:

```
>>> Permutation[2 4 1 3]
>>> .runs
[2 4; 1 3]

>>> Permutation[6 1 7 3 4 5 2]
>>> .runs
[6; 1 7; 3 4 5; 2]

>>> Permutation[1 2 3 4]
>>> .runs
[[1 2 3 4]]

>>> Permutation[4 3 2 1]
>>> .runs
[4; 3; 2; 1]

>>> Permutation[1]
>>> .runs
[[1]]
```

The `decreasingRuns`:

```
>>> Permutation[2 8 3 9 6 4 5 1 7]
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
		Permutation[
			1 2 3;
			4 5 8 7 9;
			6 12;
			11 13
		],
		Permutation[
			1 7 10 11;
			2 8 3;
			4 12 9 13 5 6
		]
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
>>> Permutation[2 1 3]
>>> .dictionary
Map[1 -> 2, 2 -> 1, 3 -> 3]

>>> Permutation[1 2 5 3 7; 4; 6]
>>> .dictionary
Map[
	1 -> 2,
	2 -> 5,
	3 -> 7,
	4 -> 4,
	5 -> 3,
	6 -> 6,
	7 -> 1
]
```

Cauchy’s two-line notation lists the elements of S in the first row,
and the image of each element below it in the second row.

```
>>> Permutation[1 2 6; 3 5]
>>> .twoLineNotation
[
	1 2 3 4 5 6;
	2 6 5 4 3 1
]

>>> Permutation[1 2 5 3 7; 4; 6]
>>> .twoLineNotation
[
	1 2 3 4 5 6 7;
	2 5 7 4 3 6 1
]
```

The `^` operator answers a permutation raised to an integer power:

```
>>> Permutation[1 4 5 6 2 3] ^ 2
Permutation[1; 2 6 5 4 3]
```

The `rank` of a permutation is its zero-based index into the lexicographic ordering of the symmetric group to which it belongs:

```
>>> Permutation[1 2 4 6 3 5]
>>> .rank
10
```

The rank of the identity permutation is in all cases zero:

```
>>> Permutation[1; 2; 3; 4; 5; 6]
>>> .rank
0
```

Answer the indices of the peaks of a permutation:

```
>>> Permutation[1 3 2 4 5]
>>> .peaks
[2]

>>> Permutation[4 1 3 2 6 5]
>>> .peaks
[3 5]

>>> Permutation[]
>>> .peaks
[]
```

The permutation that maps a sequence to its sort is equal to `reducedPermutation`:

```
>>> let l = [4 2 7];
>>> l.findPermutation(l.sorted)
Permutation[1 2; 3]

>>> [4 2 5].reducedPermutation
[2 1 3]
```

A _descent_ of a permutation _p_ is an integer _i_ such that _p(i) > p(i + 1)_:

```
>>> Permutation[3 1 2]
>>> .descents
[1]

>>> Permutation[1 4 3 2]
>>> .descents
[2 3]

>>> Permutation[4 3 2 1]
>>> .descents
[1 2 3]
```

An _ascent_ is the inverse of a descent:

```
>>> Permutation[3 1 2]
>>> .ascents
[2]

>>> Permutation[1 4 3 2]
>>> .ascents
[1]

>>> Permutation[4 3 2 1]
>>> .ascents
[]

>>> Permutation[1 2 3 4]
>>> .ascents
[1 2 3]
```

The sum of the `descents` is called the `majorIndex`:

```
>>> Permutation[2 1 3]
>>> .majorIndex
1

>>> Permutation[3 4 1 2]
>>> .majorIndex
2

>>> Permutation[4 3 2 1]
>>> .majorIndex
6

>>> Permutation[4 6 2 5 1 3]
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
