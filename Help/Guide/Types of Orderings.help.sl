# Types of Orderings

The lexicographic order,
also known as dictionary order or alphabetical order or lexicographic,
is a natural order structure of the Cartesian product of two or more ordered sets:

```
>>> [1 .. 6].subsets { :x |
>>> 	x.size = 3
>>> }.lexicographicSort
[
	1 2 3;
	1 2 4;
	1 2 5;
	1 2 6;
	1 3 4;
	1 3 5;
	1 3 6;
	1 4 5;
	1 4 6;
	1 5 6;
	2 3 4;
	2 3 5;
	2 3 6;
	2 4 5;
	2 4 6;
	2 5 6;
	3 4 5;
	3 4 6;
	3 5 6;
	4 5 6
]
```

The reverse lexicographic order is derived from the lexicographic order by inverting the external order of elements:

```
>>> [1 .. 6].subsets { :x |
>>> 	x.size = 3
>>> }.reverseLexicographicSort
[
	4 5 6;
	3 5 6;
	3 4 6;
	3 4 5;
	2 5 6;
	2 4 6;
	2 4 5;
	2 3 6;
	2 3 5;
	2 3 4;
	1 5 6;
	1 4 6;
	1 4 5;
	1 3 6;
	1 3 5;
	1 3 4;
	1 2 6;
	1 2 5;
	1 2 4;
	1 2 3
]
```

The reflected lexicographic order is derived from the lexicographic order by inverting the internal order of elements.

```
>>> [1 .. 6].subsets { :x |
>>> 	x.size = 3
>>> }.reflectedLexicographicSort
[
	3 2 1;
	4 2 1;
	5 2 1;
	6 2 1;
	4 3 1;
	5 3 1;
	6 3 1;
	5 4 1;
	6 4 1;
	6 5 1;
	4 3 2;
	5 3 2;
	6 3 2;
	5 4 2;
	6 4 2;
	6 5 2;
	5 4 3;
	6 4 3;
	6 5 3;
	6 5 4
]
```

The reverse reflected lexicographic order is derived from the lexicographic order by inverting both the internal order and the external order of elements:

```
>>> [1 .. 6].subsets { :x |
>>> 	x.size = 3
>>> }.reverseReflectedLexicographicSort
[
	6 5 4;
	6 5 3;
	6 4 3;
	5 4 3;
	6 5 2;
	6 4 2;
	5 4 2;
	6 3 2;
	5 3 2;
	4 3 2;
	6 5 1;
	6 4 1;
	5 4 1;
	6 3 1;
	5 3 1;
	4 3 1;
	6 2 1;
	5 2 1;
	4 2 1;
	3 2 1
]
```

The colexicographic order is a natural order structure of the Cartesian product of two or more ordered sets:

```
>>> [1 .. 6].subsets { :x |
>>> 	x.size = 3
>>> }.colexicographicSort
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
	3 4 5;
	1 2 6;
	1 3 6;
	2 3 6;
	1 4 6;
	2 4 6;
	3 4 6;
	1 5 6;
	2 5 6;
	3 5 6;
	4 5 6
]

>>> [1 2 3].permutations
>>> .colexicographicSort
[
	3 2 1;
	2 3 1;
	3 1 2;
	1 3 2;
	2 1 3;
	1 2 3
]

>>> [1 2 3].powerSet
>>> .colexicographicSort
[
	;
	1;
	2;
	1 2;
	3;
	1 3;
	2 3;
	1 2 3
]
```

Reverse colexicographic order:

```
>>> [1 .. 6].subsets { :x |
>>> 	x.size = 3
>>> }.reverseColexicographicSort
[
	4 5 6;
	3 5 6;
	2 5 6;
	1 5 6;
	3 4 6;
	2 4 6;
	1 4 6;
	2 3 6;
	1 3 6;
	1 2 6;
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

Reflected colexicographic order:

```
>>> [1 .. 6].subsets { :x |
>>> 	x.size = 3
>>> }.reflectedColexicographicSort
[
	3 2 1;
	4 2 1;
	4 3 1;
	4 3 2;
	5 2 1;
	5 3 1;
	5 3 2;
	5 4 1;
	5 4 2;
	5 4 3;
	6 2 1;
	6 3 1;
	6 3 2;
	6 4 1;
	6 4 2;
	6 4 3;
	6 5 1;
	6 5 2;
	6 5 3;
	6 5 4
]
```

Reverse reflected colexicographic order:

```
>>> [1 .. 6].subsets { :x |
>>> 	x.size = 3
>>> }.reverseReflectedColexicographicSort
[
	6 5 4;
	6 5 3;
	6 5 2;
	6 5 1;
	6 4 3;
	6 4 2;
	6 4 1;
	6 3 2;
	6 3 1;
	6 2 1;
	5 4 3;
	5 4 2;
	5 4 1;
	5 3 2;
	5 3 1;
	5 2 1;
	4 3 2;
	4 3 1;
	4 2 1;
	3 2 1
]
```

Graded reflected colexicographic ordering of integer partitions:

```
>>> [2 2 5; 1 4 4; 1 3 5]
>>> .gradedReflectedColexicographicSort
[1 3 5; 1 4 4; 2 2 5]
```

* * *

Guides: Sort Functions

References:
_OEIS_
[1](https://oeis.org/wiki/Orderings)
[2](https://oeis.org/wiki/Orderings_of_partitions)
