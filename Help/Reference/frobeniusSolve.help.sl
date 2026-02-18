# frobeniusSolve

- _frobeniusSolve(a, b)_

Answer a list of all solutions of the Frobenius equation specified by the coefficients _a_ and the sum _b_.

The two solutions of the Frobenius equation _6x + 9y + 20z = 24_:

```
>>> let a = [6 9 20];
>>> let b = 24;
>>> let x = a.frobeniusSolve(b);
>>> (x, x.dot(a))
([1 2 0; 4 0 0], x.size # [b])
```

The eight solutions of the Frobenius equation _12x + 16y + 20z + 27t = 123_:

```
>>> let a = [12 16 20 27];
>>> let b = 123;
>>> let x = a.frobeniusSolve(b);
>>> (x, x.dot(a))
(
	[
		0 1 4 1;
		0 6 0 1;
		1 4 1 1;
		2 2 2 1;
		3 0 3 1;
		4 3 0 1;
		5 1 1 1;
		8 0 0 1
	],
	x.size # [b]
)
```

Show that 43 cannot be represented as a sum of positive integer multiples of 6, 9 and 20:

```
>>> [6 9 20].frobeniusSolve(43)
[]
```

Find all such representations of 44:

```
>>> let a = [6 9 20];
>>> let b = 44;
>>> let x = a.frobeniusSolve(b);
>>> (x, x.dot(a))
([1 2 1; 4 0 1], [b b])
```

The twenty-one solutions of the Frobenius equation _5x + 8y + 9z + 12t = 67_:

```
>>> let a = [5 8 9 12];
>>> let b = 67;
>>> let x = a.frobeniusSolve(b);
>>> (x, x.dot(a))
(
	[
		0 2 3 2;
		0 5 3 0;
		1 1 2 3;
		1 1 6 0;
		1 4 2 1;
		2 0 1 4;
		2 0 5 1;
		2 3 1 2;
		2 6 1 0;
		3 2 0 3;
		3 2 4 0;
		3 5 0 1;
		4 1 3 1;
		5 0 2 2;
		5 3 2 0;
		6 2 1 1;
		7 1 0 2;
		7 4 0 0;
		8 0 3 0;
		10 1 1 0;
		11 0 0 1
	],
	x.size # [b]
)
```

Number of ways of making change for _n_ cents using coins of 1, 2, 5 and 10 cents,
OEIS [A000008](https://oeis.org/A000008):

```
>>> 0:21.collect { :n |
>>> 	[1 2 5 10].frobeniusSolve(n).size
>>> }
[
	 1  1  2  2  3  4  5  6  7  8
	11 12 15 16 19 22 25 28 31 34
	40 43
]
```

Number of ways of making change for _n_ cents using coins of 1, 5, 10 and 25 cents,
OEIS [A001299](https://oeis.org/A001299):

```
>>> 0:21.collect { :n |
>>> 	[1 5 10 25].frobeniusSolve(n).size
>>> }
[1 1 1 1 1 2 2 2 2 2 4 4 4 4 4 6 6 6 6 6 9 9]
```

Number of ordered ways of writing n as the sum of three primes,
OEIS [A098238](https://oeis.org/A098238):

```
>>> 0:23.collect { :n |
>>> 	[1 1 1].frobeniusSolve(n)
>>> 	.count { :x |
>>> 		x.allSatisfy(isPrime:/1)
>>> 	}
>>> }
[
	 0  0  0  0  0  0  1  3  3  4
	 6  6  9  6  6 10  9 12 12 12
	12 19 12 21
]
```

_n_ for which the _6,9,20_ coin problem has no solutions,
OEIS [A065003](https://oeis.org/A065003):

```
>>> 1:100.collect { :n |
>>> 	[6 9 20].frobeniusSolve(n).size
>>> }.indicesOf(0)
[
	 1  2  3  4  5  7  8 10 11 13
	14 16 17 19 22 23 25 28 31 34
	37 43
]
```

Plot number of ordered ways of writing _n_ as the sum of two triangular numbers,
OEIS [A008441](https://oeis.org/A008441):

~~~spl svg=A
0:65.collect { :n |
	[1 1].frobeniusSolve(n)
	.count { :x |
		x.allSatisfy { :i |
			(8 * i + 1).isPerfectSquare
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-A.svg)

Plot number of ways to express _2n+1_ as _p+2q_ where _p_ and _q_ are primes,
OEIS [A046927](https://oeis.org/A046927):

~~~spl svg=B
0:150.collect { :n |
	[1 2].frobeniusSolve(2 * n + 1)
	.count { :x |
		x.allSatisfy(isPrime:/1)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-B.svg)

Plot number of ordered ways of writing n as the sum of two primes,
OEIS [A073610](https://oeis.org/A073610):

~~~spl svg=C
1:115.collect { :n |
	[1 1].frobeniusSolve(n)
	.count { :x |
		x.allSatisfy(isPrime:/1)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-C.svg)

Plot number of ordered ways of writing _n_ as a sum of two squares of nonnegative integers,
OEIS [A000925](https://oeis.org/A000925):

~~~spl svg=D
0:75.collect { :n |
	[1 1].frobeniusSolve(n)
	.count { :x |
		x.allSatisfy(isPerfectSquare:/1)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-D.svg)

Plot minimal number of coins needed to pay _n_ cents using coins of 1, 5, 10 and 25 cents,
OEIS [A053344](https://oeis.org/A053344):

~~~spl svg=E
1:150.collect { :n |
	[1 5 10 25].frobeniusSolve(n)
	.collect(sum:/1)
	.min
}.scatterPlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-E.svg)

Plot number of partitions of _n_ into parts 6, 9 or 20,
OEIS [A214772](https://oeis.org/A214772):

~~~spl svg=F
0:150.collect { :n |
	[6 9 20].frobeniusSolve(n).size
}.scatterPlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-F.svg)


Plot minimal common prime of two Goldbach partitions of _2n_ and _2(n+1)_,
or zero if no common prime exists,
OEIS [A335045](https://oeis.org/A335045):

~~~spl svg=G
let d = Map { :n |
	[1 1].frobeniusSolve(2 * n)
	.select { :x |
		x.allSatisfy(isPrime:/1)
	}.catenate
};
2:55.collect { :n |
	let e = intersection(d[n], d[n + 1]);
	e.isEmpty.if {
		0
	} {
		e.min
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-G.svg)

* * *

See also: bockerLiptakAlgorithm, extendedGcd, frobeniusNumber, numberDecompose

Guides: Combinatorial Functions, Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FrobeniusEquation.html)
[2](https://reference.wolfram.com/language/ref/FrobeniusSolve.html),
_W_
[1](https://en.wikipedia.org/wiki/Coin_problem)
