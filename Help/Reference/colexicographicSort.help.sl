# colexicographicSort

- _colexicographicSort([x₁ x₂ …])_

Sorts a list _xₙ_ into colexicographic order in place.
Answer the sorted list.
This is `sortComparing` of `colexicographicCompare`.

Sort subsets colexicographically:

```
>>> let x = [1 2 3].powerSet;
>>> x.colexicographicSort;
>>> x
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

Sort k-subsets of first n integers colexicographically:

```
>>> let n = 5;
>>> let k = 3;
>>> 1:n.combinations(k)
>>> .colexicographicSort
[
	1 2 3;
	1 2 4;
	1 3 4;
	2 3 4;
	1 2 5;
	1 3 5;
	2 3 5;
	1 4 5;
	2 4 5;
	3 4 5
]
```

Sort binary combinations:

```
>>> binaryCombinations(2, 3)
>>> .colexicographicSort
[
	1 1 1 0 0;
	1 1 0 1 0;
	1 0 1 1 0;
	0 1 1 1 0;
	1 1 0 0 1;
	1 0 1 0 1;
	0 1 1 0 1;
	1 0 0 1 1;
	0 1 0 1 1;
	0 0 1 1 1
]
```

* * *

See also: canonicalSort, lexicographicSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Colexicographical_order)
