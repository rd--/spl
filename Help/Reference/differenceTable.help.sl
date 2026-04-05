# differenceTable

- _differenceTable([x₁ x₂ …])_

Answer the first differences, the second differences, and so on until the table is complete.

An _n_-th power has a constant _n_-th finite difference:

```
>>> 1:5.cube.differenceTable
[
	7 19 37 61;
	12 18 24;
	6 6;
	0
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

See also: differences, triangularDifferenceTable

Guides: List Functions
