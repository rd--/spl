# integerExponent

- _integerExponent(n, b)_

Answers the highest power of _b_ that divides _n_.

The number of trailing zeros:

```
>>> 1230000.integerExponent(10)
4
```

The highest power of 2:

```
>>> ((2 ^ 10) + (2 ^ 7))
>>> .integerExponent(2)
7
```

Number of trailing zeros in factorials:

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

A formula for digitCount:

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
>>> 	let m = integerExponent(n, 2) + 1;
>>> 	bitShiftRight(n, m)
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

Plot it:

~~~spl svg=A
(1:127).functionPlot { :n |
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

![](sw/spl/Help/Image/integerExponent-A.svg)

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

Further Reading: Levine 2006
