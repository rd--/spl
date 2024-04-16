# Permutation

A `Type` holding a permutation.

To construct a permutation use `asPermutation` or `cycles`.

Is identity permutation:

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
```

The inversions of a permutation:

```
>>> let p = [3,2,4,1,5].asPermutation;
>>> p.inversions
[1 2; 1 4; 2 4; 3 4]
```

The `runs` of a permutation:

```
>>> [2 4 1 3].asPermutation.runs
[2 4; 1 3]
```

The runs of two random permutations:

```
>>> 13.randomPermutationList(2, Sfc32(12345)).collect(runs:/1)
[
	11; 7 13; 5 10; 9; 4; 1 12; 2 3 8; 6:;
	7; 5; 3 10 13; 9; 8; 4 6 11; 2 12; 1
]
```

* * *

See also: inversePermutation, permutationCycle, permutationList, permutationProduct, permutationPower, permute

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Permutation.html)

Categories: Permutations, Type
