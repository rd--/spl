# helicalScanMatrix

- _helicalScanMatrix([x₁ x₂ …], [m n], [i=1 j=1])_

Rearrange the elements in _x_ by filling a matrix in a helical fashion.
_m_ and _n_ are the rows and columns of the matrix.
_i_ and _j_ are the row and column increments.
Helical fashion means that the items are placed along diagonals of the matrix.

Helical scan of _1:12_ on a _3×4_ matrix:

```
>>> [1 .. 12].helicalScanMatrix([3 4])
[
	1 10  7  4;
	5  2 11  8;
	9  6  3 12
]
```

Helical scan of _1:12_ on a _3×4_ matrix with _i=2_:

```
>>> [1 .. 12].helicalScanMatrix([3 4], [2 1])
[
	1 10  7  4;
	9  6  3 12;
	5  2 11  8
]
```

Helical scan of _1:12_ on a _3×4_ matrix with _i=2,j=3_:

```
>>> [1 .. 12].helicalScanMatrix([3 4], [2 3])
[
	1 4 7 10;
	9 12 3 6;
	5 8 11 2
]
```

If _x_ has the integers from one to _m×n_,
where _m_ and _n_ are coprime,
answers the unique _m×n_ matrix
such that, modulo _n_, row values are equal to the row index,
and, modulo _m_, column values are equal to the column index:

```
>>> [1 .. 12].helicalScanMatrix([3 4])
[
	1 10  7  4;
	5  2 11  8;
	9  6  3 12
]

>>> { :i :j |
>>> 	1:12.detect { :n |
>>> 		n.mod(3, 1) = i & {
>>> 			n.mod(4, 1) = j
>>> 		}
>>> 	}
>>> }.array([3 4])
[
	1 10  7  4;
	5  2 11  8;
	9  6  3 12
]

>>> let m = [1 10 7 4; 5 2 11 8; 9 6 3 12];
>>> (m.mod(3, 1), m.mod(4, 1))
(
	[1 1 1 1; 2 2 2 2; 3 3 3 3],
	[1 2 3 4; 1 2 3 4; 1 2 3 4]
)
```

Equivalent zero indexed modulus:

```
>>> [0 .. 11].helicalScanMatrix([3 4])
[
	0  9  6  3;
	4  1 10  7;
	8  5  2 11
]

>>> { :i :j |
>>> 	0:11.detect { :n |
>>> 		n % 3 = (i - 1) & {
>>> 			n % 4 = (j - 1)
>>> 		}
>>> 	}
>>> }.array([3 4])
[
	0  9  6  3;
	4  1 10  7;
	8  5  2 11
]

>>> let m = [0 9 6 3; 4 1 10 7; 8 5 2 11];
>>> (m % 3, m % 4)
(
	[
		0 0 0 0;
		1 1 1 1;
		2 2 2 2
	],
	[
		0 1 2 3;
		0 1 2 3;
		0 1 2 3
	]
)
```

Helical scan of _1:60_ on a _5×12_ matrix:

```
>>> [1 .. 60].helicalScanMatrix([5 12])
[
	 1 26 51 16 41  6 31 56 21 46 11 36;
	37  2 27 52 17 42  7 32 57 22 47 12;
	13 38  3 28 53 18 43  8 33 58 23 48;
	49 14 39  4 29 54 19 44  9 34 59 24;
	25 50 15 40  5 30 55 20 45 10 35 60
]

>>> [1 .. 60].helicalScanMatrix([5 12])
>>> .mod(5, 1)
1:5.collect { :n | List(12, n) }

>>> [1 .. 60].helicalScanMatrix([5 12])
>>> .mod(12, 1)
{ [1 .. 12] } ! 5
```

Helical scan of _0:87_ on a _8×11_ matrix,
the substrate of the sieve of Xenakis’ _Nekuïa_:

