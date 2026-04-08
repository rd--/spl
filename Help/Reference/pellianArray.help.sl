# pellianArray

- _pellianArray(n, k)_

Answer the _n,k_ entry in the Pellian array.

Pellian array:

```
>>> pellianArray:/2.table(0:7, 0:7)
[
	0 1 0 2 0 4 0 8;
	1 1 2 2 4 4 8 8;
	2 3 4 6 8 12 16 24;
	5 7 10 14 20 28 40 56;
	12 17 24 34 48 68 96 136;
	29 41 58 82 116 164 232 328;
	70 99 140 198 280 396 560 792;
	169 239 338 478 676 956 1352 1912
]
```

Pellian array,
read by falling antidiagonals,
OEIS [A228405](https://oeis.org/A228405):

```
>>> 0:8.antidiagonalArray(
>>> 	pellianArray:/2
>>> )
[
	0;
	1 1;
	0 1 2;
	2 2 3 5;
	0 2 4 7 12;
	4 4 6 10 17 29;
	0 4 8 14 24 41 70;
	8 8 12 20 34 58 99 169;
	0 8 16 28 48 82 140 239 408
]
```

Pellian array,
read by falling antidiagonals,
OEIS [A228405](https://oeis.org/A228405):

~~~spl svg=A oeis=A228405
0:9.antidiagonalArray(
	pellianArray:/2
).catenate.discretePlot
~~~

![](Help/Image/pellianArray-A.svg)

Pellian array,
read by falling antidiagonals,
log scale scatter plot,
OEIS [A228405](https://oeis.org/A228405):

~~~spl svg=B oeis=A228405
0:17.antidiagonalArray(
	pellianArray:/2
).catenate.scatterPlot.log
~~~

![](Help/Image/pellianArray-B.svg)

* * *

See also: pellNumber

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A228405)
