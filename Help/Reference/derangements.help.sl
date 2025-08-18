# derangements

- _derangements([x₁ x₂ …])_

Answer a `List` of the derangements of the sequence _x_.
A derangement is a permutation in which no item appears in it’s original place.

```
>>> [1 .. 3].derangements
[2 3 1; 3 1 2]
```

The number of derangements of _n_ distinct items is the `subfactorial` of _n_.

```
>>> [1 .. 4].derangements
[
	2 1 4 3; 2 3 4 1; 2 4 1 3;
	3 1 4 2; 3 4 1 2; 3 4 2 1;
	4 3 2 1; 4 3 1 2; 4 1 2 3
]

>>> 4.subfactorial
9
```

* * *

See also: permutations, subfactorial

Guides: Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Derangement.html),
_W_
[1](https://en.wikipedia.org/wiki/Derangement)
