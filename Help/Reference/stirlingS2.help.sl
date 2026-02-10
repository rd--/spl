# stirlingS2

- _stirlingS2(n, m)_

Answer the Stirling number of the second kind.

Evaluate a Stirling number of the second kind:

```
>>> stirlingS2(50, 2)
562949953421311
```

Table of first few terms,
OEIS [A008277](https://oeis.org/A008277):

```
>>> 1:9.collect { :n |
>>> 	1:n.collect { :k |
>>> 		stirlingS2(n, k)
>>> 	}
>>> }
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

Plot sums of digits:

~~~spl svg=A
{ :n :m |
	stirlingS2(n, m)
	.integerDigits
	.sum
}.table(2:17, 2:17).matrixPlot
~~~

![](sw/spl/Help/Image/stirlingS2-A.svg)

Plot parity:

~~~spl svg=B
{ :n :m |
	stirlingS2(n, m) % 2
}.table(2:23, 2:23).matrixPlot
~~~

![](sw/spl/Help/Image/stirlingS2-B.svg)

* * *

See also: bellNumber

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
