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

>>> 0:15.collect(grayDecode:/1)
[
	 0  1  3  2  7  6  4  5 15 14
	12 13  8  9 11 10
]
```

Generate the Thue–Morse sequence:

```
>>> 0:25.collect { :n |
>>> 	n.grayDecode.bitAnd(1)
>>> }
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

Generate the Rudin-Shapiro sequence:

```
>>> let n = 1:25.bitAnd(
>>> 	1:25.bitShiftRight(1)
>>> ).collect(grayDecode:/1).bitAnd(1);
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

* * *

See also: Binary, bitShiftRight, bitXor, grayEncode, rudinShapiro, thueMorseSequence

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)
