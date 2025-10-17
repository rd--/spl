# nearestPrime

- _nearestPrime(n)_

Answer the prime number nearest _n_,
assigning ties to the smaller prime.

The nearest prime to a prime is itself:

```
>>> 23.nearestPrime
23
```

First few terms:
OEIS [A051697](http://oeis.org/A051697):

```
>>> 0:71.collect(nearestPrime:/1)
[
	 2  2  2  3  3  5  5  7  7  7
	11 11 11 13 13 13 17 17 17 19
	19 19 23 23 23 23 23 29 29 29
	29 31 31 31 31 37 37 37 37 37
	41 41 41 43 43 43 47 47 47 47
	47 53 53 53 53 53 53 59 59 59
	59 61 61 61 61 67 67 67 67 67
	71 71
]
```

Plot first few terms:

~~~spl svg=A
0:50.collect(nearestPrime:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/nearestPrime-A.svg)

* * *

See also: nextPrime, previousPrime, primePi

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NearestPrime.html),
_OEIS_
[1](http://oeis.org/A051697)
