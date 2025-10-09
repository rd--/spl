# eulerianNumber

- _eulerianNumber(n, k)_

Answer the Eulerian number _<n;k>_,
telling the number of permutations of _{1,2,…,n}_ having _k_ permutation ascents.

First few rows of the Euler triangle:

```
>>> 0:8.triangularArray(
>>> 	eulerianNumber:/2, -1
>>> )
[
	1;
	1;
	1 1;
	1 4 1;
	1 11 11 1;
	1 26 66 26 1;
	1 57 302 302 57 1;
	1 120 1191 2416 1191 120 1;
	1 247 4293 15619 15619 4293 247 1
]
```

Log scale scatter plot of first few terms:

~~~spl svg=A
(0L .. 20L).triangularArray(
	eulerianNumber:/2, -1
).catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/eulerianNumber-A.svg)

* * *

See also: eulerianNumberSecondOrder, eulerianNumberTypeB

Guides: Combinatorial Functions, Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EulerianNumber.html)
[2](https://mathworld.wolfram.com/EulersNumberTriangle.html),
_OEIS_
[1](https://oeis.org/A008292),
_W_
[1](https://en.wikipedia.org/wiki/Eulerian_number)
