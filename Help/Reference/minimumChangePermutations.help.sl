# minimumChangePermutations

- _minimumChangePermutations(n)_
- _minimumChangePermutations([x₁ x₂ …])_

Answer a `List` of the permutations of _1..n_ in minimum change order,
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
>>> [1 2 3 4].heapsAlgorithm
[
	1 2 3 4; 2 1 3 4; 3 1 2 4;
	1 3 2 4; 2 3 1 4; 3 2 1 4;
	4 2 1 3; 2 4 1 3; 1 4 2 3;
	4 1 2 3; 2 1 4 3; 1 2 4 3;
	1 3 4 2; 3 1 4 2; 4 1 3 2;
	1 4 3 2; 3 4 1 2; 4 3 1 2;
	4 3 2 1; 3 4 2 1; 2 4 3 1;
	4 2 3 1; 3 2 4 1; 2 3 4 1
]
```

Show sequence of swaps:

```
>>> let l = 4.minimumChangePermutations;
>>> l.adjacentPairsCollect { :p :q |
>>> 	let r = p.findPermutation(q);
>>> 	r.cycles.first
>>> }
[
	1 2; 1 3; 1 2; 1 3; 1 2; 1 4;
	1 2; 1 3; 1 2; 1 3; 1 2; 2 4;
	1 2; 1 3; 1 2; 1 3; 1 2; 3 4;
	1 2; 1 3; 1 2; 1 3; 1 2
]
```

Plot minimum change sequence of _S3_:

~~~spl svg=A
3.heapsAlgorithm
.transpose
.linePlot
~~~

![](sw/spl/Help/Image/minimumChangePermutations-A.svg)

* * *

See also: lexicographicPermutations, permutations, plainChanges

Guides: Permutation Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Heap%27s_algorithm)

Further Reading: Heap 1963

Categories: Enumerating, Permutations
