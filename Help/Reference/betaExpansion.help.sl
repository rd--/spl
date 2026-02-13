# betaExpansion

- _betaExpansion(x, β, p)_

Answer the β-expansion of the number _x_ in base _β_ to precision _p_,
and the number of places before the period,
where _1<β<=10_ & _n>=0_.

The integer _123_ in decimal with no places after the point:

```
>>> betaExpansion(123, 10, 0)
[[1 2 3], 3]

>>> 123.realDigits(10, 3)
[[1 2 3], 3]

>>> 123.integerDigits(10)
[1 2 3]

>>> 123.decimalExpansion
[1 2 3]
```

The rational _123/10_ in decimal with one place after the point:

```
>>> betaExpansion(123/10, 10, 1)
[[1 2 3], 2]

>>> 12.3.realDigits(10, 3)
[[1 2 3], 2]
```

The integers _9_ and _1911_ in binary:

```
>>> betaExpansion(9, 2, 0)
[[1 0 0 1], 4]

>>> 9.binaryExpansion
[1 0 0 1]

>>> 2r1001
9

>>> betaExpansion(1911, 2, 0)
[[1 1 1 0 1 1 1 0 1 1 1], 11]

>>> 2r11101110111
1911
```

The integers _9_ and _1911_ with base _√2_:

```
>>> betaExpansion(9, 2.sqrt, 13)
[
	[
		1 0 0 0 0 0 0 1 0 0
		1 0 0 0 0 0 1 0 0 1
	],
	7
]

>>> betaExpansion(9, 2.sqrt, 13)
>>> .betaContraction(2.sqrt)
8.999

>>> betaExpansion(1911, 2.sqrt, 17)
[
	[
		1 0 0 0 1 0 0 0 1 0
		0 0 0 0 0 1 0 0 0 1
		0 0 0 0 0 1 0 0 0 0
		1 0 0 0 0 0 0 0 1
	],
	22
]

>>> betaExpansion(1911, 2.sqrt, 17)
>>> .betaContraction(2.sqrt)
1910.99999
```

The integer _10_ with base _π_ and precision _22_:

```
>>> betaExpansion(10, 1.pi, 22)
[
	[
		1 0 0 0 1 0 2 2 1 2 2
		2 2 1 1 2 1 1 2 2 0 0
		1 1 1
	],
	3
]

>>> betaExpansion(10, 1.pi, 22)
>>> .betaContraction(1.pi)
9.97197
```

The integer _2_ with rational base _3/2_ and precision _103_,
equal but for the second place to OEIS [A058840](https://oeis.org/A058840):

```
>>> betaExpansion(2, 3/2, 103)
[
	[
		1 0 0 1 0 0 0 0 0 1
		0 0 1 0 0 1 0 1 0 0
		0 0 0 0 0 0 0 1 0 0
		0 0 0 0 1 0 0 0 0 1
		0 0 0 0 0 0 1 0 0 1
		0 0 1 0 1 0 0 0 0 0
		0 0 0 0 0 0 1 0 0 0
		1 0 0 1 0 0 0 0 0 0
		0 1 0 0 1 0 0 0 0 0
		1 0 0 0 0 1 0 0 0 0
		0 0 1 0 0
	],
	2
]

>>> betaExpansion(2, 3/2, 103)
>>> .betaContraction(1.5)
2
```

Run lengths of zeroes,
closely related to OEIS [A058841](https://oeis.org/A058841):

```
>>> betaExpansion(2, 3/2, 430)
>>> .first
>>> .runLengthsOf(0)
>>> .allButLast
[
	2  5  2 2 1 9 6 4 6  2
	2  1 11 3 2 7 2 5 4  6
	3  3  5 2 4 7 7 2 5  3
	4  2  3 5 5 2 2 2 2  4
	3 10  5 5 2 1 6 1 5  2
	3  2  3 3 2 9 6 9 6  8
	2  7  5 3 2 2 4 3 1 14
	9  3  6 7 3 2 2 3 4  3
	2  6  4 2
]
```

Base φ:

```
>>> betaExpansion(
>>> 	5,
>>> 	1.goldenRatio,
>>> 	4
>>> )
[[1 0 0 0 1 0 0 1], 4]

>>> (1.goldenRatio ^ [-4 -1 3]).sum
5

>>> ([-4 -1 3] + 1).fibonacci.sum
5
```

Plot:

~~~spl svg=A
betaExpansion(2, 3/2, 430)
.first
.runLengthsOf(0)
.discretePlot
~~~

![](sw/spl/Help/Image/betaExpansion-A.svg)

* * *

See also: integerDigits, realDigits

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Base.html)
[2](https://reference.wolfram.com/language/ref/RealDigits.html),
_OEIS_
[1](https://oeis.org/A058840)
[2](https://oeis.org/A058841),
_W_
[1](https://en.wikipedia.org/wiki/Non-integer_base_of_numeration)

Further Reading: Kempner 1936, Parry 1960, Rényi 1957
