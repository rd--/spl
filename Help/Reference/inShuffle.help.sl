# inShuffle

- _inShuffle(x, n=1)_

Shuffle the list _x_ using an _in_-Faro shuffle _n_ times.

Shuffle a `Range` once, answering a `List`:

```
>>> 1:12.inShuffle
[7 1 8 2 9 3 10 4 11 5 12 6]

>>> 1:10.inShuffle
[6 1 7 2 8 3 9 4 10 5]

>>> 1:9.inShuffle
[5 1 6 2 7 3 8 4 9]

>>> 1:8.inShuffle
[5 1 6 2 7 3 8 4]
```

Shuffle a list three times:

```
>>> 1:12.inShuffle(3)
[5 10 2 7 12 4 9 1 6 11 3 8]

>>> 1:10.inShuffle(3)
[7 3 10 6 2 9 5 1 8 4]
```

For different lengths of lists, different numbers of shuffles will return them to the original ordering:

```
>>> 1:10.inShuffle(10)
[1 .. 10]

>>> 1:20.inShuffle(6)
[1 .. 20]

>>> 1:21.inShuffle(6)
[1 .. 21]
```

Visualize the recurring pattern when shuffling a list:

~~~spl svg=A
1:20.collect { :n |
	1:10.inShuffle(n)
}.matrixPlot
~~~

![](sw/spl/Help/Image/inShuffle-A.svg)

* * *

See also: fisherYatesShuffle, klondikeShuffle, mongesShuffle, outShuffle, sattoloShuffle, shuffle

Guides: Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/In-Shuffle.html),
_W_
[1](https://en.wikipedia.org/wiki/Faro_shuffle)