```
>>> [0 .. 87].helicalScanMatrix([8 11])
[
	 0 56 24 80 48 16 72 40  8 64 32;
	33  1 57 25 81 49 17 73 41  9 65;
	66 34  2 58 26 82 50 18 74 42 10;
	11 67 35  3 59 27 83 51 19 75 43;
	44 12 68 36  4 60 28 84 52 20 76;
	77 45 13 69 37  5 61 29 85 53 21;
	22 78 46 14 70 38  6 62 30 86 54;
	55 23 79 47 15 71 39  7 63 31 87
]
```

Helical scan of _0:79_ on a _5×16_ matrix:
the substrate of the sieve of Xenakis’ _Akea_:

```
>>> [0 .. 79].helicalScanMatrix([5 16])
[
	 0 65 50 35 20  5 70 55
	40 25 10 75 60 45 30 15
	;
	16  1 66 51 36 21  6 71
	56 41 26 11 76 61 46 31
	;
	32 17  2 67 52 37 22  7
	72 57 42 27 12 77 62 47
	;
	48 33 18  3 68 53 38 23
	 8 73 58 43 28 13 78 63
	;
	64 49 34 19  4 69 54 39
	24  9 74 59 44 29 14 79
]
```

Helical scan of _0:89_ on a _9×10_ matrix,
the substrate of the sieve of Xenakis’ _Mists_:

```
>>> [0 .. 89].helicalScanMatrix([9 10])
[
	 0 81 72 63 54 45 36 27 18  9;
	10  1 82 73 64 55 46 37 28 19;
	20 11  2 83 74 65 56 47 38 29;
	30 21 12  3 84 75 66 57 48 39;
	40 31 22 13  4 85 76 67 58 49;
	50 41 32 23 14  5 86 77 68 59;
	60 51 42 33 24 15  6 87 78 69;
	70 61 52 43 34 25 16  7 88 79;
	80 71 62 53 44 35 26 17  8 89
]
```

Helical scan of _0:9_ on a _2×5_ matrix:

```
>>> [0 .. 9].helicalScanMatrix([2 5])
[
	0 6 2 8 4;
	5 1 7 3 9
]
```

Helical scan of _1:12_ on a _3×4_ matrix:

~~~spl svg=A
[1 .. 12].helicalScanMatrix([3 4])
.matrixPlot
~~~

![](Help/Image/helicalScanMatrix-A.svg)

Helical scan of _1:60_ on a _5×12_ matrix:

~~~spl svg=B
[1 .. 60].helicalScanMatrix([5 12])
.matrixPlot
~~~

![](Help/Image/helicalScanMatrix-B.svg)

Helical scan of _0:87_ on a _8×11_ matrix:

~~~spl svg=C
[0 .. 87].helicalScanMatrix([8 11])
.matrixPlot
~~~

![](Help/Image/helicalScanMatrix-C.svg)

Helical scan of _0:79_ on a _5×16_ matrix:

~~~spl svg=D
[0 .. 79].helicalScanMatrix([5 16])
.matrixPlot
~~~

![](Help/Image/helicalScanMatrix-D.svg)

Helical scan of _0:89_ on a _9×10_ matrix,

~~~spl svg=E
[0 .. 89].helicalScanMatrix([9 10])
.matrixPlot
~~~

![](Help/Image/helicalScanMatrix-E.svg)

The inverse is `helicalScanMatrixData`:

```
>>> [1 .. 12].helicalScanMatrix([3 4])
>>> .helicalScanMatrixData
[1 .. 12]

>>> [1 .. 12].reshape([3 4])
>>> .helicalScanMatrixData
[1 6 11 4 5 10 3 8 9 2 7 12]
```

* * *

See also: constantArray, mod

Guides: Matrix Functions

References:
_Mathworks_
[1](https://mathworks.com/help/comm/ref/helscandeintrlv.html),
_W_
[1](https://en.wikipedia.org/wiki/Helical_scan)

Further Reading: Exarchos 2007
