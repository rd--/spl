# elementaryCellularAutomaton

- _elementaryCellularAutomaton(rule, initialState, stepCount)_

The cell configurations and their interpretation as binary integers:

```
>>> [
>>> 	1 1 1; 1 1 0; 1 0 1; 1 0 0;
>>> 	0 1 1; 0 1 0; 0 0 1; 0 0 0
>>> ].collect { :each |
>>> 	each.fromDigits(2)
>>> }
[7 6 5 4 3 2 1 0]
```

A rule number defines the result state for each possible cell configuration:

```
>>> 30.integerDigits(2, 8)
[0 0 0 1 1 1 1 0]

>>> 18.integerDigits(2, 8)
[0 0 0 1 0 0 1 0]
```

The first two steps of rule 30:

```
>>> 30.elementaryCellularAutomaton(
>>> 	[0 0 0 1 0 0 0],
>>> 	2
>>> )
[
	0 0 0 1 0 0 0;
	0 0 1 1 1 0 0;
	0 1 1 0 0 1 0
]
```

Rule 18:

~~~spl png=A
18.elementaryCellularAutomaton(
	[1].centerArray(101, 0),
	101
).Bitmap
~~~

![](sw/spl/Help/Image/elementaryCellularAutomaton-A.png)

Rule 30:

~~~spl png=B
30.elementaryCellularAutomaton(
	[1].centerArray(101, 0),
	101
).Bitmap
~~~

![](sw/spl/Help/Image/elementaryCellularAutomaton-B.png)

Rule 57:

~~~spl png=C
57.elementaryCellularAutomaton(
	[1].centerArray(101, 0),
	101
).Bitmap
~~~

![](sw/spl/Help/Image/elementaryCellularAutomaton-C.png)

Rule 73:

~~~spl png=D
73.elementaryCellularAutomaton(
	[1].centerArray(101, 0),
	101
).Bitmap
~~~

![](sw/spl/Help/Image/elementaryCellularAutomaton-D.png)

Rule 110:

~~~spl png=E
110.elementaryCellularAutomaton(
	[1].centerArray(101, 0),
	101
).Bitmap
~~~

![](sw/spl/Help/Image/elementaryCellularAutomaton-E.png)

Rule 110, a finite spaceship pattern, moving right:

~~~spl png=F
110.elementaryCellularAutomaton(
	[
		0 0 0 1 0 0 1 1 0 1 1 1 1 1
		0 0 0 1 1 1 0 1 1 1
		0 0 0 1 0 0 1 1 0 1 1 1 1 1
	],
	100
).Bitmap
~~~

![](sw/spl/Help/Image/elementaryCellularAutomaton-F.png)

Rule 110, a finite spaceship pattern, moving left:

~~~spl png=G
110.elementaryCellularAutomaton(
	[
		0 0 0 1 0 0 1 1 0 1 1 1 1 1
		1 0 0 1 1 1 1
		0 0 0 1 0 0 1 1 0 1 1 1 1 1
	],
	200
).Bitmap
~~~

![](sw/spl/Help/Image/elementaryCellularAutomaton-G.png)

Rule 184 from a random initial state:

~~~spl png=H
184.elementaryCellularAutomaton(
	Sfc32(378452)
	.randomInteger(0, 1, [101]),
	101
).Bitmap
~~~

![](sw/spl/Help/Image/elementaryCellularAutomaton-H.png)

* * *

See also: arrayFilter, blockMap, centerArray, convolve, fromDigits, integerDigits, partition, substitutionSystem

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CellularAutomaton.html),
_SEP_
[1](https://plato.stanford.edu/entries/cellular-automata/),
_W_
[1](https://en.wikipedia.org/wiki/Elementary_cellular_automaton)
[2](https://en.wikipedia.org/wiki/Rule_110)

