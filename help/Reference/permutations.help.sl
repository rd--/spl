# permutations

- _permutations(aSequence, anInteger)_
- _permutations(α)_ ⇒ _permutations(α, α.size)_

Answer a `List` of the permutations containing at most _anInteger_ elements of _aSequence_.

The six length three permutations of three elements:

```
>>> 1:3.permutations
[
	1 2 3; 1 3 2;
	2 1 3; 2 3 1;
	3 2 1; 3 1 2
]
```

The six length-two permutations of three elements:

```
>>> 1:3.permutations(2)
[
	1 2; 2 1;
	1 3; 3 1;
	2 3; 3 2
]
```

Calculate the same sequence as the permutations of the two element subsets:

```
>>> 1:3.subsets { :each |
>>> 	each.size = 2
>>> }.collect(permutations:/1).++
[
	1 2; 2 1;
	1 3; 3 1;
	2 3; 3 2
]
```

The number of length-_n_ permutations of a length-_n_ list of distinct elements is _n!_:

```
>>> 1:5.permutations.size
120

>>> 5.!
120
```

A permutation that leaves no element invariant is called a derangement:

```
>>> 1:5.permutations.select { :each |
>>> 	(each =.map each.sorted).noneSatisfy(identity:/1)
>>> }.size
44
```

The number of derangements of _n_ distinct elements is _n.subfactorial_:

```
>>> 5.subfactorial
44
```

Length-two permutations of four elements:

```
>>> 1:4.permutations(2)
[
	1 2; 2 1; 1 3; 3 1; 2 3; 3 2;
	1 4; 4 1; 2 4; 4 2; 3 4; 4 3
]
```

The number of _length-k_ permutations of _n_ elements is given by _k.stope(-1, n)_:

```
>>> 1:5.permutations(3).size
60

>>> 5.stope(-1, 3)
60
```

The four element permutations,
not that the answer is not in lexicographic order:

```
>>> [1 2 3 4].permutations
[
	1 2 3 4; 1 2 4 3; 1 3 2 4; 1 3 4 2; 1 4 3 2; 1 4 2 3;
	2 1 3 4; 2 1 4 3; 2 3 1 4; 2 3 4 1; 2 4 3 1; 2 4 1 3;
	3 2 1 4; 3 2 4 1; 3 1 2 4; 3 1 4 2; 3 4 1 2; 3 4 2 1;
	4 2 3 1; 4 2 1 3; 4 3 2 1; 4 3 1 2; 4 1 3 2; 4 1 2 3
]
```

Note also that if the list contains duplicate elements,
the answer will too:

```
>>> [1 2 2].permutations
[
	1 2 2; 1 2 2;
	2 1 2; 2 2 1;
	2 2 1; 2 1 2
]
```

* * *

See also: !, lexicographicPermutations, minimumChangePermutations, permutationsDo, plainChanges, stope, subfactorial, subsets

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Permutations.html)

Categories: Enumerating, Permutations
