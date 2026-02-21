# integerExponent

- _integerExponent(n, b)_

Answers the highest power of _b_ that divides _n_.

The number of trailing zeroes:

```
>>> 1230000.integerExponent(10)
4
```

The highest power of two:

```
>>> ((2 ^ 10) + (2 ^ 7))
>>> .integerExponent(2)
7
```

Number of trailing zeroes in factorials,
OEIS [A027868](https://oeis.org/A027868):

```
>>> [1L .. 40L].collect { :n |
>>> 	n.factorial.integerExponent(10)
>>> }
[
	0 0 0 0 1 1 1 1 1 2
	2 2 2 2 3 3 3 3 3 4
	4 4 4 4 6 6 6 6 6 7
	7 7 7 7 8 8 8 8 8 9
]
```

Powers of two in successive integers,
known as the ruler sequence,
OEIS [A007814](https://oeis.org/A007814):

```
>>> 1:40.collect { :n |
>>> 	n.integerExponent(2)
>>> }
[
	0 1 0 2 0 1 0 3 0 1
	0 2 0 1 0 4 0 1 0 2
	0 1 0 3 0 1 0 2 0 1
	0 5 0 1 0 2 0 1 0 3
]
```

A formula for Hamming weight,
OEIS [A000120](https://oeis.org/A000120):

```
>>> [1L .. 30L].collect { :n |
>>> 	n - n.factorial.integerExponent(2)
>>> }
[
	1 1 2 1 2 2 3 1 2 2 3 2 3 3 4
	1 2 2 3 2 3 3 4 2 3 3 4 3 4 4
]
```

Moves for the _n_-disk pyramid puzzle,
known as the ruler function,
OEIS [A001511](https://oeis.org/A001511):

```
>>> [3 4 5].collect { :n |
>>> 	let m = (2 ^ n) - 1;
>>> 	1:m.collect { :each |
>>> 		each.integerExponent(2) + 1
>>> 	}
>>> }
[
	1 2 1 3 1 2 1;
	1 2 1 3 1 2 1 4 1 2 1 3 1 2 1;
	1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5
	1 2 1 3 1 2 1 4 1 2 1 3 1 2 1
]
```

A sequence related to the Josephus problem,
OEIS [A025480](https://oeis.org/A025480):

```
>>> 1:84.collect { :n |
>>> 	let m = n.integerExponent(2);
>>> 	bitShiftRight(n, m + 1)
>>> }
[
	 0  0  1  0  2  1  3  0  4  2
	 5  1  6  3  7  0  8  4  9  2
	10  5 11  1 12  6 13  3 14  7
	15  0 16  8 17  4 18  9 19  2
	20 10 21  5 22 11 23  1 24 12
	25  6 26 13 27  3 28 14 29  7
	30 15 31  0 32 16 33  8 34 17
	35  4 36 18 37  9 38 19 39  2
	40 20 41 10
]
```

Numbers without a superior odd divisor,
OEIS [A116882](https://oeis.org/A116882),
and the complement sequence
[A116883](https://oeis.org/A116883):

```
>>> 1:639.select { :n |
>>> 	let m = n.integerExponent(2);
>>> 	2 ^ (2 * m) >= n
>>> }
[
	  1   2   4   8  12
	 16  24  32  40  48
	 56  64  80  96 112
	128 144 160 176 192
	208 224 240 256 288
	320 352 384 416 448
	480 512 544 576 608
]

>>> 1:83.select { :n |
>>> 	let m = n.integerExponent(2);
>>> 	n >= (4 ^ m)
>>> }
[
	 1  3  5  6  7  9 10 11 13 14
	15 17 18 19 20 21 22 23 25 26
	27 28 29 30 31 33 34 35 36 37
	38 39 41 42 43 44 45 46 47 49
	50 51 52 53 54 55 57 58 59 60
	61 62 63 65 66 67 68 69 70 71
	72 73 74 75 76 77 78 79 81 82
	83
]
```

Exponent of the largest power of two dividing _(2n)!_,
OEIS [A005187](https://oeis.org/A005187):

```
>>> 0:51.collect { :n |
>>> 	(2 * n).!.integerExponent(2)
>>> }
[
	 0  1  3  4  7  8 10 11 15 16
	18 19 22 23 25 26 31 32 34 35
	38 39 41 42 46 47 49 50 53 54
	56 57 63 64 66 67 70 71 73 74
	78 79 81 82 85 86 88 89 94 95
	97 98
]
```

Complement,
OEIS [A055938](https://oeis.org/A055938):

```
>>> 0:99.complement(
>>> 	0:51.collect { :n |
>>> 		(2 * n).!.integerExponent(2)
>>> 	}
>>> )
[
	 2  5  6  9 12 13 14 17 20 21
	24 27 28 29 30 33 36 37 40 43
	44 45 48 51 52 55 58 59 60 61
	62 65 68 69 72 75 76 77 80 83
	84 87 90 91 92 93 96 99
]
```

Plot first few terms for for _b=2_,
OEIS [A007814](https://oeis.org/A007814):

~~~spl svg=A
1:127.functionPlot { :n |
	n.integerExponent(2)
}
~~~

![](sw/spl/Help/Image/integerExponent-A.svg)

Plot the self-descriptive sequence
OEIS [A110963](https://oeis.org/A110963):

~~~spl svg=B
1:100.collect { :n |
	{ :x |
		let a = x.integerExponent(2);
		let b = x.bitShiftRight(a);
		(b + 1) / 2
	}.iterate(n, 2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerExponent-B.svg)

Plot number of zeroes at the end of _n_ when written in base ten,
OEIS [A122840](https://oeis.org/A122840):

~~~spl svg=C
1:200.collect { :n |
	n.integerExponent(10)
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-C.svg)

An experimental sequence by D.J. Sycamore,
OEIS [A366601](https://oeis.org/A366601):

~~~spl svg=D
let a = { :n |
	let m = integerExponent(n, 2) + 1;
	bitShiftRight(n, m)
};
let c = [0];
250.timesRepeat {
	let x = c.last;
	let k = c.occurrencesOf(x);
	(k = 1).if {
		let i = a(x + 1);
		let j = c[i + 1];
		c.add(j)
	} {
		c.add(k - 1)
	}
};
c.scatterPlot
~~~

![](sw/spl/Help/Image/integerExponent-D.svg)

Count nonsingular complex Hermitian matrices,
OEIS [A037227](https://oeis.org/A037227):

~~~spl svg=E
1:120.collect { :n |
	2 * n.integerExponent(2) + 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerExponent-E.svg)

First differences of
complement of
exponent of the largest power of two dividing _(2n)!_,
OEIS [A279340](https://oeis.org/A279340):

~~~spl svg=F
0:99.complement(
	0:51.collect { :n |
		(2 * n).!.integerExponent(2)
	}
).differences.stepPlot
~~~

![](sw/spl/Help/Image/integerExponent-F.svg)

Plot 2-adic valuation of _τ(n)_,
OEIS [A295664](https://oeis.org/A295664):

~~~spl svg=G
1:120.collect { :n |
	0.divisorSigma(n).integerExponent(2)
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-G.svg)

Plot 2-adic valuation of _σ(n)_,
OEIS [A336937](https://oeis.org/A336937):

~~~spl svg=H
1:120.collect { :n |
	1.divisorSigma(n).integerExponent(2)
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-H.svg)

Plot OEIS [A371094](https://oeis.org/A371094):

~~~spl svg=I
0:150.collect { :n |
	let m = 1 + (3 * n);
	let e = m.integerExponent(2);
	(m * (2 ^ e)) + (((4 ^ e) - 1) / 3)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/integerExponent-I.svg)

Plot 3-adic valuation of the bijective bit-reverse of _3n_,
OEIS [A280509](https://oeis.org/A280509):

~~~spl svg=J
1:75.collect { :n |
	let a = (3 * n).integerReverse(2);
	let b = a * (3 * n).bitAnd(-3 * n);
	b.integerExponent(3)
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-J.svg)

Exchange two and three in the prime factorization of _n_,
OEIS [A064614](https://oeis.org/A064614):

~~~spl svg=K
1:60.collect { :n |
	[
		n,
		3/2 ^ n.integerExponent(2),
		2/3 ^ n.integerExponent(3)
	].product
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-K.svg)

* * *

See also: ^, digitCount, factorInteger, integerDigits, log2, log10, rulerFunction

Guides: Bitwise Functions, Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GreatestDividingExponent.html)
[2](https://reference.wolfram.com/language/ref/IntegerExponent.html),
_OEIS_
[1](https://oeis.org/A001511)
[2](https://oeis.org/A007814)
[3](https://oeis.org/A025480)
[4](https://oeis.org/A110963)
[5](https://oeis.org/A366601)
[6](https://oeis.org/A027868)
[7](https://oeis.org/A000120)
[8](https://oeis.org/A037227)
[9](https://oeis.org/A116882)
[10](https://oeis.org/A116883)

Further Reading: Levine 2006
