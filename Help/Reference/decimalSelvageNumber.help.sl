# decimalSelvageNumber

- _decimalSelvageNumber(k, n)_

Answer the first _n_ digits of the _k_-th decimal selvage number.

The first decimal selvage number,
OEIS [A071789](https://oeis.org/A071789):

```
>>> 1.decimalSelvageNumber(112)
[
	1 2 3 4 6 7 8 9 1 2 3 4 6 7 8 9
	0 2 3 4 5 7 8 9 0 2 3 4 5 7 8 9
	0 1 3 4 5 6 8 9 0 1 3 4 5 6 8 9
	0 1 2 4 5 6 7 9 0 1 2 4 5 6 7 9
	0 1 2 3 5 6 7 8 0 1 2 3 5 6 7 8
	0 1 2 3 4 6 7 8 9 1 2 3 4 6 7 8
	9 0 2 3 4 5 7 8 9 0 2 3 4 5 7 8
]
```

Plot:

~~~spl svg=A
1.decimalSelvageNumber(194)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-A.svg)

The second decimal selvage number,
OEIS [A071790](https://oeis.org/A071790):

```
>>> 2.decimalSelvageNumber(112)
[
	2 4 7 9 2 4 7 9 2 4 7 9
	2 4 7 9 2 4 7 9 2 4 7 9
	1 4 6 9 1 4 6 9 1 4 6 9
	1 4 6 9 1 4 6 9 1 4 6 9
	1 3 6 8 1 3 6 8 1 3 6 8
	1 3 6 8 1 3 6 8 1 3 6 8
	0 3 5 8 0 3 5 8 0 3 5 8
	0 3 5 8 0 3 5 8 0 3 5 8
	0 2 5 7 0 2 5 7 0 2 5 7
]
```

Plot:

~~~spl svg=B
2.decimalSelvageNumber(193)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-B.svg)

The third decimal selvage number,
OEIS [A071791](https://oeis.org/A071791):

```
>>> 3.decimalSelvageNumber(108)
[
	2 5 7 0 2 5 7 0
	3 5 8 0 3 5 8 1 3 6 8 1 3 6 9 1
	4 6 9 1 4 7 9 2 4 7 9 2
	5 7 0 2 5 7 0 3 5 8 0 3 5 8 1 3
	6 8 1 3 6 9 1 4 6 9 1 4
	7 9 2 4 7 9 2 5 7 0 2 5 7 0 3 5
	8 0 3 5 8 1 3 6 8 1 3 6
	9 1 4 6 9 1 4 7 9 2 4 7 9 2 5 7
]
```

Plot:

~~~spl svg=C
3.decimalSelvageNumber(206)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-C.svg)

The fourth decimal selvage number,
OEIS [A071792](https://oeis.org/A071792):

```
>>> 4.decimalSelvageNumber(100)
[
	3 7 1 4 8 2 6 9 3 7 0 4 8 2 5 9
	3 6 0 4 8 1 5 9 2 6 0 4 7 1 5 8
	2 6 0 3 7 1 4 8 2 6 9 3 7 0 4 8
	2 5 9 3 6 0 4 8 1 5 9 2 6 0 4 7
	1 5 8 2 6 0 3 7 1 4 8 2 6 9 3 7
	0 4 8 2 5 9 3 6 0 4 8 1 5 9 2 6
	0 4 7 1
]
```

Plot:

~~~spl svg=D
4.decimalSelvageNumber(193)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-D.svg)

The fifth decimal selvage number,
OEIS [A071793](https://oeis.org/A071793):

```
>>> 5.decimalSelvageNumber(100)
[
	  4 9 4 9 4 9 4 9 4 9 4 9 4 9 4 9 4 9 4
	8 3 8 3 8 3 8 3 8 3 8 3 8 3 8 3 8 3 8 3
	7 2 7 2 7 2 7 2 7 2 7 2 7 2 7 2 7 2 7 2
	6 1 6 1 6 1 6 1 6 1 6 1 6 1 6 1 6 1 6 1
	5 0 5 0 5 0 5 0 5 0 5 0 5 0 5 0 5 0 5 0
	4
]
```

Plot:

~~~spl svg=E
5.decimalSelvageNumber(198)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-E.svg)

The sixth decimal selvage number,
OEIS [A071873](https://oeis.org/A071873):

```
>>> 6.decimalSelvageNumber(100)
[
	  5 0 5 0 5 0 5 0 5 0 5 0 5 0 5 0 5 0 5
	1 6 1 6 1 6 1 6 1 6 1 6 1 6 1 6 1 6 1 6
	2 7 2 7 2 7 2 7 2 7 2 7 2 7 2 7 2 7 2 7
	3 8 3 8 3 8 3 8 3 8 3 8 3 8 3 8 3 8 3 8
	4 9 4 9 4 9 4 9 4 9 4 9 4 9 4 9 4 9 4 9
	5
]
```

Plot:

~~~spl svg=F
6.decimalSelvageNumber(198)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-F.svg)

* * *

See also: floor, mod, sum

Guides: Integer Sequence Functions
