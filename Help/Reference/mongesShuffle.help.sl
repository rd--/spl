# mongesShuffle

- _mongesShuffle(x, n=1)_

Shuffle the list _x_ using Monge’s shuffle _n_ times.

Shuffle a `Range` once, answering a `List`:

```
>>> 1:10.mongesShuffle
[10 8 6 4 2 1 3 5 7 9]

>>> 1:12.mongesShuffle
[12 10 8 6 4 2 1 3 5 7 9 11]
```

Shuffle a list three times:

```
>>> 'abcdefghij'.characters.mongesShuffle(3)
['g' 'b' 'j' 'd' 'e' 'i' 'a' 'h' 'f' 'c']
```

For different lengths of lists, different numbers of shuffles will return them to the original ordering:

```
>>> 1:10.mongesShuffle(6)
[1 .. 10]

>>> 1:15.mongesShuffle(14)
[1 .. 15]

>>> 1:20.mongesShuffle(10)
[1 .. 20]
```

The permutations,
and permutation cycles,
of the repeated shuffles of twelve:

```
>>> 1:10.collect { :n |
>>> 	1:12.mongesShuffle(n)
>>> }
[
	12 10 8 6 4 2 1 3 5 7 9 11;
	11 7 3 2 6 10 12 8 4 1 5 9;
	9 1 8 10 2 7 11 3 6 12 4 5;
	5 12 3 7 10 1 9 8 2 11 6 4;
	4 11 8 1 7 12 5 3 10 9 2 6;
	6 9 3 12 1 11 4 8 7 5 10 2;
	2 5 8 11 12 9 6 3 1 4 7 10;
	10 4 3 9 11 5 2 8 12 6 1 7;
	7 6 8 5 9 4 10 3 11 2 12 1;
	1 2 3 4 5 6 7 8 9 10 11 12
]

>>> 1:9.collect { :n |
>>> 	1:12.mongesShuffle(n)
>>> 	.permutationCycles
>>> }
[
	1 12 11 9 5 4 6 2 10 7; 3 8:;
	1 11 5 6 10; 2 7 12 9 4:;
	1 9 6 7 11 4 10 12 5 2; 3 8:;
	1 5 10 11 6; 2 12 4 7 9:;
	1 4; 2 11; 3 8; 5 7; 6 12; 9 10:;
	1 6 11 10 5; 2 9 7 4 12:;
	1 2 5 12 10 4 11 7 6 9; 3 8:;
	1 10 6 5 11; 2 4 9 12 7:;
	1 7 10 2 6 4 5 9 11 12; 3 8
]
```

Visualize the recurring pattern when shuffling a ten-list:

~~~spl svg=A
1:20.collect { :n |
	1:10.mongesShuffle(n)
}.matrixPlot
~~~

![](Help/Image/mongesShuffle-A.svg)

Visualize the recurring pattern when shuffling a twelve-list:

~~~spl svg=B
1:20.collect { :n |
	1:12.mongesShuffle(n)
}.matrixPlot
~~~

![](Help/Image/mongesShuffle-B.svg)

* * *

See also: fisherYatesShuffle, inShuffle, outShuffle, sattoloShuffle, shuffle

Guides: Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MongesShuffle.html),
_W_
[1](https://en.wikipedia.org/wiki/Shuffling#Mongean)
