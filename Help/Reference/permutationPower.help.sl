# permutationPower

- _permutationPower(p, n)_

Answer the _n_-th permutation power of the permutation _p_,
i.e. the product of _p_ with itself _n_ times.
When _n_ is negative,
`permutationPower` finds powers of the inverse of _p_.

Sixth power of a permutation:

```
>>> let p = [1 7 6 3; 2 5 4];
>>> p.permutationPower(6)
[1 6; 2; 3 7; 4; 5].Permutation
```

The same answer arrived at using `permutationProduct`:

```
>>> let p = [1 7 6 3; 2 5 4].cycles;
>>> List(6, p).permutationProduct
[1 6; 2; 3 7; 4; 5].Permutation
```

Second power of the inverse permutation:

```
>>> [1 7 6 3; 2 5 4].permutationPower(-2)
[1 6; 2 5 4; 3 7].Permutation
```

`permutationPower` can yield the identity permutation:

```
>>> [1 7 6 3; 2 5 4].permutationPower(12)
[1; 2; 3; 4; 5; 6; 7].Permutation
```

When _n_ is zero, `permutationPower` answers the identity permutation:

```
>>> [1 7 6 3; 2 5 4].permutationPower(0)
[1; 2; 3; 4; 5; 6; 7].Permutation
```

Square of permutation given in list form:

```
>>> [1 4 5 6 2 3].permutationPower(2)
[1 6 2 3 4 5].Permutation
```

* * *

See also: asPermutation, cycles, inversePermutation, permutationProduct

Guides: Permutation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationPower.html)

Categories: Permutations
