# klondikeShuffle

- _klondikeShuffle(x, n=1)_

Shuffle the list _x_ using a klondike shuffle,
also called a milk shuffle,
_n_ times.

Shuffle a `Range` once, answering a `List`:

```
>>> 1:12.klondikeShuffle
[6 7 5 8 4 9 3 10 2 11 1 12]
```

Shuffle sequences of increasing size:

```
>>> 5:11.collect { :n |
>>> 	1:n.klondikeShuffle
>>> }
[
	3 2 4 1 5;
	3 4 2 5 1 6;
	4 3 5 2 6 1 7;
	4 5 3 6 2 7 1 8;
	5 4 6 3 7 2 8 1 9;
	5 6 4 7 3 8 2 9 1 10;
	6 5 7 4 8 3 9 2 10 1 11
]
```

Permutation cycles:

```
>>> 1:5.klondikeShuffle
>>> .permutationCycles(false)
[1 3 4; 2; 5]

>>> 1:8.klondikeShuffle
>>> .permutationCycles(false)
[1 4 6 7; 2 5; 3; 8]
```

For different lengths of lists, different numbers of shuffles will return them to the original ordering:

```
>>> 1:5.klondikeShuffle(3)
[1 .. 5]

>>> 1:8.klondikeShuffle(4)
[1 .. 8]

>>> 1:9.klondikeShuffle(4)
[1 .. 9]

>>> 1:12.klondikeShuffle(11)
[1 .. 12]
```

Visualize the recurring pattern when shuffling a list:

~~~spl svg=A
1:20.collect { :n |
	1:12.klondikeShuffle(n)
}.matrixPlot
~~~

![](sw/spl/Help/Image/klondikeShuffle-A.svg)

* * *

See also: inShuffle, mongesShuffle, outShuffle, spiralShuffle

Guides: Permutation Functions
