# hammingWeight

- _hammingWeight(n)_

Answer the Hamming weight,
or binary weight,
of the integer _n_.

```
>>> 0:31.collect(hammingWeight:/1)
[
	0 1 1 2 1 2 2 3 1 2
	2 3 2 3 3 4 1 2 2 3
	2 3 3 4 2 3 3 4 3 4
	4 5
]
```

Scatter plot first few terms:

~~~spl svg=A
0:99.collect(
	hammingWeight:/1
).scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-A.svg)

Line plot of the first eight-bit integers:

~~~spl svg=B
0:255.collect(
	hammingWeight:/1
).linePlot
~~~

![](sw/spl/Help/Image/hammingWeight-B.svg)

* * *

See also: digitCount

Guides: Bitwise Functions, Integer Functions

References:
_OEIS_
[1](https://oeis.org/A000120),
_W_
[1](https://en.wikipedia.org/wiki/Hamming_weight)
