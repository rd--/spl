# digitCount

- _digitCount(n, b=10, d)_

Answer the number of _d_ digits in the base-_b_ representation of the integer _n_.

Consider the binary representation of a number:

```
>>> 2147.integerDigits(2)
[1 0 0 0 0 1 1 0 0 0 1 1]
```

Count the number of `one`s in the binary representation:

```
>>> 2147.digitCount(2, 1)
5
```

Count the number of `one`s and `zero`es:

```
>>> 2147.digitCount(2)
[5 7]
```

Count the number of digits _(2,1,0)_ in the ternary representation:

```
>>> 242442422.integerDigits(3)
[1 2 1 2 2 0 0 1 2 1 0 0 1 1 0 2 2 2]

>>> 242442422.digitCount(3)
[7 6 5]
```

Thue–Morse sequence:

```
>>> 1:25.collect { :n |
>>> 	1 - (n - 1).digitCount(2, 1) % 2
>>> }
[
	1 0 0 1 0 1 1 0 0 1
	1 0 1 0 0 1 0 1 1 0
	1 0 0 1 1
]
```

Total number of ones in binary expansions,
OEIS [A000788](https://oeis.org/A000788):

```
>>> 0:38.digitCount(2, 1)
>>> .accumulate
[
	 0  1  2  4  5  7  9 12 13 15
	17 20 22 25 28 32 33 35 37 40
	42 45 48 52 54 57 60 64 67 71
	75 80 81 83 85 88 90 93 96
]
```

Numbers with an odd number of ones in their binary expansion,
OEIS [A000069](https://oeis.org/A000069):

```
>>> 0:49.select { :n |
>>> 	n.digitCount(2, 1).isOdd
>>> }
[
	 1  2  4  7  8 11 13 14 16 19
	21 22 25 26 28 31 32 35 37 38
	41 42 44 47 49
]
```

Numbers with an even number of ones in their binary expansion,
OEIS [A001969](https://oeis.org/A001969):

```
>>> 0:49.select { :n |
>>> 	n.digitCount(2, 1).isEven
>>> }
[
	 0  3  5  6  9 10 12 15 17 18
	20 23 24 27 29 30 33 34 36 39
	40 43 45 46 48
]
```

Count zeroes in binary expansion,
OEIS [A023416](https://oeis.org/A023416):

```
>>> 0:99.digitCount(2, 0)
[
	1 0 1 0 2 1 1 0 3 2 2 1 2 1 1 0 4 3 3 2
	3 2 2 1 3 2 2 1 2 1 1 0 5 4 4 3 4 3 3 2
	4 3 3 2 3 2 2 1 4 3 3 2 3 2 2 1 3 2 2 1
	2 1 1 0 6 5 5 4 5 4 4 3 5 4 4 3 4 3 3 2
	5 4 4 3 4 3 3 2 4 3 3 2 3 2 2 1 5 4 4 3
]
```

Plot the number of ones in the base-two representation,
called the Hamming weight or binary weight,
OEIS [A000120](https://oeis.org/A000120):

~~~spl svg=A
1:63.functionPlot { :each |
	each.digitCount(2, 1)
}
~~~

![](sw/spl/Help/Image/digitCount-A.svg)

Plot the number of odd elements in the first _n_ rows of Pascal’s triangle,
OEIS [A006046](https://oeis.org/A006046):

~~~spl svg=B
let b = { :k | k.digitCount(2, 1) };
1:100.functionPlot { :n |
	(0 .. n - 1).collect { :k |
		2 ^ b(k)
	}.sum
}
~~~

![](sw/spl/Help/Image/digitCount-B.svg)

Plot the first few Cantor numbers,
OEIS [A005823](https://oeis.org/A005823):

~~~spl svg=C
0:3000.select { :n |
	n.digitCount(3, 1) = 0
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-C.svg)

Number of ones in binary reflected Gray code of _n_,
OEIS [A005811](https://oeis.org/A005811):

~~~spl svg=D
0:250.collect { :n |
	n.grayEncode.digitCount(2, 1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-D.svg)

Plot count of zeroes in binary expansion,
OEIS [A023416](https://oeis.org/A023416):

~~~spl svg=E
0:200.digitCount(2, 0)
.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-E.svg)

Plot total number of zeros in binary expansions,
a form of the Takagi curve,
OEIS [A059015](https://oeis.org/A059015):

~~~spl svg=F
0:63.digitCount(2, 0)
.accumulate
.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-F.svg)

* * *

See also: bitAnd, hammingDistance, hammingWeight, integerDigits, integerExponent, integerLength, thueMorse

Guides: Bitwise Functions, Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DigitCount.html)
[2](https://reference.wolfram.com/language/ref/DigitCount),
_OEIS_
[1](https://oeis.org/A000120)
[2](https://oeis.org/A006046)
[3](https://oeis.org/A005823)
[4](https://oeis.org/A005811)
[5](https://oeis.org/A000788)
[6](https://oeis.org/A000069)
[7](https://oeis.org/A001969)
[8](https://oeis.org/A023416)

Categories: Querying
