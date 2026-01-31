# findPermutation

- _findPermutation([x₁ x₂ …], [y₁ y₂ …])_

Answer a permutation that converts the sequence _x_ into the sequence _y_,
for two sequences that differ only in the order of their items.

Permutation relating two expressions with the same elements:

```
>>> [1 3 4 5 2]
>>> .findPermutation([3 1 2 4 5])
[1 2; 3 4 5].cycles

>>> [1 2 3 4 5 6]
>>> .findPermutation([2 1 3 5 4 6])
[1 2; 4 5].Permutation

>>> [2 1 3 5 4 6]
>>> .findPermutation([2 3 1 4 5 6])
[2 3; 4 5].Permutation
```

Verify the result using `permute`:

```
>>> [1 3 4 5 2].permute([1 2; 3 4 5])
[3 1 2 4 5]
```

In the unary case answer the permutation required to order _x_.
Relation with `ordering`:

```
>>> 'adcghf'.characters.findPermutation
[2 3; 4 6 5].cycles

>>> 'adcghf'.characters
>>> .ordering.Permutation
[2 3; 4 6 5].cycles

>>> let l = 'adcghf'.characters;
>>> l.sorted.findPermutation(l)
[2 3; 4 6 5].cycles
```

Find permutations for rotations:

```
>>> let n = 6;
>>> let p = [1 .. n];
>>> [1 .. n - 1].collect { :i |
>>> 	let q = p.rotateLeft(i);
>>> 	p.findPermutation(q).cycles
>>> }
[
	1 6 5 4 3 2:;
	1 5 3; 2 6 4:;
	1 4; 2 5; 3 6:;
	1 3 5; 2 4 6:;
	1 2 3 4 5 6
]
```

* * *

See also: cycles, ordering, Permutation, permute

Guides: Permutation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FindPermutation.html)

Categories: Permutations
