# jugglerSequence

- _jugglerSequence(a₁)_

Answer the juggler sequence beggining with the integer _a₁_,
and continuing until the sequence reaches `one`.

The first few juggler sequences,
OEIS [A389383](https://oeis.org/A389383):

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

The sequence function,
OEIS [A094683](https://oeis.org/A094683):

```
>>> 0:75.collect(jugglerMap:/1)
[
	0 1 1 5 2
	11 2 18 2 27
	3 36 3 46 3
	58 4 70 4 82
	4 96 4 110 4
	125 5 140 5 156
	5 172 5 189 5
	207 6 225 6 243
	6 262 6 281 6
	301 6 322 6 343
	7 364 7 385 7
	407 7 430 7 453
	7 476 7 500 8
	524 8 548 8 573
	8 598 8 623 8
	649
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

Log plot of table:

~~~spl svg=C
1:23.collect(jugglerSequence:/1)
.catenate
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/jugglerSequence-C.svg)

* * *

See also: ^, isEven

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/JugglerSequence.html),
_OEIS_
[1](https://oeis.org/A007320)
[2](https://oeis.org/A094716)
[3](https://oeis.org/A094683)
[4](https://oeis.org/A389383),
_W_
[1](https://en.wikipedia.org/wiki/Juggler_sequence)
