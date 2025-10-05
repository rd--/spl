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

Scatter plot of first few terms of OEIS [A265326](https://oeis.org/A265326):

~~~spl svg=A
{ :n |
	let m = n.prime;
	let r = m.integerDigits(2).reverse;
	m - r.fromDigits(2)
}.map(1:200).scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-A.svg)

Scatter plot of first few terms of OEIS [A117966](https://oeis.org/A117966):

~~~spl svg=B
{ :i |
	i.integerDigits(3).collect { :n |
		(n = 2).if { -1 } { n }
	}.fromDigits(3)
}.map(0:200).scatterPlot
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

* * *

See also: digitCount, fromDigits

Guides: Bitwise Functions, Integer Functions,Integer Sequence Functions, Mathematical Functions

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

Categories: Converting
