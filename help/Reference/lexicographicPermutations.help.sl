# lexicographicPermutations

- _lexicographicPermutations(aSequence)_

Answer a `List` of the distinct permutations of _aSequence_ in lexicographic order.

```
>>> [1 2 3 4].lexicographicPermutations
[
	1 2 3 4; 1 2 4 3; 1 3 2 4; 1 3 4 2; 1 4 2 3; 1 4 3 2;
	2 1 3 4; 2 1 4 3; 2 3 1 4; 2 3 4 1; 2 4 1 3; 2 4 3 1;
	3 1 2 4; 3 1 4 2; 3 2 1 4; 3 2 4 1; 3 4 1 2; 3 4 2 1;
	4 1 2 3; 4 1 3 2; 4 2 1 3; 4 2 3 1; 4 3 1 2; 4 3 2 1
]
```

Given a multiset, will provide the distinct permutations:

```
>>> [1 2 3 3].lexicographicPermutations
[
	1 2 3 3; 1 3 2 3; 1 3 3 2;
	2 1 3 3; 2 3 1 3; 2 3 3 1;
	3 1 2 3; 3 1 3 2; 3 2 1 3;
	3 2 3 1; 3 3 1 2; 3 3 2 1
]
```

The number of distinct permutations of a multiset is given by `multinomial`:

```
>>> [1 1 2].multinomial
12
```

* * *

See also: lexicographicPermutationsDo, multinomial, nextPermutationLexicographic

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Permutations.html)

Categories: Enumerating, Permutations
