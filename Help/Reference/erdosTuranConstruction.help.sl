# erdosTuranConstruction

- _erdosTuranConstruction(n)_

Implement the Erdős–Turán construction to answer a Golomb ruler for the odd prime _n_.

A Golomb ruler of order five:

```
>>> 5.erdosTuranConstruction
[0 11 24 34 41]
```

A Golomb ruler of order seven:

```
>>> 7.erdosTuranConstruction
[0 15 32 44 58 74 85]
```

Erdős-Turán Golomb rulers,
OEIS [A217793](https://oeis.org/A217793),
row lengths are odd primes:

```
>>> [3 5 7 11].collect(
>>> 	erdosTuranConstruction:/1
>>> )
[
	0 7 13;
	0 11 24 34 41;
	0 15 32 44 58 74 85;
	0 23 48 75 93 113 135 159 185 202 221
]
```

Calculate all differences for order five:

```
>>> 5.erdosTuranConstruction
>>> .triangularDifferenceTable
[
	11 13 10 7;
	24 23 17;
	34 30;
	41
]

>>> 5.erdosTuranConstruction
>>> .triangularDifferenceTable
>>> .transposeTriangle
[
	11 24 34 41;
	13 23 30;
	10 17;
	7
]
```

Erdős-Turán Golomb rulers,
OEIS [A217793](https://oeis.org/A217793):

~~~spl svg=A oeis=A217793
[3 5 7 11 13 17 19].collect(
	erdosTuranConstruction:/1
).catenate.discretePlot
~~~

![](Help/Image/erdosTuranConstruction-A.svg)

* * *

See also: optimalGolombRulers

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GolombRuler.html),
_W_
[1](https://en.wikipedia.org/wiki/Golomb_ruler)
