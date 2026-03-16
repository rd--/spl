# grayEncode

- _grayEncode(n, b=2)_

In the unary case, encode the integer _n_ using binary-reflected Gray code.
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
first few terms,
OEIS [A003188](https://oeis.org/A003188):

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

Square of Gray code,
OEIS [A064706](https://oeis.org/A064706):

```
>>> 0:27.grayEncode.grayEncode
[
	0 1 2 3 5 4 7 6 10 11 8 9 15 14 13 12
	20 21 22 23 17 16 19 18 30 31 28 29
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
threads over lists,
OEIS [A105530](https://oeis.org/A105530):

```
>>> 0:53.grayEncode(3)
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
>>> 0:68.grayEncode(10)
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

Reverse binary digits of gray encoding,
OEIS [A280995](https://oeis.org/A280995):

```
>>> 0:23.collect { :n |
>>> 	n.grayEncode
>>> 	.integerReverse(2)
>>> }
[
	 0  1  3  1  3  7  5  1  3 11
	15  7  5 13  9  1  3 19 27 11
	15 31 23  7
]
```

Gray encodings of integers,
scatter plot,
OEIS [A003188](https://oeis.org/A003188):

~~~spl svg=A oeis=A003188
0:250.grayEncode.scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-A.svg)

Gray encodings of integers,
line plot,
OEIS [A003188](https://oeis.org/A003188):

~~~spl svg=B oeis=A003188
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
0:225.grayEncode(3).scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-D.svg)

Line plot of the modular ternary gray encodings of the first few integers:

~~~spl svg=E
0:80.grayEncode(3).linePlot
~~~

![](sw/spl/Help/Image/grayEncode-E.svg)

First differences of Gray encoding,
log scale scatter plot,
OEIS [A055975](https://oeis.org/A055975):

~~~spl svg=F oeis=A055975 signed
0:250.grayEncode
.differences
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-F.svg)

Square of Gray code,
OEIS [A064706](https://oeis.org/A064706):

~~~spl svg=G oeis=A064706
0:127.grayEncode.grayEncode.scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-G.svg)

Consecutive powers of the Gray code permutation,
OEIS [A195467](https://oeis.org/A195467):

~~~spl svg=H oeis=A195467
0:2.collect { :i |
	let n = 2 ^ i;
	let m = 2 ^ n;
	grayEncode:/1.nestList(
		[0 .. m - 1],
		n - 1
	).catenate
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/grayEncode-H.svg)

Table of binary Walsh functions,
columns read as binary numbers,
OEIS [A197819](https://oeis.org/A197819):

~~~spl svg=I oeis=A197819
0:3.collect { :i |
	let n = 2 ^ i;
	let m = 2 ^ n;
	let a = grayEncode:/1.nestList(
		[0 .. m - 1],
		n - 1
	);
	(a % 2).transpose.collect { :d |
		d.fromDigits(2)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-I.svg)

Derivative of _n_,
OEIS [A038554](https://oeis.org/A038554):

~~~spl svg=J oeis=A038554
0:115.collect { :n |
	n.grayEncode - (2 ^ n.log2.floor)
}.discretePlot
~~~

![](sw/spl/Help/Image/grayEncode-J.svg)

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
[4](https://oeis.org/A098488)
[5](https://oeis.org/A055975)
[6](https://oeis.org/A280995),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)
