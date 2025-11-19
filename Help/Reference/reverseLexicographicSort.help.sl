# reverseLexicographicSort

- _reverseLexicographicSort([x₁ x₂ …])_

Sorts a list _xₙ_ into reverse lexicographic order in place.
Answer the sorted list.
This is `sortComparing` of `reverseLexicographicCompare`.

Sort subsets reverse lexicographically:

```
>>> let x = [1 2 3].powerSet;
>>> x.reverseLexicographicSort;
>>> x
[3; 2 3; 2; 1 3; 1 2 3; 1 2; 1; ]
```

Sort k-subsets of first n integers reverse lexicographically:

```
>>> let n = 5;
>>> let k = 3;
>>> 1:n.combinations(k)
>>> .reverseLexicographicSort
[
	3 4 5;
	2 4 5;
	2 3 5;
	2 3 4;
	1 4 5;
	1 3 5;
	1 3 4;
	1 2 5;
	1 2 4;
	1 2 3
]
```

Sort binary combinations:

```
>>> binaryCombinations(2, 3)
>>> .reverseLexicographicSort
[
	1 1 1 0 0;
	1 1 0 1 0;
	1 1 0 0 1;
	1 0 1 1 0;
	1 0 1 0 1;
	1 0 0 1 1;
	0 1 1 1 0;
	0 1 1 0 1;
	0 1 0 1 1;
	0 0 1 1 1
]

>>> 1:5.combinations(3)
>>> .lexicographicSort
[
	1 2 3;
	1 2 4;
	1 2 5;
	1 3 4;
	1 3 5;
	1 4 5;
	2 3 4;
	2 3 5;
	2 4 5;
	3 4 5
]
```

* * *

See also: canonicalSort, lexicographicSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Colexicographical_order)
