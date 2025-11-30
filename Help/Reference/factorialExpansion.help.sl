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

Plot:

~~~spl svg=A
[0 .. 143].collect { :n |
	n.factorialExpansion.sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/factorialExpansion-A.svg)

* * *

See also: binaryExpansion, factorialNumberSystemDecode, factorialNumberSystemEncode

Guides: Mathematical Functions

References:
_OEIS_
[1](https://oeis.org/A034968),
_W_
[1](https://en.wikipedia.org/wiki/Factorial_number_system)
