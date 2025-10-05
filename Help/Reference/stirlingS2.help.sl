# stirlingS2

- _stirlingS2(n, m)_

Table of first few terms:

```
>>> 0:9.collect { :n |
>>> 	0:n.collect { :k |
>>> 		stirlingS2(n, k)
>>> 	}
>>> }
[
	1;
	0 1;
	0 1 1;
	0 1 3 1;
	0 1 7 6 1;
	0 1 15 25 10 1;
	0 1 31 90 65 15 1;
	0 1 63 301 350 140 21 1;
	0 1 127 966 1701 1050 266 28 1;
	0 1 255 3025 7770 6951 2646 462 36 1
]
```

Evaluate a Stirling number of the second kind:

```
>>> stirlingS2(50, 2)
562949953421311
```

Evaluate multiple Stirling numbers:

```
>>> 1:10.collect { :m |
>>> 	stirlingS2(10, m)
>>> }
[
	1 511 9330 34105 42525
	22827 5880 750 45 1
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

Plot sums of digits:

~~~spl svg=A
{ :n :m |
	stirlingS2(n, m).integerDigits.sum
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
[1](https://oeis.org/A008277),
_W_
[1](https://en.wikipedia.org/wiki/Stirling_numbers_of_the_second_kind)
