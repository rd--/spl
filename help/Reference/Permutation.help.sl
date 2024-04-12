Is identity permutation:

```
>>> [].cycles.isIdentity
true
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

Answer the size of a permuation,
i.e. the maximum entry in any cycle:

```
>>> [1 4 3; 2 5].cycles.size
5
```

The identity permutation has size zero:

```
>>> [].cycles.size
0
```

Answer inverse permutation:

```
>>> [1 4 3; 2 5].cycles.inverse
[3 4 1; 5 2].cycles
```

Answer permutation list:

```
>>> [1 4 2; 3].cycles.permutationList
[4 1 3 2]
```

Permutation list as permutation:

```
>>> [4 5 1 3 2].asPermutation
[1 4 3; 2 5].cycles
```

Permutation cycles as permutation:

```
>>> [1 4 3; 2 5].asPermutation.permutationList
[4 5 1 3 2]
```

Answer permutation matrix:

```
>>> [1 4 2; 3].cycles.permutationMatrix
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
