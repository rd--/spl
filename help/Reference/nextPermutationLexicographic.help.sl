# nextPermutationLexicographic

- _nextPermutationLexicographic(aSequence)_

Mutate _aSequence_ in place so that it holds the next permutation in lexicographic ordering.
Answer _aSequence_ if there is such a permutation,
or `nil` if the sequence is the final permutation.

```
>>> [1 2 3 4].nextPermutationLexicographic
[1 2 4 3]
```

The four element permutations, in lexicographic order:

```
>>> let l = [1 2 3 4];
>>> let p = [];
>>> 4.factorial.timesRepeat {
>>> 	p.add(l.copy);
>>> 	l.nextPermutationLexicographic
>>> };
>>> p
[
	1 2 3 4; 1 2 4 3; 1 3 2 4; 1 3 4 2; 1 4 2 3; 1 4 3 2;
	2 1 3 4; 2 1 4 3; 2 3 1 4; 2 3 4 1; 2 4 1 3; 2 4 3 1;
	3 1 2 4; 3 1 4 2; 3 2 1 4; 3 2 4 1; 3 4 1 2; 3 4 2 1;
	4 1 2 3; 4 1 3 2; 4 2 1 3; 4 2 3 1; 4 3 1 2; 4 3 2 1
]
```

If there are no further permutations answer nil:

```
>>> [4 3 2 1].nextPermutationLexicographic
nil
```
