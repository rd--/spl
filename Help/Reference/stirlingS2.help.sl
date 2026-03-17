# stirlingS2

- _stirlingS2(n, m)_

Answer the Stirling number of the second kind.

Evaluate a Stirling number of the second kind:

```
>>> stirlingS2(50, 2)
562949953421311
```

Table of first few terms,
from one,
OEIS [A008277](https://oeis.org/A008277):

```
>>> 1:9.triangularArray(stirlingS2:/2)
[
	1;
	1 1;
	1 3 1;
	1 7 6 1;
	1 15 25 10 1;
	1 31 90 65 15 1;
	1 63 301 350 140 21 1;
	1 127 966 1701 1050 266 28 1;
	1 255 3025 7770 6951 2646 462 36 1
]
```

The tenth row:

```
>>> 1:10.collect { :k |
>>> 	stirlingS2(10, k)
>>> }
[
	1 511 9330 34105 42525
	22827 5880 750 45 1
]

>>> 10.bellNumber
115975
```

Table of first few terms,
from zero,
OEIS [A048993](https://oeis.org/A048993):

```
>>> 0:8.triangularArray(stirlingS2:/2)
[
	1;
	0 1;
	0 1 1;
	0 1 3 1;
	0 1 7 6 1;
	0 1 15 25 10 1;
	0 1 31 90 65 15 1;
	0 1 63 301 350 140 21 1;
	0 1 127 966 1701 1050 266 28 1
]
```

At zero:

```
>>> stirlingS2(0, 0)
1
```

Stirling numbers are large for moderate-size arguments:

```
>>> stirlingS2(30L, 5L)
7713000216608565000L
```

Threads over lists.
At _m=3_,
OEIS [A000392](https://oeis.org/A000392)
and A000453 [A000453](https://oeis.org/A000453):

```
>>> 1:11.stirlingS2(3)
[0 0 1 6 25 90 301 966 3025 9330 28501]

>>> 4:11.stirlingS2(4)
[1 10 65 350 1701 7770 34105 145750]
```

Stirling transform of Catalan numbers,
OEIS [A064856](https://oeis.org/A064856):

```
>>> 0:9.collect { :n |
>>> 	0:n.sum { :k |
>>> 		let c = k.catalanNumber;
>>> 		n.stirlingS2(k) * c
>>> 	}
>>> }
[
	  1    1     3     12      59
	338 2185 15613 121553 1020170
]
```

Four-dimensional pyramidal numbers
OEIS [A001296](https://oeis.org/A001296):

```
>>> 0:10.collect { :n |
>>> 	stirlingS2(n + 2, n)
>>> }
[0 1 7 25 65 140 266 462 750 1155 1705]
```

Number of necklaces of partitions of _n+1_ labeled beads,
OEIS [A000629](https://oeis.org/A000629):

```
>>> 0:8.collect { :n |
>>> 	0:n.sum { :k |
>>> 		[
>>> 			-1 ^ (n - k),
>>> 			n.stirlingS2(k),
>>> 			k.!,
>>> 			2 ^ k
>>> 		].product
>>> 	}
>>> }
[1 2 6 26 150 1082 9366 94586 1091670]
```

Rao Uppuluri-Carpenter numbers,
OEIS [A000587](https://oeis.org/A000587):

```
>>> 0:22.triangularArray(stirlingS2:/2)
>>> .collect(alternatingSum:/1)
[
	1 -1 0 1 1 -2 -9 -9 50 267 413 -2180
	-17731 -50533 110176 1966797
	9938669 8638718 -278475061
	-2540956509 -9816860358
	27172288399 725503033401
]
```

_k!×S2(n,k)_,
OEIS [A019538](https://oeis.org/A019538):

```
>>> 1:6.triangularArray { :n :k |
>>> 	k.! * n.stirlingS2(k)
>>> }
[
	1;
	1 2;
	1 6 6;
	1 14 36 24;
	1 30 150 240 120;
	1 62 540 1560 1800 720
]
```

Sum Stirling numbers modulo two scaled by _-1^(n-k)_,
OEIS [A309014](https://oeis.org/A309014):

```
>>> 0:23.collect { :n |
>>> 	0:n.sum { :k |
>>> 		(-1 ^ (n - k))
>>> 		*
>>> 		(n.stirlingS2(k) % 2)
>>> 	}
>>> }
[
	1 1 0 1 1 2 1 1 2 3 1 2 3 3 2 1 3 4 1 3
	4 5 3 2
]
```

Tangent numbers,
OEIS [A000182](https://oeis.org/A000182):

```
>>> 0:9.collect { :n |
>>> 	(1 .. 2 * n + 1).sum { :k |
>>> 		(2 ^ (2 * n + 1 - k))
>>> 		*
>>> 		(-1 ^ (n + k + 1))
>>> 		*
>>> 		k.!
>>> 		*
>>> 		(2 * n + 1).stirlingS2(k)
>>> 	}
>>> }
[
	1 2 16 272 7936 353792 22368256
	1903757312 209865342976
	29088885112832
]
```

Plot sums of digits:

~~~spl svg=A
{ :n :m |
	stirlingS2(n, m)
	.integerDigits
	.sum
}.table(2:17, 2:17).matrixPlot
~~~

![](Help/Image/stirlingS2-A.svg)

Plot parity:

~~~spl svg=B
{ :n :m |
	stirlingS2(n, m) % 2
}.table(2:23, 2:23).matrixPlot
~~~

![](Help/Image/stirlingS2-B.svg)

The triangle of Stirling numbers of the second kind,
OEIS [A008277](https://oeis.org/A008277):

~~~spl svg=C oeis=A008277
1:17.triangularArray(stirlingS2:/2)
.catenate.log.scatterPlot
~~~

![](Help/Image/stirlingS2-C.svg)

The _n_-th derivative of the logistic function,
OEIS [A163626](https://oeis.org/A163626):

~~~spl svg=D oeis=A163626
0:17.triangularArray { :n :k |
	(-1 ^ k)
	*
	k.!
	*
	(n + 1).stirlingS2(k + 1)
}.catenate.logScale.scatterPlot
~~~

![](Help/Image/stirlingS2-D.svg)

* * *

See also: bellNumber, stirlingS1

Guides: Combinatorial Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/StirlingNumberoftheSecondKind.html)
[2](https://reference.wolfram.com/language/ref/StirlingS2.html),
_OEIS_
[1](https://oeis.org/A008277)
[2](https://oeis.org/A000392)
[3](https://oeis.org/A000453),
_W_
[1](https://en.wikipedia.org/wiki/Stirling_numbers_of_the_second_kind)
