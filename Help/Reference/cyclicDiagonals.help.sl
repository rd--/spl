# cyclicDiagonals

- _cyclicDiagonals(m)_

+List{
	cyclicDiagonals { :m |
		let [r, c] = m.shape;
		1:c.collect { :i |
			1:r.collect { :j |
				m[j.mod(r, 1)][(i + j - 1).mod(c, 1)]
			}
		}
	}
}

```
>>> [4 4].iota
[
	1 2 3 4;
	5 6 7 8;
	9 10 11 12;
	13 14 15 16
]

>>> [4 4].iota
>>> .cyclicDiagonals
[
	1 6 11 16;
	2 7 12 13;
	3 8 9 14;
	4 5 10 15
]
```

At a 3×4 matrix answers a 4×3 matrix:

```
>>> [3 4].iota
[
	1  2  3  4;
	5  6  7  8;
	9 10 11 12
]

>>> [3 4].iota
>>> .cyclicDiagonals
[
	1  6 11;
	2  7 12;
	3  8  9;
	4  5 10
]
```

At a 4×3 matrix answers a 3×4 matrix:

```
>>> [4 3].iota
[
	 1  2  3;
	 4  5  6;
	 7  8  9;
	10 11 12
]

>>> [4 3].iota
>>> .cyclicDiagonals
[
	1 5 9 10;
	2 6 7 11;
	3 4 8 12
]
```

A sequence of 3×3 matrix permutations:

```
>>> 3.pisanoPeriod
8

>>> let m = [3 3].iota
>>> cyclicDiagonals/1.nestList(m, 8)
[
	1 2 3;
	4 5 6;
	7 8 9
	:;
	1 5 9;
	2 6 7;
	3 4 8
	:;
	1 6 8;
	5 7 3;
	9 2 4
	:;
	1 7 4;
	6 3 9;
	8 5 2
	:;
	1 3 2;
	7 9 8;
	4 6 5
	:;
	1 9 5;
	3 8 4;
	2 7 6
	:;
	1 8 6;
	9 4 2;
	5 3 7
	:;
	1 4 7;
	8 2 5;
	6 9 3
	:;
	1 2 3;
	4 5 6;
	7 8 9
]
```

A sequence of 4×4 matrix permutations:

```
>>> 4.pisanoPeriod
6

>>> let m = [4 4].iota
>>> cyclicDiagonals/1.nestList(m, 6)
[
	1 2 3 4;
	5 6 7 8;
	9 10 11 12;
	13 14 15 16
	:;
	1 6 11 16;
	2 7 12 13;
	3 8 9 14;
	4 5 10 15
	:;
	1 7 9 15;
	6 12 14 4;
	11 13 3 5;
	16 2 8 10
	:;
	1 12 3 10;
	7 14 5 16;
	9 4 11 2;
	15 6 13 8
	:;
	1 14 11 8;
	12 5 2 15;
	3 16 9 6;
	10 7 4 13
	:;
	1 5 9 13;
	14 2 6 10;
	11 15 3 7;
	8 12 16 4
	:;
	1 2 3 4;
	5 6 7 8;
	9 10 11 12;
	13 14 15 16
]
```

Eight permutations of a 3×3 matrix:

~~~spl svg=A
cyclicDiagonals/1
.nestList([3 3].iota, 7)
.collect(matrixPlot/1)
.PlotSet([2 4])
~~~

![](Help/Image/cyclicDiagonals-A.svg)

Twenty permutations of a 5×5 matrix:

~~~spl svg=B
cyclicDiagonals/1
.nestList([5 5].iota, 19)
.collect(matrixPlot/1)
.PlotSet([4 5])
~~~

![](Help/Image/cyclicDiagonals-B.svg)

The sixteen permutations of a 7×7 matrix:

~~~spl svg=C
cyclicDiagonals/1
.nestList([7 7].iota, 15)
.collect(matrixPlot/1)
.PlotSet([4 4])
~~~

![](Help/Image/cyclicDiagonals-C.svg)

* * *

Further Reading: Patson 2007
