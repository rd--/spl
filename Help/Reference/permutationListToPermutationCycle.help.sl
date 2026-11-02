# permutationListToPermutationCycle

- _permutationListToPermutationCycle([x₁ x₂ …], n)_

Answer the permutation cycle, or orbit, of the permutation list _x_ beginning at _n_.

The answer begins at _n_:

```
>>> [4 3 2 1]
>>> .permutationListToPermutationCycle(3)
[3 2]
```

Unary cycles are answered:

```
>>> [2 4 3 1]
>>> .permutationListToPermutationCycle(3)
[3]
```

Form un-reduced permutation cycles by collecting each orbit separately:

```
>>> let l = [2 5 3 6 1 8 7 9 4 10];
>>> [1 3 4 7 10].collect { :i |
>>> 	l.permutationListToPermutationCycle(i)
>>> }
[1 2 5; 3; 4 6 8 9; 7; 10]
```

C.f. `permutationCycles`:

```
>>> [2 5 3 6 1 8 7 9 4 10]
>>> .permutationCycles
[1 2 5; 4 6 8 9]
```

* * *

See also: permutationCycles

Guides: Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PermutationCycle.html)
