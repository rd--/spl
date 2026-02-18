# outShuffle

- _outShuffle(x, n=1)_

Shuffle the list _x_ using an _out_-Faro shuffle _n_ times.

Shuffle a `Range` once, answering a `List`:

```
>>> 1:12.outShuffle
[1 7 2 8 3 9 4 10 5 11 6 12]

>>> 1:10.outShuffle
[1 6 2 7 3 8 4 9 5 10]

>>> 1:9.outShuffle
[1 6 2 7 3 8 4 9 5]

>>> 1:8.outShuffle
[1 5 2 6 3 7 4 8]
```

Shuffle a list three times:

```
>>> 1:10.outShuffle(3)
[1 9 8 7 6 5 4 3 2 10]
```

An out shuffle does not change the first and last items for a list of even length:

```
>>> 1:6.outShuffle
[1 4 2 5 3 6]
```

An out shuffle does not change the first element:

```
>>> 1:7.outShuffle
[1 5 2 6 3 7 4]
```

For different lengths of lists, different numbers of shuffles will return them to the original ordering:

```
>>> 1:10.outShuffle(6)
[1 .. 10]

>>> 1:20.outShuffle(18)
[1 .. 20]

>>> 1:21.outShuffle(6)
[1 .. 21]
```

Visualize the recurring pattern when shuffling a list:

~~~spl svg=A
1:20.collect { :n |
	1:11.outShuffle(n)
}.matrixPlot
~~~

![](sw/spl/Help/Image/outShuffle-A.svg)


1:4.collect { :n |
	[1 .. n * 2].outShuffle(n - 1)
}

* * *

See also: fisherYatesShuffle, inShuffle, mongesShuffle, sattoloShuffle, shuffle

Guides: Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Out-Shuffle.html),
_W_
[1](https://en.wikipedia.org/wiki/Faro_shuffle)

Futher Reading: Diaconis 1983
