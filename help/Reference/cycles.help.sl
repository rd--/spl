# cycles

- _cycles(aSequence)_

Answer the `Permutation` given by the permutation cycles at _aSequence_.

A permutation with two cycles:

```
>>> [1 4 3; 2 5].cycles.permutationCycles
[1 4 3; 2 5]
```

Automatic evaluation to a canonical form:

```
>>> [4 10 2 5; 9; 7 1 18].cycles.permutationCycles
[1 18 7; 2 5 4 10]
```

Identity permutation:

```
>>> [].cycles.permutationCycles
[]
```

The identity permutation contains no cycles in its canonical form:

```
>>> [1; 2; 3; 4].cycles.permutationCycles
[]
```

Permutation applied to a single point:

```
>>> [[1 3 2]].cycles.image(3)
2
```

Points not present in the cycles are mapped onto themselves:

```
>>> [[1 3 2]].cycles.image(4)
4
```

All integers must be distinct:

```
>>> { [1 2 3; 3 4 5].cycles }.ifError { true }
true
```

* * *

See also: asPermutation, Permutation, permutationReplace, permute

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Cycles.html)

Categories: Permutations, Converting
