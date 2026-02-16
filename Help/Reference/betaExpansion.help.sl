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

Plot run lengths of zeroes:

~~~spl svg=A
betaExpansion(2, 3/2, 430)
.first
.runLengthsOf(0)
.discretePlot
~~~

![](sw/spl/Help/Image/betaExpansion-A.svg)

Count number of ones in the base-φ representation of _n_,
OEIS [A055778](https://oeis.org/A055778):

```
>>> let phi = 1.goldenRatio;
>>> 2:104.collect { :n |
>>> 	let e = n.betaExpansion(phi, 32);
>>> 	e[1].sum
>>> }
[
	    2 2 3 3 3 2 3 4 4 5 4 4 4 5 4 4 2 3
	4 4 5 5 5 4 5 6 6 7 5 5 5 6 5 5 4 5 6 6
	7 5 5 5 6 5 5 2 3 4 4 5 5 5 4 5 6 6 7 6
	6 6 7 6 6 4 5 6 6 7 7 7 6 7 8 8 9 6 6 6
	7 6 6 5 6 7 7 8 6 6 6 7 6 6 4 5 6 6 7 7
	7 6 7 8 8
]
```

Plot number of ones in the base-φ representation of _n_ modulo,
OEIS [A055778](https://oeis.org/A055778):

~~~spl svg=B
let phi = 1.goldenRatio;
2:104.collect { :n |
	let e = n.betaExpansion(phi, 32);
	e[1].sum
}.stepPlot
~~~

![](sw/spl/Help/Image/betaExpansion-B.svg)

Plot number of ones in the base-φ representation of _n_ modulo two,
OEIS [A330037](https://oeis.org/A330037):

~~~spl svg=C
let phi = 1.goldenRatio;
let c = 2:125.collect { :n |
	let e = n.betaExpansion(phi, 32);
	e[1].sum
};
(c % 2).discretePlot
~~~

![](sw/spl/Help/Image/betaExpansion-C.svg)

List of powers of φ in the representation of _n_,
OEIS [A104605](https://oeis.org/A104605):

```
>>> let phi = 1.goldenRatio;
>>> 2:27.collect { :n |
>>> 	let e = n.betaExpansion(phi, 32);
>>> 	(e[2] - e[1].indicesOf(1)).reverse
>>> }
[
	-2 1;
	-2 2;
	-2 0 2;
	-4 -1 3;
	-4 1 3;
	-4 4;
	-4 0 4;
	-4 -2 1 4;
	-4 -2 2 4;
	-4 -2 0 2 4;
	-6 -3 -1 5;
	-6 -3 1 5;
	-6 -3 2 5;
	-6 -3 0 2 5;
	-6 -1 3 5;
	-6 1 3 5;
	-6 6;
	-6 0 6;
	-6 -2 1 6;
	-6 -2 2 6;
	-6 -2 0 2 6;
	-6 -4 -1 3 6;
	-6 -4 1 3 6;
	-6 -4 4 6;
	-6 -4 0 4 6;
	-6 -4 -2 1 4 6
]
```

Plot list of powers of φ in the representation of _n_,
OEIS [A104605](https://oeis.org/A104605):

~~~spl svg=D
let phi = 1.goldenRatio;
2:27.collect { :n |
	let e = n.betaExpansion(phi, 32);
	(e[2] - e[1].indicesOf(1)).reverse
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/betaExpansion-D.svg)

The part of _n_ in base φ left of the decimal point,
OEIS [A105424](https://oeis.org/A105424):

```
>>> let phi = 1.goldenRatio;
>>> 2:30.collect { :n |
>>> 	let e = n.betaExpansion(phi, 32);
>>> 	e[1].first(e[2])
>>> }
[
	1 0;
	1 0 0;
	1 0 1;
	1 0 0 0;
	1 0 1 0;
	1 0 0 0 0;
	1 0 0 0 1;
	1 0 0 1 0;
	1 0 1 0 0;
	1 0 1 0 1;
	1 0 0 0 0 0;
	1 0 0 0 1 0;
	1 0 0 1 0 0;
	1 0 0 1 0 1;
	1 0 1 0 0 0;
	1 0 1 0 1 0;
	1 0 0 0 0 0 0;
	1 0 0 0 0 0 1;
	1 0 0 0 0 1 0;
	1 0 0 0 1 0 0;
	1 0 0 0 1 0 1;
	1 0 0 1 0 0 0;
	1 0 0 1 0 1 0;
	1 0 1 0 0 0 0;
	1 0 1 0 0 0 1;
	1 0 1 0 0 1 0;
	1 0 1 0 1 0 0;
	1 0 1 0 1 0 1;
	1 0 0 0 0 0 0 0
]
```

The part of _n_ in base φ left of the decimal point,
interpreted as a binary integer,
OEIS [A105425](https://oeis.org/A105425):

```
>>> let phi = 1.goldenRatio;
>>> 2:56.collect { :n |
>>> 	let e = n.betaExpansion(phi, 32);
>>> 	e[1].first(e[2]).fromDigits(2)
>>> }
[
	          2   4   5
	  8  10  16  17  18
	 20  21  32  34  36
	 37  40  42  64  65
	 66  68  69  72  74
	 80  81  82  84  85
	128 130 132 133 136
	138 144 145 146 148
	149 160 162 164 165
	168 170 256 257 258
	260 261 264 266 272
	273 274
]
```

Plot the part of _n_ in base φ left of the decimal point,
interpreted as a binary integer,
OEIS [A105425](https://oeis.org/A105425):

~~~spl svg=E
let phi = 1.goldenRatio;
2:105.collect { :n |
	let e = n.betaExpansion(phi, 32);
	e[1].first(e[2]).fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/betaExpansion-E.svg)

The part of _n_ in base φ right of the decimal point,
reversed,
OEIS [A341722](https://oeis.org/A341722):

```
>>> let phi = 1.goldenRatio;
>>> 2:36.collect { :n |
>>> 	let e = n.betaExpansion(phi, 32);
>>> 	let d = e[1].drop(e[2]);
>>> 	d.reverse.dropWhile(isZero:/1)
>>> }
[
	1 0;
	1 0;
	1 0;
	1 0 0 1;
	1 0 0 0;
	1 0 0 0;
	1 0 0 0;
	1 0 1 0;
	1 0 1 0;
	1 0 1 0;
	1 0 0 1 0 1;
	1 0 0 1 0 0;
	1 0 0 1 0 0;
	1 0 0 1 0 0;
	1 0 0 0 0 1;
	1 0 0 0 0 0;
	1 0 0 0 0 0;
	1 0 0 0 0 0;
	1 0 0 0 1 0;
	1 0 0 0 1 0;
	1 0 0 0 1 0;
	1 0 1 0 0 1;
	1 0 1 0 0 0;
	1 0 1 0 0 0;
	1 0 1 0 0 0;
	1 0 1 0 1 0;
	1 0 1 0 1 0;
	1 0 1 0 1 0;
	1 0 0 1 0 1 0 1;
	1 0 0 1 0 1 0 0;
	1 0 0 1 0 1 0 0;
	1 0 0 1 0 1 0 0;
	1 0 0 1 0 0 0 1;
	1 0 0 1 0 0 0 0;
	1 0 0 1 0 0 0 0
]
```

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
