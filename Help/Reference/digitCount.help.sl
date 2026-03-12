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

Thue–Morse sequence,
OEIS [A010060](http://oeis.org/A010060):

```
>>> 1:25.collect { :n |
>>> 	(n - 1).digitCount(2, 1) % 2
>>> }
25.thueMorseSequence
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
OEIS [A023416](https://oeis.org/A023416),
also
OEIS [A080791](https://oeis.org/A080791)
if initial terms is zero:

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

Numbers that contain a digit `zero`,
OEIS [A011540](https://oeis.org/A011540):

```
>>> 0:100.reject { :n |
>>> 	n.digitCount(10, 0) = 0
>>> }
[0 10 20 30 40 50 60 70 80 90 100]
```

Zero-free numbers,
OEIS [A052382](https://oeis.org/A052382):

```
>>> 0:18.select { :n |
>>> 	n.digitCount(10, 0) = 0
>>> }
[1 2 3 4 5 6 7 8 9 11 12 13 14 15 16 17 18]
```

_a(n-1)+f(a(n-1))_
where _f_ counts ones in the binary expansion,
OEIS [A010062](https://oeis.org/A010062):

```
>>> { :x |
>>> 	x + x.digitCount(2, 1)
>>> }.nestList(1, 23)
[
	 1  2  3  5  7 10 12 14 17 19
	22 25 28 31 36 38 41 44 47 52
	55 60 64 65
]
```

_a(n-1)+1+f(a(n-1))_
where _f_ counts zeroes in binary expansion,
OEIS [A216431](https://oeis.org/A216431),
or
OEIS [A233271](https://oeis.org/A233271)
when one is inserted at index two:

```
>>> { :x |
>>> 	x + 1 + x.digitCount(2, 0)
>>> }.nestList(0, 14)
[0 2 4 7 8 12 15 16 21 24 28 31 32 38 42]

>>> let a = { :x |
>>> 	x + 1 + x.digitCount(2, 0)
>>> }.nestList(0, 14);
>>> a.insertAt(1, 2);
>>> a
[0 1 2 4 7 8 12 15 16 21 24 28 31 32 38 42]
```

Digitally balanced numbers,
OEIS [A031443](https://oeis.org/A031443):

```
>>> 1:100.select { :n |
>>> 	n.digitCount(2, 1)
>>> 	=
>>> 	n.digitCount(2, 0)
>>> }
[2 9 10 12 35 37 38 41 42 44 49 50 52 56]
```

Numbers with distinct decimal digits.
OEIS [A010784](https://oeis.org/A010784),
and the number of _n_-digit positive integers with all digits distinct,
OEIS [A073531](https://oeis.org/A073531):

```
>>> 0:12.select { :n |
>>> 	n.digitCount(10).max = 1
>>> }
[0 1 2 3 4 5 6 7 8 9 10 12]

>>> 1:10.collect { :n |
>>> 	9 * 9.! / (10 - n).!
>>> }
[
	9 81 648 4536 27216 136080 544320
	1632960 3265920 3265920
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
OEIS [A023416](https://oeis.org/A023416),
also
OEIS [A080791](https://oeis.org/A080791)
if initial terms is zero:

~~~spl svg=E
0:200.digitCount(2, 0)
.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-E.svg)

Plot total number of zeroes in binary expansions,
a form of the Takagi curve,
OEIS [A059015](https://oeis.org/A059015):

~~~spl svg=F
0:63.digitCount(2, 0)
.accumulate
.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-F.svg)

Scatter plot of the number of ones in the binary expansion of _3ⁿ_,
OEIS [A011754](https://oeis.org/A011754):

~~~spl svg=G
(3L ^ 0:99).digitCount(2, 1)
.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-G.svg)

Plot _3^w(n)_,
OEIS [A048883](https://oeis.org/A048883):

~~~spl svg=H
0:250.collect { :n |
	3 ^ n.digitCount(2, 1)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-H.svg)

Plot OEIS [A046645](https://oeis.org/A046645):

~~~spl svg=I
2:100.collect { :n |
	n.factorInteger.sum { :x |
		let [p, e] = x;
		(2 * e) - (2 * e).digitCount(2, 1)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/digitCount-I.svg)

Numbers having no more than one zero in their binary representation,
OEIS [A089633](https://oeis.org/A089633)

~~~spl svg=J
0:1024.select { :n |
	n.digitCount(2, 0) < 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-J.svg)

Numbers having at least two zeroes in their binary representation,
OEIS [A158582](https://oeis.org/A158582)

~~~spl svg=K
0:85.select { :n |
	n.digitCount(2, 0) > 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-K.svg)

The only infinite sequence such that _a(n-1)=a(n)-f(a(n))_,
where _f_ counts ones in the binary expansion,
OEIS [A179016](https://oeis.org/A179016):

~~~spl svg=L
{ :x |
	x - x.digitCount(2, 1)
}.nestWhileList(10 ^ 3) { :x |
	x > 0
}.reverse.takeWhile { :x |
	x <= 209
}.discretePlot
~~~

![](sw/spl/Help/Image/digitCount-L.svg)

Numbers whose base three representation contains no two,
OEIS [A005836](https://oeis.org/A005836):

~~~spl svg=M
0:2186.select { :n |
	n.digitCount(3, 2) = 0
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-M.svg)

Number of first-quadrant cells born at stage _n_ of the Holladay-Ulam cellular automaton,
OEIS [A079314](https://oeis.org/A079314),
essentially also
OEIS [A147610](https://oeis.org/A147610):

~~~spl svg=N
let n = 1:85;
let w = n.digitCount(2, 1);
let a = 3 ^ (w - 1) + 1;
([1] ++ a).discretePlot
~~~

![](sw/spl/Help/Image/digitCount-N.svg)

Number of first-quadrant cells that are on after _n_-th stage of the Holladay-Ulam cellular automaton,
OEIS [A151922](https://oeis.org/A151922),
essentially also
OEIS [A151920](https://oeis.org/A151920):

~~~spl svg=O
let n = 1:85;
let w = n.digitCount(2, 1);
let a = 3 ^ (w - 1) + 1;
([1] ++ a).prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-O.svg)

_2^w(⌊(n/2))_,
OEIS [A060632](https://oeis.org/A060632):

~~~spl svg=P
let n = 0:85;
let a = 2 ^ (n / 2).floor.digitCount(2, 1);
a.discretePlot
~~~

![](sw/spl/Help/Image/digitCount-P.svg)

Count number of zero digits in _n_,
OEIS [A055641](https://oeis.org/A055641):

~~~spl svg=Q
0:150.digitCount(10, 0).discretePlot
~~~

![](sw/spl/Help/Image/digitCount-Q.svg)

_2*(n-w(n))/3_ where _w_ is the one count in the base negative two expansion,
OEIS [A073504](https://oeis.org/A073504):

~~~spl svg=R
1:50.collect { :n |
	2 * (n - n.digitCount(-2, 1)) / 3
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-R.svg)

Characteristic function of numbers with an even number of ones in their binary expansion,
OEIS [A010059](https://oeis.org/A010059):

~~~spl svg=S oeis=A010059 set=0,1
0:85.select { :n |
	n.digitCount(2, 1).isEven
}.characteristicFunction.discretePlot
~~~

![](sw/spl/Help/Image/digitCount-S.svg)

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
