# stemLeafPlot

- _stemLeafPlot(aCollection)_

Answer a stem-and-leaf plot for the real-valued integer in _aCollection_.

Plot of real values scaled and rounded:

```
>>> (
>>> 	[1.2 2.5 4.1 1.6 3.8 2.6 2.9] * 10
>>> ).rounded.stemLeafPlot
[
	1 -> [2 6],
	2 -> [5 6 9],
	3 -> [8],
	4 -> [1]
]
```

Plot of integers:

```
>>> [
>>> 	44 46 47 49 63 64 66 68 68 72
>>> 	72 75 76 81 84 88 106
>>> ].stemLeafPlot
[
	4 -> [4 6 7 9],
	6 -> [3 4 6 8 8],
	7 -> [2 2 5 6],
	8 -> [1 4 8],
	10 -> [6]
]
```

Plot of integers with negative values:

```
>>> [
>>> 	-22 12 -28 52 39 -2 12 10 11 11
>>> 	42 38 44 18 44 9
>>> ].stemLeafPlot
[
	-2 -> [2 8],
	-0 -> [2],
	 0 -> [9],
	 1 -> [2 2 0 1 1 8],
	 3 -> [9 8],
	 4 -> [2 4 4],
	 5 -> [2]
]
```

Plot of larger data set:

```
>>> let x = [
>>> 	-22 12 -28 52 39 -2 12 10 11 11
>>> 	42 38 44 18 44 37 113 124 37 48
>>> 	127 36 29 31 125 139 131 115 105
>>> 	132 104 123 35 113 122 42 117 119
>>> 	58 109 23 105 63 27 44 105 99 41
>>> 	128 121 116 125 32 61 37 127 29 113
>>> 	121 58 114 126 53 114 96 25 109 7
>>> 	31 141 46 -13 71 43 117 116 27 7
>>> 	68 40 31 115 124 42 128 52 71 118
>>> 	117 38 27 106 33 117 116 111 40
>>> 	119 47 105 57 122 109 124 115 43
>>> 	120 43 27 27 18 28 48 125 107 114
>>> 	34 133 45 120 30 127 31 116 146 21
>>> 	23 30 10 20 21 30 0 100 110 1 20 0
>>> ];
>>> x.stemLeafPlot
[
	-2 -> [2 8],
	-1 -> [3],
	-0 -> [2],
         0 -> [7 7 0 1 0],
	 1 -> [2 2 0 1 1 8 8 0],
	 2 -> [9 3 7 9 5 7 7 7 7 8 1 3 0 1 0],
	 3 -> [9 8 7 7 6 1 5 2 7 1 1 8 3 4 0 1 0 0],
	 4 -> [2 4 4 8 2 4 1 6 3 0 2 0 7 3 3 8 5],
	 5 -> [2 8 8 3 2 7],
	 6 -> [3 1 8],
	 7 -> [1 1],
	 9 -> [9 6],
	10 -> [5 4 9 5 5 9 6 5 9 7 0],
	11 -> [3 5 3 7 9 6 3 4 4 7 6 5 8 7 7 6 1 9 5 4 6 0],
	12 -> [4 7 5 3 2 8 1 5 7 1 6 4 8 2 4 0 5 0 7],
	13 -> [9 1 2 3],
	14 -> [1 6]
]
```

Formatted plot of primes up to one-hundred:

```
>>> let p = 1:100.select(isPrime:/1).stemLeafPlot;
>>> p.collect { :each |
>>> 	[each.key, '|', each.value].stringJoin
>>> }
[
	'0|2357'
	'1|1379'
	'2|39'
	'3|17'
	'4|137'
	'5|39'
	'6|17'
	'7|139'
	'8|39'
	'9|7'
]
```

* * *

See also: discretePlot, linePlot, scatterPlot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Stem-and-LeafDiagram.html)
[2](https://reference.wolfram.com/language/StatisticalPlots/ref/StemLeafPlot.html),
_Octave_
[1](https://octave.sourceforge.io/octave/function/stemleaf.html),
_W_
[1](https://en.wikipedia.org/wiki/Stem-and-leaf_display)

Further Reading: Tukey 1977
