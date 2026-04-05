# triangularDifferenceTable

- _triangularDifferenceTable([x₁ x₂ …])_

Answer the triangular difference table of the sequence _x_.
The first row gives the differences of adjacent items,
the second row the differences of items separated by one place,
and so on.

The triangular difference table of a Costas array:

```
>>> [1 3 4 2 5]
>>> .triangularDifferenceTable
[
	2 1 -2 3;
	3 -1 1;
	1 2;
	4
]

>>> [3 - 1, 4 - 3, 2 - 4, 5 - 2]
[2 1 -2 3]

>>> [4 - 1, 2 - 3, 5 - 4]
[3 -1 1]

>>> [2 - 1, 5 - 3]
[1 2]

>>> [5 - 1]
4
```

Compare to `differenceTable`:

```
>>> [1 19 143 607 1789 4211 8539]
>>> .triangularDifferenceTable
[
	18 124 464 1182 2422 4328;
	142 588 1646 3604 6750;
	606 1770 4068 7932;
	1788 4192 8396;
	4210 8520;
	8538
]

>>> [1 19 143 607 1789 4211 8539]
>>> .differenceTable
[
	18 124 464 1182 2422 4328;
	106 340 718 1240 1906;
	234 378 522 666;
	144 144 144;
	0 0;
	0
]
```

* * *

See also: allSatisfy, differences, isDuplicateFree, subtract, triangularDifferenceTable, welchCostasArrayList

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CostasArray.html)
