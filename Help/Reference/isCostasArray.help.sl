# isCostasArray

- _isCostasArray([x₁ x₂ …])_

An order-_n_ Costas array is a permutation on _1…n_ such that the distances in each row of the triangular difference table are distinct.

A fourth-order Costas array:

```
>>> [2 1 3 4].isCostasArray
true
```

A fifth-order Costas array:

```
>>> [1 3 4 2 5].isCostasArray
true
```

A tenth-order Costas array:

```
>>> [2 4 8 5 10 9 7 3 6 1]
>>> .isCostasArray
true
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
>>> 	isCostasArray:/1
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
