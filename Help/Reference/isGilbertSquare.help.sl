# isGilbertSquare

- _isGilbertSquare(m)_

Answer `true` if the matrix _m_ is a Gilbert square,
a Latin square in which each digram _(i,j)_,
where _i≠j_,
occurs once horizontally and once vertically.

A Gilbert square can be constructed from two permutation with dusplicate free difference sets:

```
>>> let x = [8 1 6 5 3 7 2 4];
>>> let y = [8 1 7 3 6 5 2 4];
>>> let a = x.differences % 8;
>>> let b = y.differences % 8;
>>> let m = (x +.table y).mod(8, 1);
>>> (a, b, m, m.isGilbertSquare)
(
	[1 5 7 6 4 3 2],
	[1 6 4 3 7 5 2],
	[
		8 1 7 3 6 5 2 4;
		1 2 8 4 7 6 3 5;
		6 7 5 1 4 3 8 2;
		5 6 4 8 3 2 7 1;
		3 4 2 6 1 8 5 7;
		7 8 6 2 5 4 1 3;
		2 3 1 5 8 7 4 6;
		4 5 3 7 2 1 6 8
	],
	true
)
```

The Gilbert digrams for an eight-square,
each digram occurs once horizontally and once vertically:

```
>>> 8.gilbertSquareDigrams
[
	1 2; 1 3; 1 4; 1 5; 1 6; 1 7; 1 8;
	2 1; 2 3; 2 4; 2 5; 2 6; 2 7; 2 8;
	3 1; 3 2; 3 4; 3 5; 3 6; 3 7; 3 8;
	4 1; 4 2; 4 3; 4 5; 4 6; 4 7; 4 8;
	5 1; 5 2; 5 3; 5 4; 5 6; 5 7; 5 8;
	6 1; 6 2; 6 3; 6 4; 6 5; 6 7; 6 8;
	7 1; 7 2; 7 3; 7 4; 7 5; 7 6; 7 8;
	8 1; 8 2; 8 3; 8 4; 8 5; 8 6; 8 7
]
```

Plot a Gilbert square:

~~~spl svg=A
let x = [8 1 6 5 3 7 2 4];
let y = [8 1 7 3 6 5 2 4];
(x +.table y).mod(8, 1).matrixPlot
~~~

![](Help/Image/isGilbertSquare-A.svg)

* * *

See also: isLatinSquare, tuples, welchCostasArrayList

Guides: Matrix Functions

Further Reading: Gilbert 1965
