# grayEncode

- _grayEncode(n, b=2)_

Encode the integer _n_ using binary-reflected Gray code.
A Gray code is an encoding of numbers so that adjacent numbers have a single digit differing by `one`.

Find the Gray code of an integer:

```
>>> 14.grayEncode.integerDigits(2)
[1 0 0 1]
```

The inverse is `grayDecode`,
the middle column is OEIS [A014550](https://oeis.org/A014550):

```
>>> 0:15.collect { :n |
>>> 	let e = n.grayEncode;
>>> 	let d = e.grayDecode;
>>> 	[n, e, d].collect { :i |
>>> 		i.integerDigits(2).stringJoin
>>> 	}
>>> }
[
	   '0'    '0'    '0';
	   '1'    '1'    '1';
	  '10'   '11'   '10';
	  '11'   '10'   '11';
	 '100'  '110'  '100';
	 '101'  '111'  '101';
	 '110'  '101'  '110';
	 '111'  '100'  '111';
	'1000' '1100' '1000';
	'1001' '1101' '1001';
	'1010' '1111' '1010';
	'1011' '1110' '1011';
	'1100' '1010' '1100';
	'1101' '1011' '1101';
	'1110' '1001' '1110';
	'1111' '1000' '1111'
]
```

Threads over lists,
first terms of OEIS [A003188](https://oeis.org/A003188):

```
>>> 0:67.grayEncode
[
	 0  1  3  2  6  7  5  4 12 13
	15 14 10 11  9  8 24 25 27 26
	30 31 29 28 20 21 23 22 18 19
	17 16 48 49 51 50 54 55 53 52
	60 61 63 62 58 59 57 56 40 41
	43 42 46 47 45 44 36 37 39 38
	34 35 33 32 96 97 99 98
]
```

Gray encodings of the integers _(0, 2^k - 1)_ are a permutation:

```
>>> 0:15.grayEncode + 1
[
	 1  2  4  3
	 7  8  6  5
	13 14 16 15
	11 12 10  9
]
```

A modular ternary gray code,
OEIS [A105530](https://oeis.org/A105530):

```
>>> 0:53.collect { :n |
>>> 	n.grayEncode(3)
>>> }
[
	 0  1  2  5  3  4  7  8  6 15
	16 17 11  9 10 13 14 12 21 22
	23 26 24 25 19 20 18 45 46 47
	50 48 49 52 53 51 33 34 35 29
	27 28 31 32 30 39 40 41 44 42
	43 37 38 36
]
```

A modular decimal gray code,
OEIS [A098488](https://oeis.org/A098488):

```
>>> 0:68.collect { :n |
>>> 	n.grayEncode(10)
>>> }
[
	 0  1  2  3  4  5  6  7  8  9
	19 10 11 12 13 14 15 16 17 18
	28 29 20 21 22 23 24 25 26 27
	37 38 39 30 31 32 33 34 35 36
	46 47 48 49 40 41 42 43 44 45
	55 56 57 58 59 50 51 52 53 54
	64 65 66 67 68 69 60 61 62
]

>>> 1899.grayEncode(10)
1710

>>> 1900.grayEncode(10)
1810
```

Scatter plot of the gray encodings of the first few integers:

~~~spl svg=A
0:250.grayEncode.scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-A.svg)

Line plot of the gray encodings of the first few integers:

~~~spl svg=B
1:100.grayEncode.linePlot
~~~

![](sw/spl/Help/Image/grayEncode-B.svg)

Successive values differ in only one bit in the binary representation,
plot differences:

~~~spl svg=C
0:15.grayEncode
.integerDigits(2, 4)
.differences
.matrixPlot
~~~

![](sw/spl/Help/Image/grayEncode-C.svg)

Scatter plot of the modular ternary gray encodings of the first few integers:

~~~spl svg=D
0:225.collect { :n |
	n.grayEncode(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-D.svg)

Line plot of the modular ternary gray encodings of the first few integers:

~~~spl svg=E
0:80.collect { :n |
	n.grayEncode(3)
}.linePlot
~~~

![](sw/spl/Help/Image/grayEncode-E.svg)

* * *

See also: Binary, binaryReflectedGrayCode, bitShiftRight, bitXor, deBruijnSequence, grayDecode, isGrayCode, shiftRegisterSequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html),
_OEIS_
[1](https://oeis.org/A003188)
[2](https://oeis.org/A014550)
[3](https://oeis.org/A105530)
[4](https://oeis.org/A098488),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)
