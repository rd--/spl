# mongesShuffle

- _mongesShuffle(x, n=1)_

Shuffle the list _x_ using Monge’s shuffle _n_ times.

Shuffle a `Range` once, answering a `List`:

```
>>> 1:10.mongesShuffle
[10 8 6 4 2 1 3 5 7 9]
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

Visualize the recurring pattern when shuffling a list:

~~~spl svg=A
1:20.collect { :n |
	1:10.mongesShuffle(n)
}.matrixPlot
~~~

![](sw/spl/Help/Image/mongesShuffle-A.svg)

* * *

See also: fisherYatesShuffle, inShuffle, outShuffle, sattoloShuffle, shuffle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MongesShuffle.html),
_W_
[1](https://en.wikipedia.org/wiki/Shuffling#Mongean)
