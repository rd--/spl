# squareSpiralRank

- _squareSpiralRank(x, y, o=1)_

Given the integer cartesian coordinates _x,y_,
answer the _o_ indexed rank of the counter-clockwise,
and initially downward,
square spiral.

First few terms:

```
>>> [
>>> 	0 0; 1 0; 1 1; 0 1;
>>> 	-1 1; -1 0; -1 -1; 0 -1
>>> ].squareSpiralRank
[1 2 3 4 5 6 7 8]
```

Generate spiral matrices of various kinds:

```
>>> squareSpiralRank/2
>>> .swap
>>> .table(2:-2:-1, -2:2)
[
	17 16 15 14 13;
	18  5  4  3 12;
	19  6  1  2 11;
	20  7  8  9 10;
	21 22 23 24 25
]

>>> squareSpiralRank/2
>>> .table(2:-2:-1, -2:2)
[
	25 10 11 12 13;
	24  9  2  3 14;
	23  8  1  4 15;
	22  7  6  5 16;
	21 20 19 18 17
]

>>> squareSpiralRank/2
>>> .swap
>>> .table(-2:2, -2:2)
[
	21 22 23 24 25;
	20  7  8  9 10;
	19  6  1  2 11;
	18  5  4  3 12;
	17 16 15 14 13
]

>>> squareSpiralRank/2
>>> .table(-2:2, -2:2)
[
	21 20 19 18 17;
	22  7  6  5 16;
	23  8  1  4 15;
	24  9  2  3 14;
	25 10 11 12 13
]
```

The inverse is `squareSpiralUnrank`:

```
>>> [1 .. 10]
>>> .squareSpiralUnrank
>>> .squareSpiralRank
[1 .. 10]
```

Matrix plot of the first few terms:

~~~spl svg=A
squareSpiralRank/2
.swap
.table(5:-5:-1, -5:5)
.matrixPlot
~~~

![](Help/Image/squareSpiralRank-A.svg)

Squares visited by a knight moving on a spirally numbered board always to the lowest available unvisited square,
OEIS [A316667](https://oeis.org/A316667):

~~~spl svg=B oeis=A316667
let k = [
	1 -2; -1 2; -1 -2; 1 2;
	2 -1; -2 1; -2 -1; 2 1
];
let v = IdentitySet[1];
let next = { :n |
	let c = n.squareSpiralUnrank;
	let d = [c] + k;
	let p = d.squareSpiralRank.sort!;
	let m = p.detect { :i |
		v.includes(i).not
	};
	v.add(m);
	m
};
next/1.nestList(1, 115)
.scatterPlot
~~~

![](Help/Image/squareSpiralRank-B.svg)

Rotated coloured matrix plot of the first few terms:

~~~spl svg=C
squareSpiralRank/2
.table(-5:5, -5:5)
.colouredMatrixPlot
~~~

![](Help/Image/squareSpiralRank-C.svg)

* * *

See also: squareSpiral, squareSpiralUnrank

Guides: Geometry Functions, Integer Functions

References:
_OEIS_
[1](https://oeis.org/A316328)
