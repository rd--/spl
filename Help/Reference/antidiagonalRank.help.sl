# antidiagonalRank

- _antidiagonalRank(n, k)_

Answer the rank of the cell _n,k_ in the infinite falling antidiagonal matrix.

First few terms:

```
>>> antidiagonalRank/2
>>> .table(1:5, 1:5)
[
	 1  2  4  7 11;
	 3  5  8 12 17;
	 6  9 13 18 24;
	10 14 19 25 32;
	15 20 26 33 41
]
```

First few terms:

~~~spl svg=A
antidiagonalRank/2
.table(1:5, 1:5)
.matrixPlot
~~~

![](Help/Image/antidiagonalRank-A.svg)

* * *

See also: squareSpiralRank

Guides: Matrix Functions
