# hammersleyPointSet

- _hammersleyPointSet(d, n)_

Answer the _n_ place Hammersley point set in _d_ dimensions.

Hammersley point set where _d=2_:

```
>>> 2.hammersleyPointSet(9)
[
	1/2 1/9;
	1/4 2/9;
	3/4 1/3;
	1/8 4/9;
	5/8 5/9;
	3/8 2/3;
	7/8 7/9;
	1/16 8/9;
	9/16 1/1
]
```

Hammersley point set where _d=2_:

~~~spl svg=A
2.hammersleyPointSet(100).scatterPlot
~~~

![](Help/Image/hammersleyPointSet-A.svg)

* * *

See also: haltonSequence, poissonDiskSampling, vanDerCorputNumber

Guides: Geometric Functions, Low-Discrepancy Sequence Functions, Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HammersleyPointSet.html),
_W_
[1](https://en.wikipedia.org/wiki/Hammersley_set)

Further Reading: Hammersley 1960
