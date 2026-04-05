# isCostasArray

- _isCostasArray([x₁ x₂ …])_

An order-_n_ Costas array is a permutation on _1…n_ such that the distances in each row of the triangular difference table are distinct.

A fifth-order Costas array:

```
>>> [1 3 4 2 5].isCostasArray
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

See also: allSatisfy, differences, isDuplicateFree, subtract, triangularDifferenceTable, welchCostasArrayList

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CostasArray.html)
