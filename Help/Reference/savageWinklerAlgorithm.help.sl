# savageWinklerAlgorithm

- _savageWinklerAlgorithm(n)_

Answer the _n_-bit Savage-Winkler monotonic Gray code.

The five-bit Savage-Winkler monotonic Gray code:

```
>>> 5.savageWinklerAlgorithm
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
>>> 6.savageWinklerAlgorithm
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
5.savageWinklerAlgorithm
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/savageWinklerAlgorithm-A.svg)

Plot the six-bit Savage-Winkler monotonic Gray code:

~~~spl svg=B
6.savageWinklerAlgorithm
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/savageWinklerAlgorithm-B.svg)

Plot the seven-bit Savage-Winkler monotonic Gray code:

~~~spl png=C
7.savageWinklerAlgorithm
.transpose
.Bitmap
~~~

![](sw/spl/Help/Image/savageWinklerAlgorithm-C.png)

* * *

See also: GrayCode

Further Reading: Savage & Winkler 1995

