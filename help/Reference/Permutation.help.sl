# Permutation

A `Type` holding a permutation.

To construct a permutation use `asPermutation` or `cycles`.

Is identity permutation:

```
>>> [].cycles.isIdentity
true
```

A `Permutation` applied to a single point using `image`:

```
>>> [1 3 2; 4 5].cycles.image(3)
2
```

Points not present in the cycles are mapped onto themselves:

```
>>> [1 3 2; 4 5].cycles.image(7)
7
```

Apply identity permutation:

```
>>> [].cycles.apply([1 3 2 5 4])
[1 3 2 5 4]
```

Apply a permutation:

```
>>> [[1 3 2]].cycles.apply([1 2 3 4 5])
[2 3 1 4 5]
```

Answer the `max` of a permuation,
i.e. the maximum entry in any cycle:

```
>>> [1 4 3; 2 5].cycles.max
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

Permutation cycles as permutation:

```
>>> let p = [1 4 3; 2 5].cycles;
>>> p.list
[4 5 1 3 2]
```

Answer permutation matrix:

```
>>> [1 4 2; 3].cycles.matrix
[
	0 0 0 1;
	1 0 0 0;
	0 0 1 0;
	0 1 0 0
]
```

Product of two permutations:

```
>>> let p = [[1 2 3]].cycles;
>>> let q = [[2 3]].cycles;
>>> p * q
[[1 3]].cycles
```

Multiplication of permutations is not commutative:

```
>>> let p = [[1 2 3]].cycles;
>>> let q = [[2 3]].cycles;
>>> q * p
[[1 2]].cycles
```

The inversions of a permutation:

```
>>> let p = [3,2,4,1,5].asPermutation;
>>> p.inversions(5)
[1 2; 1 4; 2 4; 3 4]
```

* * *

See also: inversePermutation, permutationCycle, permutationList, permutationProduct, permutationPower, permute

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Permutation.html)

Categories: Permutations, Type
