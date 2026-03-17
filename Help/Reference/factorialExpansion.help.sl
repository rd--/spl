# factorialExpansion

- _factorialExpansion(n)_

Answer the factorial expansion of _n_.
The expansion is given without the implicit trailing zero.

Minimal number of factorials that add to _n_,
OEIS [A034968](https://oeis.org/A034968):

```
>>> [0 .. 105].collect { :n |
>>> 	n.factorialExpansion.sum
>>> }
[
	0 1 1 2 2 3 1 2 2 3 3 4 2 3 3 4 4 5 3 4
	4 5 5 6 1 2 2 3 3 4 2 3 3 4 4 5 3 4 4 5
	5 6 4 5 5 6 6 7 2 3 3 4 4 5 3 4 4 5 5 6
	4 5 5 6 6 7 5 6 6 7 7 8 3 4 4 5 5 6 4 5
	5 6 6 7 5 6 6 7 7 8 6 7 7 8 8 9 4 5 5 6
	6 7 5 6 6 7
]
```

Minimal number of factorials that add to _n_,
OEIS [A034968](https://oeis.org/A034968):

~~~spl svg=A oeis=A034968
0:143.collect { :n |
	n.factorialExpansion.sum
}.scatterPlot
~~~

![](Help/Image/factorialExpansion-A.svg)

Ordinal transform of minimal number of factorials that add to _n_,
OEIS [A286478](https://oeis.org/A286478):

~~~spl svg=B oeis=A286478
0:250.collect { :n |
	n.factorialExpansion.sum
}.ordinalTransform

.scatterPlot
~~~

![](Help/Image/factorialExpansion-B.svg)

* * *

See also: binaryExpansion, factorialNumberSystemDecode, factorialNumberSystemEncode

Guides: Mathematical Functions

References:
_OEIS_
[1](https://oeis.org/A034968),
_W_
[1](https://en.wikipedia.org/wiki/Factorial_number_system)
