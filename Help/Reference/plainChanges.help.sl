# plainChanges

- _plainChanges(n)_

Answer a `List` of the permutations of _1…n_ in the _plain changes_ sequence,
whereby only one swap is made at each step,
following the Steinhaus–Johnson–Trotter algorithm.

Plain changes of _S3_:

```
>>> 3.plainChanges
[
	1 2 3;
	1 3 2;
	3 1 2;
	3 2 1;
	2 3 1;
	2 1 3
]
```

Plain changes of _S4_:

```
>>> 4.steinhausJohnsonTrotter
[
	1 2 3 4;
	1 2 4 3;
	1 4 2 3;
	4 1 2 3;
	4 1 3 2;
	1 4 3 2;
	1 3 4 2;
	1 3 2 4;
	3 1 2 4;
	3 1 4 2;
	3 4 1 2;
	4 3 1 2;
	4 3 2 1;
	3 4 2 1;
	3 2 4 1;
	3 2 1 4;
	2 3 1 4;
	2 3 4 1;
	2 4 3 1;
	4 2 3 1;
	4 2 1 3;
	2 4 1 3;
	2 1 4 3;
	2 1 3 4
]
```

Show sequence of swaps, and since swaps are always adjacent show only first place:

```
>>> let l = 4.plainChanges;
>>> l.adjacentPairsCollect { :p :q |
>>> 	let r = p.findPermutation(q);
>>> 	r.cycles.first.first
>>> }
[
	3 2 1 3 1 2 3 1
	3 2 1 3 1 2 3 1
	3 2 1 3 1 2 3
]
```

Plot plain changes of _S3_:

~~~spl svg=A
3.steinhausJohnsonTrotter
.transpose
.linePlot
~~~

![](sw/spl/Help/Image/plainChanges-A.svg)

* * *

See also: lexicographicPermutations, minimumChangePermutations, permutations, plainChangesDo

Guides: Permutation Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm)

Further Reading: Johnson 1963, Ruskey 1989, Sedgewick 1977, Trotter 1962

Categories: Enumerating, Permutations
