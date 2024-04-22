# minimumChangePermutations

- _minimumChangePermutations(anInteger)_

Answer a `List` of the permutations of _[1 .. anInteger]_ in minimum change order,
following Heap’s algorithm.

_S3_ in minimum change sequence:

```
>>> 3.minimumChangePermutations
[
	1 2 3; 2 1 3;
	3 1 2; 1 3 2;
	2 3 1; 3 2 1
]
```

_S4_ in minimum change sequence:

```
>>> 4.minimumChangePermutations
[
	1 2 3 4; 2 1 3 4; 3 1 2 4; 1 3 2 4; 2 3 1 4; 3 2 1 4;
	4 2 1 3; 2 4 1 3; 1 4 2 3; 4 1 2 3; 2 1 4 3; 1 2 4 3;
	1 3 4 2; 3 1 4 2; 4 1 3 2; 1 4 3 2; 3 4 1 2; 4 3 1 2;
	4 3 2 1; 3 4 2 1; 2 4 3 1; 4 2 3 1; 3 2 4 1; 2 3 4 1
]
```

Show sequence of swaps:

```
>>> let l = 4.minimumChangePermutations;
>>> l.adjacentPairsCollect { :p :q |
>>> 	p.findPermutation(q).cycles.first
>>> }
[
	1 2; 1 3; 1 2; 1 3; 1 2; 1 4;
	1 2; 1 3; 1 2; 1 3; 1 2; 2 4;
	1 2; 1 3; 1 2; 1 3; 1 2; 3 4;
	1 2; 1 3; 1 2; 1 3; 1 2
]
```

* * *

See also: lexicographicPermutations, permutations, plainChanges

References:
_W_
[1](https://en.wikipedia.org/wiki/Heap%27s_algorithm)

Further Reading: Heap 1963

Categories: Enumerating, Permutations
