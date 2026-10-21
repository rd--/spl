# isCostasArray

- _isCostasArray([x₁ x₂ …])_

An order-_n_ Costas array is a permutation on _1…n_ such that the distances in each row of the triangular difference table are distinct.

A fourth-order Costas array:

```
>>> [2 1 3 4].isCostasArray
true

>>> [2 1 3 4]
>>> .triangularDifferenceTable
[-1 2 1; 1 3; 2]
```

A fifth-order Costas array:

```
>>> [1 3 4 2 5].isCostasArray
true

>>> [1 3 4 2 5]
>>> .triangularDifferenceTable
[
	2 1 -2 3;
	3 -1 1;
	1 2
	4
]
```

A ninth-order Costas array:

```
>>> [2 6 3 8 1 7 9 4 5].isCostasArray
true

>>> [2 6 3 8 1 7 9 4 5]
>>> .triangularDifferenceTable
[
	4 -3 5 -7 6 2 -5 1;
	1 2 -2 -1 8 -3 -4;
	6 -5 4 1 3 -2;
	-1 1 6 -4 4;
	5 3 1 -3;
	7 -2 2;
	2 -1;
	3
]
```

A tenth-order Costas array:

```
>>> [2 4 8 5 10 9 7 3 6 1]
>>> .isCostasArray
true

>>> [2 4 8 5 10 9 7 3 6 1]
>>> .triangularDifferenceTable
[
	2 4 -3 5 -1 -2 -4 3 -5;
	6 1 2 4 -3 -6 -1 -2;
	3 6 1 2 -7 -3 -6;
	8 5 -1 -2 -4 -8;
	7 3 -5 1 -9;
	5 -1 -2 -4;
	1 2 -7;
	4 -3;
	-1
]
```

Twelfth-order logarithmic Welch-Costas permutations:

```
>>> [
>>> 	12 1 4 2 9 5 11 3 8 10 7 6;
>>> 	12 5 8 10 9 1 7 3 4 2 11 6;
>>> 	12 11 8 10 3 7 1 9 4 2 5 6;
>>> 	12 7 4 2 3 11 5 9 8 10 1 6
>>> ].allSatisfy(isCostasArray/1)
true
```

Logarithmically generated Costas arrays:

```
>>> 1L:12.select { :p |
>>> 	(p ^ 1:12 % 13).isCostasArray
>>> }
[2 6 7 11]

>>> 1L:22.select { :p |
>>> 	(p ^ 1:22 % 23).isCostasArray
>>> }
[5 7 10 11 14 15 17 19 20 21]
```

An order twenty-six Costas array:

```
>>> [
>>> 	6 9 21 17 19 16 5 26 14 20
>>> 	7 11 3 1 10 25 15 22 4 24
>>> 	23 8 2 12 13 18
>>> ].isCostasArray
true
```

An order twenty-seven Costas array:

```
>>> [
>>> 	11 10  4 24  7 23  3 18 21  9
>>> 	26 16  5  1 15 27  2 25 17 22
>>> 	19  6  8 12 20 13 14
>>> ].isCostasArray
true
```

Costas arrays for small _n_:

```
>>> [
>>> 	1;
>>> 	1 2;
>>> 	2 1;
>>> 	1 3 2;
>>> 	1 3 2;
>>> 	2 1 3;
>>> 	2 3 1;
>>> 	3 1 2;
>>> 	1 2 4 3;
>>> 	1 3 4 2;
>>> 	1 4 2 3;
>>> 	2 1 3 4;
>>> 	2 3 1 4;
>>> 	2 4 3 1;
>>> 	3 1 2 4;
>>> 	3 2 4 1;
>>> 	3 4 2 1;
>>> 	4 1 3 2;
>>> 	4 2 1 3;
>>> 	4 3 1 2
>>> ].allSatisfy(
>>> 	isCostasArray/1
>>> )
true
```

* * *

See also: allSatisfy, differences, isDuplicateFree, subtract, triangularDifferenceTable, welchCostasArrayList

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CostasArray.html),
_W_
[1](https://en.wikipedia.org/wiki/Costas_array)

Further Reading: Costas 1984
