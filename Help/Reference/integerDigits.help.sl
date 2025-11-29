# integerDigits

- _integerDigits(n, base=10, numDigits=auto)_

Answer a `List` of the decimal digits in the integer _n_.

Find digits in base 10:

```
>>> 58127.integerDigits
[5 8 1 2 7]

>>> [5 8 1 2 7].fromDigits
58127
```

The sign is ignored:

```
>>> -3141.integerDigits
[3 1 4 1]
```

Find digits in base 2 & 3:

```
>>> 58127.integerDigits(2)
[1 1 1 0 0 0 1 1 0 0 0 0 1 1 1 1]

>>> 58127.integerDigits(3)
[2 2 2 1 2 0 1 2 1 2]
```

Bases larger than 10 can be used:

```
>>> 58127.integerDigits(16)
[14 3 0 15]
```

Threads over lists:

```
>>> [0 7 23].integerDigits
[0; 7; 2 3]

>>> [6 7 2 0].integerDigits(2)
[1 1 0; 1 1 1; 1 0; 0]
```

Find the digits of 7 in different bases:

```
>>> 7.integerDigits(2:4)
[1 1 1; 2 1; 1 3]
```

Find only the last 4 digits:

```
>>> 6345354.integerDigits(10, 4)
[5 3 5 4]
```

Count from zero to seven in binary, answers to three places:

```
>>> 0:7.integerDigits(2, 3)
[
	0 0 0;
	0 0 1;
	0 1 0;
	0 1 1;
	1 0 0;
	1 0 1;
	1 1 0;
	1 1 1
]

>>> 2 ^ 3
8
```

