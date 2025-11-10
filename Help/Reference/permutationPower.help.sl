# permutationPower

- _permutationPower(aPermutation, anInteger)_

Answer the _anInteger_-th permutation power of _aPermutation_,
i.e. the product of _aPermutation_ with itself _anInteger_ times.
When _anInteger_ is negative,
`permutationPower` finds powers of the inverse of _aPermutation_.

Sixth power of a permutation:

```
>>> let p = [1 7 6 3; 2 5 4];
>>> p.permutationPower(6)
[1 6; 2; 3 7; 4; 5].cycles
```

The same answer arrived at using `permutationProduct`:

```
>>> let p = [1 7 6 3; 2 5 4].cycles;
>>> List(6, p).permutationProduct
[1 6; 2; 3 7; 4; 5].cycles
```

Second power of the inverse permutation:

```
>>> [1 7 6 3; 2 5 4].permutationPower(-2)
[1 6; 2 5 4; 3 7].cycles
```

`permutationPower` can yield the identity permutation:

```
>>> [1 7 6 3; 2 5 4].permutationPower(12)
[1; 2; 3; 4; 5; 6; 7].cycles
```

When _anInteger_ is zero, `permutationPower` answers the identity permutation.

```
>>> [1 7 6 3; 2 5 4].permutationPower(0)
[1; 2; 3; 4; 5; 6; 7].cycles
```

Square of permutation given in list form:

```
>>> [1 4 5 6 2 3].permutationPower(2)
[1 6 2 3 4 5].asPermutation
```

* * *

See also: asPermutation, cycles, inversePermutation, permutationProduct

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationPower.html)

Categories: Permutations
