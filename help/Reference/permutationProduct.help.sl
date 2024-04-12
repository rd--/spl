# permutationProduct

- _permutationProduct(aSequence)_

Answer the left to right product of the permutations at _aSequence_.

The product of permutations _[p, q, r]_ is the result of applying _p_, then _q_, then _r_.

Product of two permutations:

```
>>> [1 2 3:; 2 3].permutationProduct
[[1 3]].cycles
```

`Permutation` implements the binary product operation as `*`:

```
>>> let p = [4 2 5; 6 3 1 7].cycles;
>>> p * p
[1 6; 2 4 5; 3 7].cycles
```

Multiplication of permutations is not commutative:

```
>>> [2 3:; 1 2 3].permutationProduct
[[1 2]].cycles
```

Product of a single permutation is `identity`:

```
>>> let p = [[1 4 3 2]].cycles;
>>> [p].permutationProduct
p
```

Product of the empty sequence gives the `identity` permutation:

```
>>> [].permutationProduct
[].cycles
```

Multiplication with the identity permutation:

```
>>> let p = [[1 4 3 2]].cycles;
>>> let q = [].cycles;
>>> [p, q].permutationProduct
p
```

Multiplication with the inverse permutation returns the identity:

```
>>> let p = [1 7 2; 3 9].cycles;
>>> [p, p.inversePermutation].permutationProduct
[].cycles
```

Any cycle of length _k_ is equivalent to a product of _k_ transpositions (cycles of length 2) all having the same first point:

```
>>> [3 5:; 3 7:; 3 4:; 3 9].permutationProduct
[[3 5 7 4 9]].cycles
```

Multiplication of permutation lists:

```
>>> let p = [5 3 2 4 6 1];
>>> let q = [2 1 3 5 6 4];
>>> let r = [q p].permutationProduct;
>>> r.permutationList
[3 5 2 6 1 4]
```

Repeated multiplication of a single permutation can be computed with `permutationPower`:

```
>>> let p = [4 2 5; 6 3 1 7];
>>> [p p p p p p].permutationProduct
p.permutationPower(6)
```

* * *

See also: cycles, permutationPower, permutationReplace, permute

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationProduct.html)

Categories: Permutations