Number of ones in the ternary expansion of _n_,
OEIS [A062756](https://oeis.org/A062756):

```
>>> 0:23.collect { :i |
>>> 	i.integerDigits(3)
>>> 	.count(isOne:/1)
>>> }
[
	0 1 0 1 2 1 0 1 0 1
	2 1 2 3 2 1 2 1 0 1
	0 1 2 1
]
```

Find the the _population count_,
the number of ones in the binary representation of a non-negative integer,
for the first few powers of three:

```
>>> 0:29.collect { :i |
>>> 	(3 ^ i).integerDigits(2)
>>> 	.count(isOne:/1)
>>> }
[
	01 02 02 04 03 06 06 05 06 08
	09 13 10 11 14 15 11 14 14 17
	17 20 19 22 16 18 24 30 25 25
]
```

Least numbers whose square and cube, taken together, are pandigital _n_ times,
c.f. OEIS [A364024](https://oeis.org/A364024):

```
>>> let n = 69 ^ [2 3];
>>> (n, n.integerDigits.++.sort)
([4761 328509], [0 1 2 3 4 5 6 7 8 9])

>>> let n = 6534 ^ [2 3];
>>> (n, n.integerDigits.++.sort)
(
	[42693156 278957081304],
	[0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9]
)

>>> let n = 497375 ^ [2 3];
>>> (n, n.integerDigits.++.sort)
(
	[
		247381890625
		123041567849609380L
	],
	[
		0 0 0 1 1 1 2 2 2 3 3 3
		4 4 4 5 5 6 6 6 6 7 7
		8 8 8 8 9 9 9
	]
)

>>> 46839081L ^ [2 3]
[
	2193899508924561L,
	102760236804377735568441L
]

>>> 4641856941L ^ [2 3]
[
	21546835860709877481L,
	100017329596623853972439445621L
]
```

`integerDigits` discards the sign:

```
>>> -22.integerDigits
[2 2]
```

Create a Champernowne word, c.f. OEIS [A007376](https://oeis.org/A007376):

```
>>> 0:29.collect(integerDigits:/1).++
[
	0 1 2 3 4 5 6 7 8 9
	1 0 1 1 1 2 1 3 1 4
	1 5 1 6 1 7 1 8 1 9
	2 0 2 1 2 2 2 3 2 4
	2 5 2 6 2 7 2 8 2 9
]
```

It is an error if the operand is not an integer:

```
>>> {
>>> 	-3.141.integerDigits
>>> }.hasError
true
```

First few non-trivial palindromic prime numbers:

```
>>> 99.primesList.select { :x |
>>> 	let d = x.integerDigits;
>>> 	d.size > 1 & { d = d.reverse }
>>> }
[11 101 131 151 181 191 313 353 373 383]
```

Calculate the Thue-Morse sequence,
OEIS [A010060](https://oeis.org/A010060):

```
>>> 0:35.collect { :n |
>>> 	integerDigits(n, 2).count { :x |
>>> 		x = 1
>>> 	}.isOdd.boole
>>> }
[
	0 1 1 0 1 0 0 1 1 0
	0 1 0 1 1 0 1 0 0 1
	0 1 1 0 0 1 1 0 1 0
	0 1 1 0 0 1
]
```

At `Decimal`,
answer the list of significant digits without indicating the location of the decimal place,
see also `realDigits`:

```
>>> 3.141D.integerDigits
[3 1 4 1]

>>> 0.010D.integerDigits
[0 1 0]
```

Numbers with exactly three ones in binary expansion,
OEIS [A014311](https://oeis.org/A014311):

```
>>> 1:99.select { :n |
>>> 	integerDigits(n, 2)
>>> 	.countOccurences(1) = 3
>>> }
[
	 7 11 13 14 19 21 22 25 26 28
	35 37 38 41 42 44 49 50 52 56
	67 69 70 73 74 76 81 82 84 88
	97 98
]
```

OEIS [A029931](https://oeis.org/A029931):

```
>>> 0:77.collect { :n |
>>> 	let b = n.integerDigits(2);
>>> 	b.dot([b.size .. 1; -1])
>>> }
[
	 0  1  2  3  3  4  5  6  4  5
	 6  7  7  8  9 10  5  6  7  8
	 8  9 10 11  9 10 11 12 12 13
	14 15  6  7  8  9  9 10 11 12
	10 11 12 13 13 14 15 16 11 12
	13 14 14 15 16 17 15 16 17 18
	18 19 20 21  7  8  9 10 10 11
	12 13 11 12 13 14 14 15
]
```

Compositions,
OEIS [A101211](https://oeis.org/A101211),
and [A227736](https://oeis.org/A227736) for reverse:

```
>>> 1:34.collect { :n |
>>> 	n.integerDigits(2)
>>> 	.split(=)
>>> 	.collect(size:/1)
>>> }
[
	1;
	1 1;
	2;
	1 2;
	1 1 1;
	2 1;
	3;
	1 3;
	1 2 1;
	1 1 1 1;
	1 1 2;
	2 2;
	2 1 1;
	3 1;
	4;
	1 4;
	1 3 1;
	1 2 1 1;
	1 2 2;
	1 1 1 2;
	1 1 1 1 1;
	1 1 2 1;
	1 1 3;
	2 3;
	2 2 1;
	2 1 1 1;
	2 1 2;
	3 2;
	3 1 1;
	4 1;
	5;
	1 5;
	1 4 1;
	1 3 1 1
]
```

Compositions in reverse lexicographic order,
OEIS [A066099](https://oeis.org/A066099):

```
>>> 0:40.collect { :n |
>>> 	let a = n.integerDigits(2);
>>> 	let b = a.reverse;
>>> 	let c = b.indicesOf(1);
>>> 	let d = [0] ++ c;
>>> 	let e = d.differences;
>>> 	e.reverse
>>> }
[
	;
	1;
	2;
	1 1;
	3;
	2 1;
	1 2;
	1 1 1;
	4;
	3 1;
	2 2;
	2 1 1;
	1 3;
	1 2 1;
	1 1 2;
	1 1 1 1;
	5;
	4 1;
	3 2;
	3 1 1;
	2 3;
	2 2 1;
	2 1 2;
	2 1 1 1;
	1 4;
	1 3 1;
	1 2 2;
	1 2 1 1;
	1 1 3;
	1 1 2 1;
	1 1 1 2;
	1 1 1 1 1;
	6;
	5 1;
	4 2;
	4 1 1;
	3 3;
	3 2 1;
	3 1 2;
	3 1 1 1;
	2 4
]
```

Subsets of integers arranged in Yates order,
OEIS [A048793](https://oeis.org/A048793):

```
>>> 0:30.collect { :n |
>>> 	n.integerDigits(2)
>>> 	.reverse
>>> 	.indicesOf(1)
>>> }
[
	;
	1;
	2;
	1 2;
	3;
	1 3;
	2 3;
	1 2 3;
	4;
	1 4;
	2 4;
	1 2 4;
	3 4;
	1 3 4;
	2 3 4;
	1 2 3 4;
	5;
	1 5;
	2 5;
	1 2 5;
	3 5;
	1 3 5;
	2 3 5;
	1 2 3 5;
	4 5;
	1 4 5;
	2 4 5;
	1 2 4 5;
	3 4 5;
	1 3 4 5;
	2 3 4 5
]
```

Concatenate the decimal numbers _n,n-1,…,1_,
OEIS [A000422](https://oeis.org/A000422):

```
>>> 1:10.collect { :n |
>>> 	n:1:-1.collect(integerDigits:/1)
>>> 	.catenate
>>> 	.fromDigits
>>> }
[
	1
	21
	321
	4321
	54321
	654321
	7654321
	87654321
	987654321
	10987654321
]
```

Scatter plot of first few terms of OEIS [A265326](https://oeis.org/A265326):

~~~spl svg=A
let k = 200;
1:k.collect { :n |
	let m = n.prime;
	let r = m.integerDigits(2).reverse;
	m - r.fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-A.svg)

Scatter plot of first few terms of OEIS [A117966](https://oeis.org/A117966):

~~~spl svg=B
let k = 123;
0:k.collect { :i |
	i.integerDigits(3).collect { :n |
		(n = 2).if { -1 } { n }
	}.fromDigits(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-B.svg)

Plot bit patterns for _n_-bit integers:

~~~spl svg=C
let n = 6;
let m = 2 ^ (n - 1) - 1;
0:m.collect { :i |
	i.integerDigits(2, n)
}.matrixPlot
~~~

![](sw/spl/Help/Image/integerDigits-C.svg)

Scatter plot of first few terms of OEIS [A160855](https://oeis.org/A160855):

~~~spl svg=D
let m = 250;
let a = [];
let k = 1;
1.toDo(m) { :n |
	let k = 1;
	{
		a.includes(k) | {
			let p = a.sum + k;
			let q = p.integerDigits(2);
			let r = n.integerDigits(2);
			let s = q.sequencePosition(r);
			s = []
		}
	}.whileTrue {
		k := k + 1
	};
	a.add(k)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-D.svg)

Scatter plot of every fourth item of the first few terms of OEIS [A063543](https://oeis.org/A063543):

~~~spl svg=E
1:1000:4.collect { :n |
	let d = n.integerDigits;
	n - d.reject(isZero:/1).product
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-E.svg)

Scatter plot of the first half of the integer digits of the decimal representation of _1/503_:

~~~spl svg=F
Decimal(1/503, 251)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-F.svg)

Plot number of runs in binary expansion of _n_,
OEIS [A005811](https://oeis.org/A005811):

~~~spl svg=G
1:255.collect { :n |
	n.integerDigits(2)
	.split(=)
	.collect(size:/1)
	.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-G.svg)

Plot product of run lengths in binary representation,
OEIS [A167489](https://oeis.org/A167489):

~~~spl svg=H
0:250.collect { :n |
	n.integerDigits(2)
	.split(=)
	.collect(size:/1)
	.product
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-H.svg)

Count the number of occurrences of the _n_-th digit of the sequence among the first _n_ digits,
OEIS [A322182](https://oeis.org/A322182):

~~~spl svg=I
let a = [1];
let d = [1];
2.toDo(200) { :i |
	let p = d[i - 1];
	let q = (1 .. i - 1).sum { :j |
		(d[j] = p).boole
	};
	a.add(q);
	d.addAll(q.integerDigits)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-I.svg)

Plot product of decimal digits of _n_,
OEIS [A007954](https://oeis.org/A007954):

~~~spl svg=J
1:150.collect { :n |
	n.integerDigits.product
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-J.svg)

* * *

See also: digitCount, fromDigits, hammingWeight

Guides: Bitwise Functions, Integer Functions, Integer Sequence Functions, Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Digit.html)
[2](https://reference.wolfram.com/language/ref/IntegerDigits.html),
_OEIS_
[1](https://oeis.org/A062756)
[2](https://oeis.org/A364024)
[3](https://oeis.org/A007376)
[4](https://oeis.org/A265326)
[5](https://oeis.org/A117966)
[6](https://oeis.org/A160855)
[7](https://oeis.org/A010060)
[8](https://oeis.org/A063543)
[9](https://oeis.org/A005811)
[10](https://oeis.org/A014311)
[11](https://oeis.org/A029931)
[12](https://oeis.org/A066099)
[13](https://oeis.org/A048793)
[14](https://oeis.org/A167489)
[15](https://oeis.org/A101211)
[16](https://oeis.org/A322182)
[17](https://oeis.org/A007954)
[18](https://oeis.org/A000422),
_W_
[1](https://en.wikipedia.org/wiki/Numerical_digit)

Further Reading: Blum 1986

Categories: Converting
