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
