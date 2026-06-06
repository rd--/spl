# triangularDifferenceTable

- _triangularDifferenceTable([x₁ x₂ …], f:/2=-)_

Answer the triangular difference table of the sequence _x_,
also called a triangle of differences.
The first row gives the differences of adjacent items,
the second row the differences of items separated by one place,
and so on.

The triangular difference table of a fifth-order Costas array:

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
[4]
```

The triangular difference table of a ninth-order Costas array:

```
>>> [2 6 3 8 1 7 9 4 5]
>>> .triangularDifferenceTable
[
	 4 -3  5 -7  6  2 -5  1;
	 1  2 -2 -1  8 -3 -4;
	 6 -5  4  1  3 -2;
	-1  1  6 -4  4;
	 5  3  1 -3;
	 7 -2  2;
	 2 -1;
	 3
]
```

The triangular difference table of a tenth-order Costas array:

```
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

Triangular difference table of a sequence with glide-reflection symmetry:

```
>>> [7 12 2 9 8 10 6 1 11 4 5 3]
>>> .triangularDifferenceTable
[
	 5 -10  7 -1  2 -4 -5 10 -7  1 -2;
	-5  -3  6  1 -2 -9  5  3 -6 -1;
	 2  -4  8 -3 -7  1 -2  4 -8;
	 1  -2  4 -8  3 -6 -1  2;
	 3  -6 -1  2 -4 -5 -3;
	-1 -11  9 -5 -3 -7;
	-6  -1  2 -4 -5;
	 4  -8  3 -6;
	-3  -7  1;
	-2  -9;
	-4
]
```

Triangular difference table of a sequence of length _k=12_ with a _k/2_ spine:

```
>>> [3 8 11 1 12 4 10 6 7 5 2 9]
>>> .triangularDifferenceTable
[
	 5  3 -10 11  -8  6 -4  1 -2 -3  7;
	 8 -7   1  3  -2  2 -3 -1 -5  4;
	-2  4  -7  9  -6  3 -5 -4  2;
	 9 -4  -1  5  -5  1 -8  3;
	 1  2  -5  6  -7 -2 -1;
	 7 -2  -4  4 -10  5;
	 3 -1  -6  1  -3;
	 4 -3  -9  8;
	 2 -6  -2;
	-1  1;
	 6
]
```

Modular triangular difference table of a modular analogue of a Costas array:

```
>>> [
>>> 	22 2 16 4 1 18 19 6 10 3
>>> 	9 20 14 21 17 8 7 12 15 5
>>> 	13 11
>>> ].triangularDifferenceTable { :p :q |
>>> 	(p - q).mod(22, 1)
>>> }
[
	 2 14 10 19 17  1  9  4 15  6
	11 16  7 18 13 21  5  3 12  8
	20
	;
	16  2  7 14 18 10 13 19 21 17
	 5  1  3  9 12  4  8 15 20  6
	;
	 4 21  2 15  5 14  6  3 10 11
	12 19 16  8 17  7 20  1 18
	;
	 1 16  3  2  9  7 12 14  4 18
	 8 10 15 13 20 19  6 21
	;
	18 17 12  6  2 13  1  8 11 14
	21  9 20 16 10  5  4
	;
	19  4 16 21  8  2 17 15  7  5
	20 14  1  6 18  3
	;
	 6  8  9  5 19 18  2 11 20  4
	 3 17 13 14 16
	;
	10  1 15 16 13  3 20  2 19  9
	 6  7 21 12
	;
	 3  7  4 10 20 21 11  1  2 12
	18 15 19
	;
	 9 18 20 17 16 12 10  6  5  2
	 4 13
	;
	20 12  5 13  7 11 15  9 17 10
	2
	;
	14 19  1  4  6 16 18 21  3  8
	;
	21 15 14  3 11 19  8  7  1
	;
	17  6 13  8 14  9 16  5
	;
	 8  5 18 11  4 17 14
	;
	 7 10 21  1 12 15
	;
	12 13 11  9 10
	;
	15  3 19  7
	;
	 5 11 17
	;
	13  9
	;
	11
]
```

* * *

See also: allSatisfy, differences, isDuplicateFree, subtract, triangularDifferenceTable, welchCostasArrayList

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CostasArray.html)
