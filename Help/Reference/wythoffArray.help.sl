# wythoffArray

- _wythoffArray(m, n)_

Answer the `Integer` at row _m_ and column _n_ of the infinite Wythoff array.
Every positive integer occurs exactly once in the array,
and every integer sequence defined by the Fibonacci recurrence can be derived by shifting a row of the array.

The first nine rows and columns of the Wythoff array:

```
>>> wythoffArray:/2
>>> .table(1:9, 1:9)
[
	 1   2   3   5   8  13  21  34   55;
	 4   7  11  18  29  47  76 123  199;
	 6  10  16  26  42 68  110 178  288;
	 9  15  24  39  63 102 165 267  432;
	12  20  32  52  84 136 220 356  576;
	14  23  37  60  97 157 254 411  665;
	17  28  45  73 118 191 309 500  809;
	19  31  50  81 131 212 343 555  898;
	22  36  58  94 152 246 398 644 1042
]
```

First column,
called the Wythoff compound sequence,
OEIS [A003622](https://oeis.org/A003622):

```
>>> 1:15.collect { :i | wythoffArray(i, 1) }
[1 4 6 9 12 14 17 19 22 25 27 30 33 35 38]
```

Wythoff array read by falling antidiagonals,
OEIS [A035513](https://oeis.org/A035513):

```
>>> 9.antidiagonalArray(wythoffArray:/2)
[
	1;
	2 4;
	3 7 6;
	5 11 10 9;
	8 18 16 15 12;
	13 29 26 24 20 14;
	21 47 42 39 32 23 17;
	34 76 68 63 52 37 28 19;
	55 123 110 102 84 60 45 31 22
]
```

Wythoff array read by rising antidiagonals,
OEIS [A083412](https://oeis.org/A083412):

```
>>> 9.antidiagonalArray(
>>> 	wythoffArray:/2.swap
>>> )
[
	1;
	4 2;
	6 7 3;
	9 10 11 5;
	12 15 16 18 8;
	14 20 24 26 29 13;
	17 23 32 39 42 47 21;
	19 28 37 52 63 68 76 34;
	22 31 45 60 84 102 110 123 55
]
```

Plot Wythoff array read by falling antidiagonals,
OEIS [A035513](https://oeis.org/A035513):

~~~spl svg=A
10.antidiagonalArray(
	wythoffArray:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffArray-A.svg)

Plot Wythoff array read by rising antidiagonals,
OEIS [A083412](https://oeis.org/A083412):

~~~spl svg=B
10.antidiagonalArray(
	wythoffArray:/2.swap
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffArray-B.svg)

Matrix plot of Wythoff array:

~~~spl svg=C
wythoffArray:/2.table(1:13, 1:13)
.log.matrixPlot
~~~

![](sw/spl/Help/Image/wythoffArray-C.svg)

* * *

See also: dispersionArray, fibonacci, stolarskyArray, wythoffLower, wythoffPair, wythoffUpper

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WythoffArray.html),
_OEIS_
[1](https://oeis.org/A003622)
[2](https://oeis.org/A035513),
_W_
[1](https://en.wikipedia.org/wiki/Wythoff_array)

Further Reading: Fraenkel 1994, Morrison 1980

Categories: Matrix
