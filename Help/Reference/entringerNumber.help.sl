# entringerNumber

- _entringerNumber(n, k)_

Answer the _n,k_ Entringer number.

```
>>> entringerNumber(8, 5)
1202
```

First few terms of the Entringer triangle,
OEIS [A008282](https://oeis.org/A008282):

```
>>> 0:7.triangularArray(
>>> 	entringerNumber:/2
>>> )
[
	1;
	0 1;
	0 1 1;
	0 1 2 2;
	0 2 4 5 5;
	0 5 10 14 16 16;
	0 16 32 46 56 61 61;
	0 61 122 178 224 256 272 272
]
```

First few terms of the Entringer triangle,
OEIS [A008282](https://oeis.org/A008282),
also,
with rows reversed,
OEIS [A010094](https://oeis.org/A010094):

```
>>> 1:8.triangularArray(
>>> 	entringerNumber:/2
>>> )
[
	1;
	1 1;
	1 2 2;
	2 4 5 5;
	5 10 14 16 16;
	16 32 46 56 61 61;
	61 122 178 224 256 272 272;
	272 544 800 1024 1202 1324 1385 1385
]
```

The Entringer triangle,
log scale scatter plot of first few terms,
OEIS [A008282](https://oeis.org/A008282):

~~~spl svg=A oeis=A008282
1:11.triangularArray(
 	entringerNumber:/2
).catenate.scatterPlot.logScale
~~~

![](Help/Image/entringerNumber-A.svg)

* * *

See also: entringerTriangle, seidelEntringerArnoldTriangle, seidelTriangle

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EntringerNumber.html),
_OEIS_
[1](https://oeis.org/A008281)
[2](https://oeis.org/A008282)
