# jugglerSequence

- _jugglerSequence(a₁)_

Answer the juggler sequence beggining with the integer _a₁_,
and continuing until the sequence reaches `one`.

The first few juggler sequences:

```
>>> 1:10.collect(jugglerSequence:/1)
[
	1;
	2 1;
	3 5 11 36 6 2 1;
	4 2 1;
	5 11 36 6 2 1;
	6 2 1;
	7 18 4 2 1;
	8 2 1;
	9 27 140 11 36 6 2 1;
	10 3 5 11 36 6 2 1
]
```

The size of the first few sequences,
OEIS [A007320](https://oeis.org/A007320):

```
>>> 1:97.collect { :a |
>>> 	a.jugglerSequence.size - 1
>>> }
[
	 0  1  6  2  5  2  4  2  7  7
	 4  7  4  7  6  3  4  3  9  3
	 9  3  9  3 11  6  6  6  9  6
	 6  6  8  6  8  3 17  3 14  3
	 5  3  6  3  6  3  6  3 11  5
	11  5 11  5 11  5  5  5 11  5
	11  5  5  3  5  3 11  3 14  3
	 5  3  8  3  8  3 19  3  8  3
	10  8  8  8 11  8 10  8 11  8
	11  8 11  8  8  8 11
]
```

The largest value in trajectory of under the juggler map:
OEIS [A094716](https://oeis.org/A094716):

```
>>> 1:40.collect { :a |
>>> 	a.jugglerSequence.max
>>> }
[
	1 2 36 4 36
	6 18 8 140 36
	36 36 46 36 58
	16 70 18 140 20
	140 22 110 24 52214
	36 140 36 156 36
	172 36 2598 36 2978
	36 24906114455136 38 233046 40
]
```

Plot of sizes:

~~~spl svg=A
1:150.collect { :a |
 	a.jugglerSequence.size - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/jugglerSequence-A.svg)

Log scale plot of heights:

~~~spl svg=B
1:250.collect { :a |
 	a.jugglerSequence.max
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/jugglerSequence-B.svg)

* * *

See also: ^, isEven

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/JugglerSequence.html),
_OEIS_
[1](https://oeis.org/A007320)
[2](https://oeis.org/A094716),
_W_
[1](https://en.wikipedia.org/wiki/Juggler_sequence)
