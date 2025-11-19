# hammingWeight

- _hammingWeight(n)_

Answer the Hamming weight,
or binary weight,
of the integer _n_.

The first few terms,
OEIS [A000120](https://oeis.org/A000120):

```
>>> 0:31.collect(hammingWeight:/1)
[
	0 1 1 2 1 2 2 3 1 2
	2 3 2 3 3 4 1 2 2 3
	2 3 3 4 2 3 3 4 3 4
	4 5
]
```

Take modulo two it is the Thue-Morse sequence,
OEIS [A010060](https://oeis.org/A010060):

```
>>> 0:31.collect(hammingWeight:/1) % 2
32.thueMorseSequence
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

Plot integers with hamming weight of three,
OEIS [A014311](https://oeis.org/A014311):

~~~spl svg=C
0:250.select { :n |
	n.hammingWeight = 3
}.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-C.svg)

* * *

See also: digitCount, gouldsSequence, thueMorseSequence

Guides: Bitwise Functions, Integer Functions

References:
_OEIS_
[1](https://oeis.org/A000120)
[2](https://oeis.org/A010060)
[3](https://oeis.org/A014311),
_W_
[1](https://en.wikipedia.org/wiki/Hamming_weight)
