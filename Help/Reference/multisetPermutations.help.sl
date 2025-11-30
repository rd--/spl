# multisetPermutations

- _multisetPermutations([x₁ x₂ …])_

Answer the permutations of the multiset _x_.
Implements a loopless prefix shift algorithm by Williams.

At `List`:

```
>>> [1 2 3 1].multisetPermutations
[
	3 2 1 1;
	1 3 2 1;
	3 1 2 1;
	1 3 1 2;
	1 1 3 2;
	3 1 1 2;
	2 3 1 1;
	1 2 3 1;
	2 1 3 1;
	1 2 1 3;
	1 1 2 3;
	2 1 1 3
]

>>> [2 1 1].multinomial
12
```

Sorted into lexicographic order:

```
>>> [1 2 3 1].multisetPermutations
>>> .lexicographicSort
[
	1 1 2 3;
	1 1 3 2;
	1 2 1 3;
	1 2 3 1;
	1 3 1 2;
	1 3 2 1;
	2 1 1 3;
	2 1 3 1;
	2 3 1 1;
	3 1 1 2;
	3 1 2 1;
	3 2 1 1
]
```

Permutations of _1,1,2,3,3_:

```
>>> [1 2 3 1 3].multisetPermutations
[
	3 3 2 1 1;
	1 3 3 2 1;
	3 1 3 2 1;
	3 3 1 2 1;
	1 3 3 1 2;
	3 1 3 1 2;
	1 3 1 3 2;
	1 1 3 3 2;
	3 1 1 3 2;
	3 3 1 1 2;
	2 3 3 1 1;
	3 2 3 1 1;
	1 3 2 3 1;
	3 1 2 3 1;
	2 3 1 3 1;
	1 2 3 3 1;
	2 1 3 3 1;
	3 2 1 3 1;
	1 3 2 1 3;
	3 1 2 1 3;
	1 3 1 2 3;
	1 1 3 2 3;
	3 1 1 2 3;
	2 3 1 1 3;
	1 2 3 1 3;
	2 1 3 1 3;
	1 2 1 3 3;
	1 1 2 3 3;
	2 1 1 3 3;
	3 2 1 1 3
]

>>> [2 1 2].multinomial
30
```

Count _1,1,2,2,3,3_ permutations:

```
>>> [1 2 3 1 2 3].multisetPermutations
>>> .size
90

>>> [2 2 2].multinomial
90
```

Matrix plot:

~~~spl svg=A
[1 2 3 1 3].multisetPermutations
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/multisetPermutations-A.svg)

Matrix plot,
in lexicographic order:

~~~spl svg=B
[1 2 3 1 3].multisetPermutations
.lexicographicSort
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/multisetPermutations-B.svg)

* * *

See also: multinomial, permutations

Guides: Permutation Functions

Further Reading: Williams 2009
