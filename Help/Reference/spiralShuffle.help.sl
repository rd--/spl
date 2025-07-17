# spiralShuffle

- _spiralShuffle(x, n=1)_

Shuffle the list _x_ using a spiral shuffle,
also called a _down-under_ shuffle,
_n_ times.

Shuffle a `Range` once, answering a `List`:

```
>>> 1:12.spiralShuffle
[8 12 4 10 6 2 11 9 7 5 3 1]
```

Shuffle sequences of increasing size:

```
>>> 5:11.collect { :n |
>>> 	1:n.spiralShuffle
>>> }
[
	2 4 5 3 1;
	4 6 2 5 3 1;
	6 2 4 7 5 3 1;
	8 4 6 2 7 5 3 1;
	2 6 8 4 9 7 5 3 1;
	4 8 10 6 2 9 7 5 3 1;
	6 10 2 8 4 11 9 7 5 3 1
]
```

Permutation cycles:

```
>>> 1:5.spiralShuffle
>>> .reversed
>>> .permutationCycles(false)
[1; 2 3 5; 4]

>>> 1:8.spiralShuffle
>>> .reversed
>>> .permutationCycles(false)
[1; 2 3 5; 4 7; 6; 8]
```

For different lengths of lists, different numbers of shuffles will return them to the original ordering:

```
>>> 1:5.spiralShuffle(5)
[1 .. 5]

>>> 1:8.spiralShuffle(4)
[1 .. 8]

>>> 1:9.spiralShuffle(6)
[1 .. 9]

>>> 1:12.spiralShuffle(12)
[1 .. 12]
```

Visualize the recurring pattern when shuffling a list:

~~~spl svg=A
1:20.collect { :n |
	1:12.spiralShuffle(n)
}.matrixPlot
~~~

![](sw/spl/Help/Image/spiralShuffle-A.svg)

* * *

See also: inShuffle, klondikeShuffle, mongesShuffle, outShuffle

Guides: Permutation Functions
