# permutationUnrank

- _permutationUnrank(r, n)_

Answer the _r_-th permutation in the lexicographic ordering of the symmetric group _n_.

The rank of the identity permutation is zero:

```
>>> 0.permutationUnrank(4)
Permutation[1 2 3 4]

>>> [1 2 3 4].permutationRank
0
```

The eighteenth entry of S4:

```
>>> 17.permutationUnrank(4)
Permutation[3 4 2 1]

>>> [3 4 2 1].permutationRank
17
```

The eleventh entry of S5:

```
>>> 10.permutationUnrank(5)
Permutation[1 3 5 2 4]

>>> [1 3 5 2 4].permutationRank
10
```

The twenty-seventh entry of S6:

```
>>> 26.permutationUnrank(6)
Permutation[1 3 2 5 4 6]

>>> [1 3 2 5 4 6].permutationRank
26
```

Enumerate S4:

```
>>> [0 .. 4.! - 1].collect { :n |
>>> 	n.permutationUnrank(4).list
>>> }
[
	1 2 3 4;
	1 2 4 3;
	1 3 2 4;
	1 3 4 2;
	1 4 2 3;
	1 4 3 2;
	2 1 3 4;
	2 1 4 3;
	2 3 1 4;
	2 3 4 1;
	2 4 1 3;
	2 4 3 1;
	3 1 2 4;
	3 1 4 2;
	3 2 1 4;
	3 2 4 1;
	3 4 1 2;
	3 4 2 1;
	4 1 2 3;
	4 1 3 2;
	4 2 1 3;
	4 2 3 1;
	4 3 1 2;
	4 3 2 1
]
```

Enumerate S4:

~~~spl svg=A
[0 .. 4.! - 1].collect { :n |
	n.permutationUnrank(4).list
}.transpose.colourMatrixPlot
~~~

![](Help/Image/permutationUnrank-A.svg)

* * *

See also: mixedRadixEncode, permutationRank

Guides: Combinatorial Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/acapdot#dyadic)
