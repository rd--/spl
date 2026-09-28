# antidiagonalRank

- _antidiagonalRank(n, k)_
- _antidiagonalRank([n k; …])_

Answer the rank of the one-indexed cell _n,k_ in the infinite falling antidiagonal matrix starting at _1,1_.

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

`antidiagonalArray` constructs an antidiagonal triangular array:

```
>>> 1:5.antidiagonalArray(
>>> 	antidiagonalRank/2
>>> )
[
	1;
	2 3;
	4 5 6;
	7 8 9 10;
	11 12 13 14 15
]

>>> [1 .. 10].takeList(1:4)
[1; 2 3; 4 5 6; 7 8 9 10]
```

First differences of each row:

```
>>> antidiagonalRank/2
>>> .table(1:6, 1:6)
>>> .collect(differences/1)
[
	1  2  3  4  5;
	2  3  4  5  6;
	3  4  5  6  7;
	4  5  6  7  8;
	5  6  7  8  9;
	6  7  8  9 10
]
```

First few terms:

~~~spl svg=A
antidiagonalRank/2
.table(1:5, 1:5)
.matrixPlot
~~~

![](Help/Image/antidiagonalRank-A.svg)

First differences of each row:

~~~spl svg=B
antidiagonalRank/2
.table(1:6, 1:6)
.collect(differences/1)
.colourMatrixPlot
~~~

![](Help/Image/antidiagonalRank-B.svg)

Squares visited by a knight moving on an antidiagonally numbered board always to the lowest available unvisited square,
OEIS [A316588](https://oeis.org/A316588):

~~~spl svg=C oeis=A316588
let k = [
	1 -2; -1 2; -1 -2; 1 2;
	2 -1; -2 1; -2 -1; 2 1
];
let v = IdentitySet[1];
let next = { :n |
	let c = n.antidiagonalUnrank;
	let d = [c] + k;
	let e = d.select { :i | i.min > 0 };
	let p = e.antidiagonalRank.sort!;
	let m = p.detect { :i |
		v.includes(i).not
	};
	v.add!(m);
	m
};
next/1.nestList(1, 115)
.scatterPlot
~~~

![](Help/Image/antidiagonalRank-C.svg)

* * *

See also: antidiagonalUnrank, squareSpiralRank

Guides: Matrix Functions
