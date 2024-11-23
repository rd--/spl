# cycles

- _cycles(aSequence)_

Answer the `Permutation` given by the permutation cycles at _aSequence_.

A permutation with two cycles:

```
>>> let p = [1 4 3; 2 5].cycles;
>>> (p.cycles, p.list)
([1 4 3; 2 5], [4 5 1 3 2])
```

Automatic evaluation to a canonical form:

```
>>> let p = [4 10 2 5; 9; 7 1 18].cycles;
>>> p.cycles
[1 18 7; 2 5 4 10]
```

Identity permutation:

```
>>> [].cycles.isIdentity
true
```

The identity permutation contains no cycles in its canonical form:

```
>>> let p = [1; 2; 3; 4].cycles;
>>> p.cycles
[]
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
