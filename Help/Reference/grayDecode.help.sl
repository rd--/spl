# grayDecode

- _grayDecode(n)_

The inverse of `grayEncode`, decodes the integer _n_.

Find the integer corresponding to a given Gray code:

```
>>> 9.grayDecode
14
```

Decode encoded first few integers:

```
>>> [
>>> 	0   1  3  2
>>> 	6   7  5  4
>>> 	12 13 15 14
>>> 	10 11  9  8
>>> ].collect(grayDecode:/1)
[0 .. 15]
```

Threads over lists,
first terms of
OEIS [A006068](https://oeis.org/A006068):

```
>>> 0:63.grayDecode
[
	 0  1  3  2  7  6  4  5 15 14
	12 13  8  9 11 10 31 30 28 29
	24 25 27 26 16 17 19 18 23 22
	20 21 63 62 60 61 56 57 59 58
	48 49 51 50 55 54 52 53 32 33
	35 34 39 38 36 37 47 46 44 45
	40 41 43 42
]
```

Generate the Thue–Morse sequence,
OEIS [A010060](http://oeis.org/A010060):

```
>>> 0:25.grayDecode.bitAnd(1)
[
	0 1 1 0 1 0 0 1 1 0
	0 1 0 1 1 0 1 0 0 1
	0 1 1 0 0 1
]

>>> 26.thueMorseSequence
[
	0 1 1 0 1 0 0 1 1 0
	0 1 0 1 1 0 1 0 0 1
	0 1 1 0 0 1
]
```

Generate the Rudin-Shapiro sequence,
OEIS [A020985](http://oeis.org/A020985):

```
>>> let n = 1:25.bitAnd(
>>> 	1:25.bitShiftRight(1)
>>> ).grayDecode.bitAnd(1);
>>> 1 - (2 * n)
[
	 1  1 -1  1  1 -1  1  1  1  1
	-1 -1 -1  1 -1  1  1  1 -1  1
	 1 -1  1 -1 -1
]

>>> 1:25.rudinShapiro
[
	 1  1 -1  1  1 -1  1  1  1  1
	-1 -1 -1  1 -1  1  1  1 -1  1
	 1 -1  1 -1 -1
]
```

Square of Gray decode,
OEIS [A064707](https://oeis.org/A064707):

```
>>> 0:27.grayDecode.grayDecode
[
	0 1 2 3 5 4 7 6 10 11 8 9 15 14 13 12
	21 20 23 22 16 17 18 19 31 30 29 28
]
```

Gray decode,
OEIS [A006068](https://oeis.org/A006068):

~~~spl svg=A oeis=A006068
0:127.grayDecode.scatterPlot
~~~

![](sw/spl/Help/Image/grayDecode-A.svg)

Square of Gray decode,
OEIS [A064707](https://oeis.org/A064707):

~~~spl svg=B oeis=A064707
0:127.grayDecode.grayDecode.scatterPlot
~~~

![](sw/spl/Help/Image/grayDecode-B.svg)

* * *

See also: Binary, bitShiftRight, bitXor, grayEncode, rudinShapiro, thueMorseSequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html),
_OEIS_
[1](https://oeis.org/A006068),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)
