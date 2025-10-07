# eulerianNumberTypeB

- _eulerianNumberTypeB(n, k)_

Answer the Eulerian number of Type-B.

First few rows of the Type-B Euler triangle:

```
>>> 1:7.numberTriangle(
>>> 	eulerianNumberTypeB:/2
>>> )
[
	1;
	1 1;
	1 6 1;
	1 23 23 1;
	1 76 230 76 1;
	1 237 1682 1682 237 1;
	1 722 10543 23548 10543 722 1
]
```

Log scale scatter plot of first few terms:

~~~spl svg=A
(0L .. 20L).numberTriangle(
	eulerianNumberTypeB:/2, -1
).catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/eulerianNumberTypeB-A.svg)

* * *

See also: eulerianNumber, eulerianNumberSecondOrder

Guides: Combinatorial Functions, Permutation Functions

References:
_OEIS_
[1](https://oeis.org/A060187),
_W_
[1](https://en.wikipedia.org/wiki/Eulerian_number)
