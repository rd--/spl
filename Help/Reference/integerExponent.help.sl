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
>>> ((2 ^ 10) + (2 ^ 7)).integerExponent(2)
7
```

Number of trailing zeros in factorials:

```
>>> (1L .. 40L).collect { :n |
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
>>> (1L .. 30L).collect { :n |
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
>>> 	(1 .. m).collect { :each |
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

Plot it:

~~~spl svg=A
(1:127).functionPlot { :n |
	n.integerExponent(2)
}
~~~

![](sw/spl/Help/Image/integerExponent-A.svg)

* * *

See also: ^, digitCount, factorInteger, integerDigits, log2, log10, rulerFunction

Guides: Bitwise Functions, Integer Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/IntegerExponent.html),
_OEIS_
[1](https://oeis.org/A001511)
[2](https://oeis.org/A007814)
