# orderedDifferences

- _orderedDifferences([x₁ x₂ …], d=1)_

Answer a triangular array giving the ordered differences of _x_.
The first row tells the differences to the second place,
from the left,
the second row to the third place,
and so on.
If _d=0_ the table includes differences of entries with themselves,
in all cases zero.

Ordered differences of primes,
OEIS [A204890](https://oeis.org/A204890),
also with rows reversed,
OEIS [A090321](https://oeis.org/A090321):

```
>>> 1:10.prime
[2 3 5 7 11 13 17 19 23 29]

>>> 1:10.prime.orderedDifferences
[
	1;
	3 2;
	5 4 2;
	9 8 6 4;
	11 10 8 6 2;
	15 14 12 10 6 4;
	17 16 14 12 8 6 2;
	21 20 18 16 12 10 6 4;
	27 26 24 22 18 16 12 10 6
]
```

The first differences are the outermost diagonal:

```
>>> 1:10.prime.differences
[1 2 2 4 2 4 2 4 6]
```

The interleaved differences at odd and even indices are the next diagonal:

```
>>> let p = 1:10.prime;
>>> let a = p[1:9:2].differences;
>>> let b = p[2:10:2].differences;
>>> [a b].interleave
[3 4 6 6 6 6 6 10]
```

And so on:

```
>>> let p = 1:10.prime;
>>> let a = p[1:10:3].differences;
>>> let b = p[2:8:3].differences;
>>> let c = p[3:9:3].differences;
>>> [a b c].interleave.take(7)
[5 8 8 10 8 10 12]
```

Ordered differences of primes,
_d=0_,
OEIS [A086800](https://oeis.org/A086800):

```
>>> 1:10.prime.orderedDifferences(0)
[
	0;
	1 0;
	3 2 0;
	5 4 2 0;
	9 8 6 4 0;
	11 10 8 6 2 0;
	15 14 12 10 6 4 0;
	17 16 14 12 8 6 2 0;
	21 20 18 16 12 10 6 4 0;
	27 26 24 22 18 16 12 10 6 0
]
```

Ordered differences of Fibonacci numbers,
OEIS [A204922](https://oeis.org/A204922):

```
>>> 2:11.fibonacci
[1 2 3 5 8 13 21 34 55 89]

>>> 2:11.fibonacci.orderedDifferences
[
	1;
	2 1;
	4 3 2;
	7 6 5 3;
	12 11 10 8 5;
	20 19 18 16 13 8;
	33 32 31 29 26 21 13;
	54 53 52 50 47 42 34 21;
	88 87 86 84 81 76 68 55 34
]
```

Ordered differences of primes,
OEIS [A204890](https://oeis.org/A204890):

~~~spl svg=A oeis=A204890
1:11.prime
.orderedDifferences
.catenate
.scatterPlot
~~~

![](Help/Image/orderedDifferences-A.svg)

Ordered differences of Fibonacci numbers,
OEIS [A204922](https://oeis.org/A204922):

~~~spl svg=B oeis=A204922
2:11.fibonacci
.orderedDifferences
.catenate
.scatterPlot
~~~

![](Help/Image/orderedDifferences-B.svg)

Ordered differences of primes,
row reversed,
OEIS [A090321](https://oeis.org/A090321):

~~~spl svg=C oeis=A090321
1:11.prime
.orderedDifferences
.collect(reverse:/1)
.catenate
.scatterPlot
~~~

![](Help/Image/orderedDifferences-C.svg)

* * *

See also: differences

Guides: List Functions
