# champernowneSequence

- _champernowneSequence(b, n)_

Answer the first _n_ terms of the base-_b_ Champernowne sequence,

First few terms of the base-ten Champernowne sequence,
also called the Barbier infinite word,
OEIS [A007376](https://oeis.org/A007376):

```
>>> 10.champernowneSequence(106)
[
	0 1 2 3 4 5 6 7 8 9
	1 0 1 1 1 2 1 3 1 4
	1 5 1 6 1 7 1 8 1 9
	2 0 2 1 2 2 2 3 2 4
	2 5 2 6 2 7 2 8 2 9
	3 0 3 1 3 2 3 3 3 4
	3 5 3 6 3 7 3 8 3 9
	4 0 4 1 4 2 4 3 4 4
	4 5 4 6 4 7 4 8 4 9
	5 0 5 1 5 2 5 3 5 4
	5 5 5 6 5 7
]
```

First few terms of the base-two Champernowne sequence:
OEIS [A030190](https://oeis.org/A030190):

```
>>> 2.champernowneSequence(105)
[
	0 1 1 0 1 1 1 0 0 1
	0 1 1 1 0 1 1 1 1 0
	0 0 1 0 0 1 1 0 1 0
	1 0 1 1 1 1 0 0 1 1
	0 1 1 1 1 0 1 1 1 1
	1 0 0 0 0 1 0 0 0 1
	1 0 0 1 0 1 0 0 1 1
	1 0 1 0 0 1 0 1 0 1
	1 0 1 1 0 1 0 1 1 1
	1 1 0 0 0 1 1 0 0 1
	1 1 0 1 0
]
```

Indices of ones in base-two sequence,
OEIS [A030303](https://oeis.org/A030303):

```
>>> 2.champernowneSequence(100).indicesOf(1) - 1
[
	 1  2  4  5  6  9 11 12 13 15
	16 17 18 22 25 26 28 30 32 33
	34 35 38 39 41 42 43 44 46 47
	48 49 50 55 59 60 63 65 68 69
	70 72 75 77 79 80 82 83 85 87
	88 89 90 91 95 96 99
]
```

First few terms of the base-three Champernowne sequence:
OEIS [A054635](https://oeis.org/A054635):

```
>>> 3.champernowneSequence(101)
[
	0 1 2 1 0 1 1 1 2 2
	0 2 1 2 2 1 0 0 1 0
	1 1 0 2 1 1 0 1 1 1
	1 1 2 1 2 0 1 2 1 1
	2 2 2 0 0 2 0 1 2 0
	2 2 1 0 2 1 1 2 1 2
	2 2 0 2 2 1 2 2 2 1
	0 0 0 1 0 0 1 1 0 0
	2 1 0 1 0 1 0 1 1 1
	0 1 2 1 0 2 0 1 0 2
	1
]
```

First few terms of the base-eight Champernowne sequence,
OEIS [A054634](https://oeis.org/A054634):

```
>>> 8.champernowneSequence(99)
[
	0 1 2 3 4 5 6 7 1 0
	1 1 1 2 1 3 1 4 1 5
	1 6 1 7 2 0 2 1 2 2
	2 3 2 4 2 5 2 6 2 7
	3 0 3 1 3 2 3 3 3 4
	3 5 3 6 3 7 4 0 4 1
	4 2 4 3 4 4 4 5 4 6
	4 7 5 0 5 1 5 2 5 3
	5 4 5 5 5 6 5 7 6 0
	6 1 6 2 6 3 6 4 6
]
```

Plot
OEIS [A007376](https://oeis.org/A007376):

~~~spl svg=A
10.champernowneSequence(65).stepPlot
~~~

![](sw/spl/Help/Image/champernowneSequence-A.svg)

Plot
OEIS [A030190](https://oeis.org/A030190):

~~~spl svg=B
2.champernowneSequence(65).discretePlot
~~~

![](sw/spl/Help/Image/champernowneSequence-B.svg)

Plot
OEIS [A054635](https://oeis.org/A054635):

~~~spl svg=C
3.champernowneSequence(65).stepPlot
~~~

![](sw/spl/Help/Image/champernowneSequence-C.svg)

Plot
OEIS [A054634](https://oeis.org/A054634):

~~~spl svg=D
8.champernowneSequence(128).scatterPlot
~~~

![](sw/spl/Help/Image/champernowneSequence-D.svg)

* * *

See also: copelandErdosSequence, integerDigits

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ChampernowneConstant.html)
[2](https://mathworld.wolfram.com/SmarandacheSequences.html)
[3](https://mathworld.wolfram.com/ConsecutiveNumberSequences.html)
[4](https://reference.wolfram.com/language/ref/ChampernowneNumber.html),
_OEIS_
[1](https://oeis.org/A007376)
[2](https://oeis.org/A030190)
[3](https://oeis.org/A054634)
[4](https://oeis.org/A054635),
_W_
[1](https://en.wikipedia.org/wiki/Champernowne_constant)
