# reverseColexicographicSort

- _reverseColexicographicSort([x₁ x₂ …])_

Sorts a list _xₙ_ into reverse colexicographic order in place.
Answer the sorted list.
This is `sortComparing` of `reverseColexicographicCompare`.

Sort subsets reverse colexicographically:

```
>>> let x = [1 2 3].powerSet;
>>> x.reverseColexicographicSort;
>>> x
[1 2 3; 2 3; 1 3; 3; 1 2; 2; 1; ]
```

Sort k-subsets of first n integers colexicographically:

```
>>> let n = 5;
>>> let k = 3;
>>> 1:n.combinations(k)
>>> .reverseColexicographicSort
[
	3 4 5;
	2 4 5;
	1 4 5;
	2 3 5;
	1 3 5;
	1 2 5;
	2 3 4;
	1 3 4;
	1 2 4;
	1 2 3
]
```

Sort binary combinations:

```
>>> binaryCombinations(2, 3)
>>> .reverseColexicographicSort
[
	0 0 1 1 1;
	0 1 0 1 1;
	1 0 0 1 1;
	0 1 1 0 1;
	1 0 1 0 1;
	1 1 0 0 1;
	0 1 1 1 0;
	1 0 1 1 0;
	1 1 0 1 0;
	1 1 1 0 0
]
```

* * *

See also: canonicalSort, lexicographicSort, sort

Guides: Sort Functions, Types of Orderings
