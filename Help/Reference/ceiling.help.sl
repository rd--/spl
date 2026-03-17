# ceiling

- _ceiling(x)_

Answer the integer nearest _x_ toward infinity.

At integers:

```
>>> 1.ceiling
1

>>> -2.ceiling
-2
```

At real numbers:

```
>>> 1.1.ceiling
2

>>> -2.1.ceiling
-2

>>> (3 / 2).ceiling
2

>>> (-3 / 2).ceiling
-1
```

At `Fraction`:

```
>>> 3/2.ceiling
2

>>> -3/2.ceiling
-1
```

Threads over lists:

```
>>> [-2, -1.5 .. 2].ceiling
[-2 -1 -1 0 0 1 1 2 2]
```

A self-generating sequence,
OEIS [A005041](https://oeis.org/A005041):

```
0:7.collect { :n |
	List(
		((n + 1) / 3).ceiling + 1,
		n + 1
	)
}
[
	1 1;
	2 2;
	3 3;
	4 4 4;
	5 5 5;
	6 6 6;
	7 7 7 7;
	8 8 8 8
]
```

The unary operator form is `>`:

```
>>> 3.141.>
4
```

_Σ{k=1:n}⌈(n/k)_,
OEIS [A006590](https://oeis.org/A006590):

```
>>> 1:23.collect { :n |
>>> 	1:n.sum { :k |
>>> 		(n / k).ceiling
>>> 	}
>>> }
[
	 1  3  6  9 13 16 21 24 29 33
	38 41 48 51 56 61 67 70 77 80
	87 92 97
]
```

Smallest number of stones in Tchoukaillon solitaire that make use of _n_-th hole,
OEIS [A002491](https://oeis.org/A002491):

```
>>> 0:22.collect { :n |
>>> 	let x = 1;
>>> 	x:n.do { :p |
>>> 		let a = n + 2 - p;
>>> 		let b = n + 1 - p;
>>> 		x := (a * x / b).ceiling
>>> 	};
>>> 	x
>>> }
[
	1 2 4 6 10 12 18 22 30 34 42 48 58 60
	78 82 102 108 118 132 150 154 174
]
```

Arima sequence,
OEIS [A005578](https://oeis.org/A005578):

```
>>> 0:12.collect { :n | (2 ^ n / 3).ceiling }
[1 1 2 3 6 11 22 43 86 171 342 683 1366]

>>> linearRecurrence([2 1 -2], [1 1 2], 13)
[1 1 2 3 6 11 22 43 86 171 342 683 1366]
```

Ceiling is a staircase function:

~~~spl svg=A
(0 -- 7).functionPlot(ceiling:/1)
~~~

![](sw/spl/Help/Image/ceiling-A.svg)

Canonical enumeration of integers,
OEIS [A001057](https://oeis.org/A001057):

~~~spl svg=B oeis=A001057
0:99.collect { :n |
	(-1 ^n) * (n / 2).ceiling
}.discretePlot
~~~

![](sw/spl/Help/Image/ceiling-B.svg)

Shortest representation of _-n_ in twos-complement format,
OEIS [A010078](https://oeis.org/A010078):

~~~spl svg=C oeis=A010078
1:85.collect { :n |
	2 ^ (n.log2 + 1).ceiling - n
}.scatterPlot
~~~

![](sw/spl/Help/Image/ceiling-C.svg)

Irregular triangle read by rows in which column _k_ lists _k_ copies of every positive integer in nondecreasing order,
and the first element of column _k_ is in row _k(k+1)/2_,
OEIS [A235791](https://oeis.org/A235791):

~~~spl svg=D oeis=A235791
1:24.collect { :n |
	let m = n.inverseTriangularNumber;
	1:m.collect { :k |
		let a = (n + 1) / k;
		let b = (k + 1) / 2;
		(a - b).ceiling
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/ceiling-D.svg)

Where supported `ceiling` is displayed as ⌈.

* * *

See also: floor, max, min, round, roundUp

Guides: Rounding Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Ceiling),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:ceiling),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/gtdot),
_Mathematica_
[1](https://mathworld.wolfram.com/CeilingFunction.html)
[2](https://reference.wolfram.com/language/ref/Ceiling.html),
_OEIS_
[1](https://oeis.org/A005041),
_Smalltalk_
5.6.2.18,
_W_
[1](https://en.wikipedia.org/wiki/Ceiling_function)

Unicode: U+02308 ⌈ Left Ceiling, U+2309 ⌉ Right Ceiling

Categories: Truncating and rounding
