# savageWinklerAlgorithm

- _savageWinklerAlgorithm(n)_

Answer the _n_-bit Savage-Winkler monotonic Gray code.

The five-bit Savage-Winkler monotonic Gray code:

```
>>> 5L.savageWinklerAlgorithm
[
	0 0 0 0 0;
	0 0 0 0 1;
	0 0 0 1 1;
	0 0 0 1 0;
	0 0 1 1 0;
	0 0 1 0 0;
	0 1 1 0 0;
	0 1 0 0 0;
	1 1 0 0 0;
	1 0 0 0 0;
	1 0 0 0 1;
	1 0 1 0 1;
	1 0 1 0 0;
	1 0 1 1 0;
	1 0 0 1 0;
	1 1 0 1 0;
	0 1 0 1 0;
	0 1 0 1 1;
	0 1 0 0 1;
	0 1 1 0 1;
	0 0 1 0 1;
	0 0 1 1 1;
	0 1 1 1 1;
	0 1 1 1 0;
	1 1 1 1 0;
	1 1 1 0 0;
	1 1 1 0 1;
	1 1 0 0 1;
	1 1 0 1 1;
	1 0 0 1 1;
	1 0 1 1 1;
	1 1 1 1 1
]
```

The six-bit Savage-Winkler monotonic Gray code:

```
>>> 6L.savageWinklerAlgorithm
[
	0 0 0 0 0 0;
	0 0 0 0 0 1;
	0 0 0 0 1 1;
	0 0 0 0 1 0;
	0 0 0 1 1 0;
	0 0 0 1 0 0;
	0 0 1 1 0 0;
	0 0 1 0 0 0;
	0 1 1 0 0 0;
	0 1 0 0 0 0;
	1 1 0 0 0 0;
	1 0 0 0 0 0;
	1 0 1 0 0 0;
	1 0 1 1 0 0;
	1 0 0 1 0 0;
	1 0 0 1 1 0;
	1 0 0 0 1 0;
	1 0 0 0 1 1;
	1 0 0 0 0 1;
	1 1 0 0 0 1;
	0 1 0 0 0 1;
	0 1 0 1 0 1;
	0 1 0 1 0 0;
	0 1 0 1 1 0;
	0 1 0 0 1 0;
	0 1 1 0 1 0;
	0 0 1 0 1 0;
	0 0 1 0 1 1;
	0 0 1 0 0 1;
	0 0 1 1 0 1;
	0 0 0 1 0 1;
	0 0 0 1 1 1;
	0 0 1 1 1 1;
	0 0 1 1 1 0;
	0 1 1 1 1 0;
	0 1 1 1 0 0;
	0 1 1 1 0 1;
	0 1 1 0 0 1;
	0 1 1 0 1 1;
	0 1 0 0 1 1;
	1 1 0 0 1 1;
	1 1 0 0 1 0;
	1 1 0 1 1 0;
	1 1 0 1 0 0;
	1 1 0 1 0 1;
	1 0 0 1 0 1;
	1 0 1 1 0 1;
	1 0 1 0 0 1;
	1 0 1 0 1 1;
	1 0 1 0 1 0;
	1 1 1 0 1 0;
	1 1 1 0 0 0;
	1 1 1 0 0 1;
	1 1 1 1 0 1;
	1 1 1 1 0 0;
	1 1 1 1 1 0;
	1 0 1 1 1 0;
	1 0 1 1 1 1;
	1 0 0 1 1 1;
	1 1 0 1 1 1;
	0 1 0 1 1 1;
	0 1 1 1 1 1;
	1 1 1 1 1 1;
	1 1 1 0 1 1
]
```

Plot the five-bit Savage-Winkler monotonic Gray code:

~~~spl svg=A
5L.savageWinklerAlgorithm
.transpose
.matrixPlot
~~~

![](Help/Image/savageWinklerAlgorithm-A.svg)

Plot the six-bit Savage-Winkler monotonic Gray code:

~~~spl svg=B
6L.savageWinklerAlgorithm
.transpose
.matrixPlot
~~~

![](Help/Image/savageWinklerAlgorithm-B.svg)

Plot the seven-bit Savage-Winkler monotonic Gray code:

~~~spl png=C
7L.savageWinklerAlgorithm
.transpose
.Bitmap
~~~

![](Help/Image/savageWinklerAlgorithm-C.png)

* * *

See also: GrayCode

Guides: Integer Sequence Functions

Further Reading: Savage & Winkler 1995
