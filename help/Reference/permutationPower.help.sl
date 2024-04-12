# permutationPower

- _permutationPower(aPermutation, anInteger)_

Answer the _anInteger_-th permutation power of _aPermutation_,
i.e. the product of _aPermutation_ with itself _anInteger_ times.
When _anInteger_ is negative,
`permutationPower` finds powers of the inverse of _aPermutation_.

Sixth power of a permutation:

```
>>> let p = [4 2 5; 6 3 1 7];
>>> p.permutationPower(6)
[1 6; 3 7].cycles
```

The same answer arrived at using `permutationProduct`:

```
>>> let p = [4 2 5; 6 3 1 7].cycles;
>>> (p # 6).permutationProduct
[1 6; 3 7].cycles
```

Second power of the inverse permutation:

```
>>> [4 2 5; 6 3 1 7].permutationPower(-2)
[1 6; 2 5 4; 3 7].cycles
```

`permutationPower` can yield the identity permutation:

```
>>> [4 2 5; 6 3 1 7].permutationPower(12)
[].cycles
```

When _anInteger_ is zero, `permutationPower` answers the identity permutation.

```
>>> [4 2 5; 6 3 1 7].permutationPower(0)
[].cycles
```

* * *

See also: asPermutation, cycles, inversePermutation, permutationProduct

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationPower.html)

Categories: Permutations
