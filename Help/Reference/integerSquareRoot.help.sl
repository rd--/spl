# integerSquareRoot

- _integerSquareRoot(n)_

Answer the integer square root of the integer _n_.

```
>>> 293.integerSquareRoot
17

>>> (9 / 4).integerSquareRoot
1
```

Threads over lists:

```
>>> [4 5 8 10].integerSquareRoot
[2 2 2 3]
```

The integer square root,
OEIS [A000196](https://oeis.org/A000196):

```
>>> 0:65.integerSquareRoot
[
	0 1 1 1 2 2 2 2 2 3
	3 3 3 3 3 3 4 4 4 4
	4 4 4 4 4 5 5 5 5 5
	5 5 5 5 5 5 6 6 6 6
	6 6 6 6 6 6 6 6 6 7
	7 7 7 7 7 7 7 7 7 7
	7 7 7 7 8 8
]
```

The integer square root of odd powers of seven:

```
>>> (7L ^ 1:21:2).integerSquareRoot
[
	2
	18
	129
	907
	6352
	44467
	311269
	2178889
	15252229
	106765608
	747359260
]
```

Integer square root of a large integer:

```
>>> (7L ^ 73).integerSquareRoot
7015820362023593956150476655802L

>>> (7L ^ 73).sqrt
7015820362023593956150476655802L
```

At `zero`:

```
>>> 0.integerSquareRoot
0
```

Not defined for negative _n_:

```
>>> {
>>> 	-4.integerSquareRoot
>>> }.hasError
true
```

Show that the expression _f_ below answers non-square numbers:

```
>>> let f = { :n |
>>> 	n + ((1 / 2) + n.sqrt).floor
>>> };
>>> let isSquare = { :n |
>>> 	let r = n.integerSquareRoot;
>>> 	r.square = n
>>> };
>>> (
>>> 	1:22.collect(f:/1),
>>> 	1:1000.anySatisfy { :n |
>>> 		f(n).isSquare
>>> 	}
>>> )
(
	[
		 2  3  5  6  7  8 10 11 12 13
		14 15 17 18 19 20 21 22 23 24
		26 27
	],
	false
)
```

Integer part of square root of _4n+1_,
OEIS [A000267](https://oeis.org/A000267):

```
>>> (4 * 0:19 + 1).integerSquareRoot
[1 2 3 3 4 4 5 5 5 6 6 6 7 7 7 7 8 8 8 8]
```

Number of partitions of _n_ into two squares,
OEIS [A000161](https://oeis.org/A000161):

~~~spl svg=A oeis=A000161
1:107.collect { :n |
	let m = ((n - 1) // 2);
	let a = m.integerSquareRoot + 1;
	let b = n.integerSquareRoot;
	a:b.sum { :k |
		(n - (k ^ 2))
		.isPerfectSquare
		.boole
	}
}.discretePlot
~~~

![](Help/Image/integerSquareRoot-A.svg)

Integer part of square root of _4n+1_,
OEIS [A000267](https://oeis.org/A000267):

~~~spl svg=B oeis=A000267
(4 * 0:45 + 1).integerSquareRoot
.discretePlot
~~~

![](Help/Image/integerSquareRoot-B.svg)

Up once, down twice, up three times, down four times,
OEIS [A010751](https://oeis.org/A010751):

~~~spl svg=C
0:80.collect { :n |
	let m = (n + 1 << 3).integerSquareRoot + 1 >> 1;
	(m.bitAnd(1) = 1).if {
		n - (m.square >> 1)
	} {
		(m.square >> 1) - n
	}
}.discretePlot
~~~

![](Help/Image/integerSquareRoot-C.svg)

Pyramidal sequence,
distance to nearest triangular number,
OEIS [A053616](https://oeis.org/A053616)

~~~spl svg=D oeis=A053616
0:85.collect { :n |
	let t = (2 * n).integerSquareRoot;
	(t.square + t - (2 * n)).abs / 2
}.discretePlot
~~~

![](Help/Image/integerSquareRoot-D.svg)

* * *

See also: Integer, LargeInteger, sqrt

Guides: Integer Functions

References:
_OEIS_
[1](https://oeis.org/A000196),
_W_
[1](https://en.wikipedia.org/wiki/Integer_square_root)
