# primeDistance

- _primeDistance(n)_

Answer the absolute difference between _n_ and the nearest prime.

First few terms:
OEIS [A051699](http://oeis.org/A051699):

```
>>> 0:104.collect(primeDistance:/1)
[
	2 1 0 0 1 0 1 0 1 2
	1 0 1 0 1 2 1 0 1 0
	1 2 1 0 1 2 3 2 1 0
	1 0 1 2 3 2 1 0 1 2
	1 0 1 0 1 2 1 0 1 2
	3 2 1 0 1 2 3 2 1 0
	1 0 1 2 3 2 1 0 1 2
	1 0 1 0 1 2 3 2 1 0
	1 2 1 0 1 2 3 2 1 0
	1 2 3 4 3 2 1 0 1 2
	1 0 1 0 1
]
```

Plot first few terms:

~~~spl svg=A
0:150.collect(primeDistance:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/primeDistance-A.svg)

* * *

See also: nearestPrime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeDistance.html),
_OEIS_
[1](https://oeis.org/A051699)
