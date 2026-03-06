# prefixes

- _prefixes([x₁ x₂ …])_

Answer a List of all of the prefixes of the sequence _x_.

Prefixes of the natural numbers,
OEIS [A002260](https://oeis.org/A002260):

```
>>> [1 2 3].prefixes
[1; 1 2 ; 1 2 3]

>>> [1 2 3 4 5 6 7 8 9].prefixes
[
	1;
	1 2;
	1 2 3;
	1 2 3 4;
	1 2 3 4 5;
	1 2 3 4 5 6;
	1 2 3 4 5 6 7;
	1 2 3 4 5 6 7 8;
	1 2 3 4 5 6 7 8 9
]
```

Prefixes of the odd numbers,
OEIS [A158405](https://oeis.org/A158405):

```
>>> [1 3 5 7 9 11 13 15 17].prefixes
[
	1;
	1 3;
	1 3 5;
	1 3 5 7;
	1 3 5 7 9;
	1 3 5 7 9 11;
	1 3 5 7 9 11 13;
	1 3 5 7 9 11 13 15;
	1 3 5 7 9 11 13 15 17
]
```

Of the odd numbers,
row reversed,
the sequence matrix for odd numbers,
OEIS [A099375](https://oeis.org/A099375):

```
>>> [1 3 5 7 9 11 13 15 17].prefixes
>>> .collect(reverse:/1)
[
	1;
	3 1;
	5 3 1;
	7 5 3 1;
	9 7 5 3 1;
	11 9 7 5 3 1;
	13 11 9 7 5 3 1;
	15 13 11 9 7 5 3 1;
	17 15 13 11 9 7 5 3 1
]
```

Sums of prefixes of the non-negative integers,
OEIS [A000217](https://oeis.org/A000217)

```
>>> 0:9.prefixes.collect(sum:/1)
[0 1 3 6 10 15 21 28 36 45]
```

Sequence matrix for odd numbers,
OEIS [A099375](https://oeis.org/A099375):

~~~spl svg=A
1:23:2.prefixes
.collect(reverse:/1)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/prefixes-A.svg)

Prefixes of the natural numbers,
OEIS [A002260](https://oeis.org/A002260):

~~~spl svg=B
1:13.prefixes.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/prefixes-B.svg)

Prefixes of the odd numbers,
OEIS [A158405](https://oeis.org/A158405):

~~~spl svg=C
1:23:2.prefixes.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/prefixes-C.svg)

Right-truncatable primes,
every prefix is prime,
OEIS [A024770](https://oeis.org/A024770):

~~~
1:10000.prime.select { :n |
	n.integerDigits
	.prefixes
	.allSatisfy { :x |
		x.fromDigits
		.isPrime
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/prefixes-D.svg)

* * *

See also: prefixSum, suffixes

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:inits),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bslash)
