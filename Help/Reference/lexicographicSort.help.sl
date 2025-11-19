# lexicographicSort

- _lexicographicSort([x₁ x₂ …])_

Sorts a list _xₙ_ into lexicographic order in place.
Answer the sorted list.
This is `sort` of `precedes`.

Sort subsets lexicographically:

```
>>> let x = [1 2 3].powerSet;
>>> x.lexicographicSort;
>>> x
[; 1; 1 2; 1 2 3; 1 3; 2; 2 3; 3]
```

Order is determined by the first element that differs, regardless of expression length:

```
>>> [2 1 3; 2 1 2 3 4; 2 1 1 3]
>>> .lexicographicSort
[2 1 1 3; 2 1 2 3 4; 2 1 3]
```

When all elements coincide up to the shortest length, shorter lists are ordered first:

```
>>> [1 2 3 4; 1; 1 2 3; 1 2]
>>> .lexicographicSort
[1; 1 2; 1 2 3; 1 2 3 4]
```

Empty lists are sorted before any other list:

```
>>> [1 2 3; ; 2 1]
>>> .lexicographicSort
[; 1 2 3; 2 1]
```

Sort list of strings:

```
>>> ['a' 'c' 'bx' 'xa']
>>> .lexicographicSort
['a' 'bx' 'c' 'xa']
```

Sort matrix of strings:

```
>>> ['c' 'a'; 'bx' 'xa']
>>> .lexicographicSort
['bx' 'xa'; 'c' 'a']
```

Sort binary combinations:

```
>>> binaryCombinations(2, 3)
>>> .lexicographicSort
[
	0 0 1 1 1;
	0 1 0 1 1;
	0 1 1 0 1;
	0 1 1 1 0;
	1 0 0 1 1;
	1 0 1 0 1;
	1 0 1 1 0;
	1 1 0 0 1;
	1 1 0 1 0;
	1 1 1 0 0
]

>>> 1:5.combinations(3)
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

* * *

See also: canonicalSort, precedes, sort

Guides: Comparison Functions, Sort Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LexicographicSort.html),
_W_
[1](https://en.wikipedia.org/wiki/Lexicographic_order)
