# pisanoPeriod

- _pisanoPeriod(n)_

Answer the Pisano period of _n_,
the period of the Fibonacci sequence when considered modulo _n_.

Specific values:

```
>>> 25.pisanoPeriod
100
```

First few terms,
OEIS [A001175](https://oeis.org/A001175):

```
>>> 1:67.collect(pisanoPeriod:/1)
[
	 1  3   8  6  20 24 16 12  24  60
	10 24  28 48  40 24 36 24  18  60
	16 30  48 24 100 84 72 48  14 120
	30 48  40 36  80 24 76 18  56  60
	40 48  88 30 120 48 32 24 112 300
	72 84 108 72  20 48 72 42  58 120
	60 30  48 96 140 120 136
]
```

The Fibonacci sequence modulo eight has period twelve:

```
>>> 8.pisanoPeriod
12

>>> (12 * 2).fibonacciSequence % 8
[
	0 1 1 2 3 5 0 5 5 2 7 1
	0 1 1 2 3 5 0 5 5 2 7 1
]
```

Number of different residues of _F(i)%n_ over all _i_,
OEIS [A066853](https://oeis.org/A066853):

```
>>> 1:73.collect { :n |
>>> 	let k = n.pisanoPeriod;
>>> 	let f = k.fibonacciSequence;
>>> 	(f % n).nub.size
>>> }
[
	 1  2  3  4  5  6  7  6  9 10
	 7 11  9 14 15 11 13 11 12 20
	 9 14 19 13 25 18 27 21 10 30
	19 21 19 13 35 15 29 13 25 30
	19 18 33 20 45 21 15 15 37 50
	35 30 37 29 12 25 33 20 37 55
	25 21 23 42 45 38 51 20 29 70
	44 15 57
]
```

Table of the fundamental Pisano period of the Fibonacci sequence modulo _n_,
OEIS [A161553](https://oeis.org/A161553),
individual entries are
OEIS [A082115](https://oeis.org/A082115) for _n=3_,
OEIS [A082116](https://oeis.org/A082116) for _n=5_,
OEIS [A082117](https://oeis.org/A082117) for _n=6_,
OEIS [A105870](https://oeis.org/A105870) for _n=7_,
OEIS [A007887](https://oeis.org/A007887) for _n=9_,
OEIS [A003893](https://oeis.org/A003893) for _n=10_,
OEIS [A089911](https://oeis.org/A089911) for _n=12_:

```
>>> 1:14.collect { :m |
>>> 	let k = m.pisanoPeriod;
>>> 	k.fibonacciSequence % m
>>> }
[
	0
	;
	0 1 1
	;
	0 1 1 2 0 2 2 1
	;
	0 1 1 2 3 1
	;
	0 1 1 2 3 0 3 3 1 4 0 4 4 3 2 0 2 2 4 1
	;
	0 1 1 2 3 5 2 1 3 4 1 5 0 5 5 4 3 1 4 5
	3 2 5 1
	;
	0 1 1 2 3 5 1 6 0 6 6 5 4 2 6 1
	;
	0 1 1 2 3 5 0 5 5 2 7 1
	;
	0 1 1 2 3 5 8 4 3 7 1 8 0 8 8 7 6 4 1 5
	6 2 8 1
	;
	0 1 1 2 3 5 8 3 1 4 5 9 4 3 7 0 7 7 4 1
	5 6 1 7 8 5 3 8 1 9 0 9 9 8 7 5 2 7 9 6
	5 1 6 7 3 0 3 3 6 9 5 4 9 3 2 5 7 2 9 1
	;
	 0  1  1  2  3  5  8  2 10  1
	;
	 0  1  1  2  3  5  8  1  9 10
	 7  5  0  5  5 10  3  1  4  5
	 9  2 11  1
	;
	 0  1  1  2  3  5  8  0  8  8
	 3 11  1 12  0 12 12 11 10  8
	 5  0  5  5 10  2 12  1
	;
	 0  1  1  2  3  5  8 13  7  6
	13  5  4  9 13  8  7  1  8  9
	 3 12  1 13  0 13 13 12 11  9
	 6  1  7  8  1  9 10  5  1  6
	 7 13  6  5 11  2 13  1
]
```

Irregular triangle of the set of residues of the Fibonacci sequence modulo _n_,
OEIS [A189768](https://oeis.org/A189768):

```
>>> 1:17.collect { :m |
>>> 	let k = m.pisanoPeriod;
>>> 	(k.fibonacciSequence % m)
>>> 	.unique
>>> }
[
	0;
	0 1;
	0 1 2;
	0 1 2 3;
	0 1 2 3 4;
	0 1 2 3 4 5;
	0 1 2 3 4 5 6;
	0 1 2 3   5   7;
	0 1 2 3 4 5 6 7 8;
	0 1 2 3 4 5 6 7 8 9;
	0 1 2 3   5     8   10;
	0 1 2 3 4 5   7 8 9 10 11;
	0 1 2 3   5   8     10 11 12;
	0 1 2 3 4 5 6 7 8 9 10 11 12 13;
	0 1 2 3 4 5 6 7 8 9 10 11 12 13 14;
	0 1 2 3 5     7 8 9    11    13    15;
	0 1 2 3 4 5     8 9       12 13 14 15 16
]
```

Number of missing residues in Fibonacci sequence modulo _n_,
OEIS [A118965](https://oeis.org/A118965):

```
>>> 1:72.collect { :m |
>>> 	let k = m.pisanoPeriod;
>>> 	[0 .. m - 1].complement(
>>> 		(k.fibonacciSequence % m)
>>> 		.unique
>>> 	).size
>>> }
[
	 0  0  0  0  0  0  0  2  0  0
	 4  1  4  0  0  5  4  7  7  0
	12  8  4 11  0  8  0  7 19  0
	12 11 14 21  0 21  8 25 14 10
	22 24 10 24  0 25 32 33 12  0
	16 22 16 25 43 31 24 38 22  5
	36 41 40 22 20 28 16 48 40  0
	27 57
]
```

Number of distinct residues in Fibonacci sequence modulo _p(n)_,
OEIS [A137750](https://oeis.org/A137750):

```
>>> 1:56.prime.collect { :m |
>>> 	let k = m.pisanoPeriod;
>>> 	(k.fibonacciSequence % m)
>>> 	.unique.size
>>> }
[
	  2   3   5   7   7
	  9  13  12  19  10
	 19  29  19  33  15
	 37  37  25  51  44
	 57  49  63  17  69
	 35  79  33  49  33
	 97  82 109  33  61
	 37 113 123 127 137
	112  62 119 149 149
	 16  30 169 171  80
	 21 149 103 157 193
	 85
]
```

Plot first few terms,
OEIS [A001175](https://oeis.org/A001175):

~~~spl svg=A
1:200.collect(pisanoPeriod:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-A.svg)

Plot first few terms of
OEIS [A066853](https://oeis.org/A066853):

~~~spl svg=B
1:125.collect { :n |
	let k = n.pisanoPeriod;
	let f = k.fibonacciSequence;
	(f % n).nub.size
}.discretePlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-B.svg)

Plot first differences:

~~~spl svg=C
1:43.collect(pisanoPeriod:/1)
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-C.svg)

Plot fixed point of Pisano period,
OEIS [A235249](https://oeis.org/A235249):

~~~spl svg=D
1:65.collect { :n |
	pisanoPeriod:/1
	.fixedPoint(n, =)
}.log.stepPlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-D.svg)

Plot table of the fundamental Pisano period of the Fibonacci sequence modulo _n_,
OEIS [A161553](https://oeis.org/A161553):

~~~spl svg=E
1:13.collect { :m |
	let k = m.pisanoPeriod;
	k.fibonacciSequence % m
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-E.svg)

Plot number of missing residues in Fibonacci sequence modulo _n_,
OEIS [A118965](https://oeis.org/A118965):

~~~spl svg=F
1:85.collect { :m |
	let k = m.pisanoPeriod;
	[0 .. m - 1].complement(
		(k.fibonacciSequence % m)
		.unique
	).size
}.discretePlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-F.svg)

Plot number of distinct residues in Fibonacci sequence modulo _p(n)_,
OEIS [A137750](https://oeis.org/A137750):

~~~spl svg=G
1:85.prime.collect { :m |
	let k = m.pisanoPeriod;
	(k.fibonacciSequence % m)
	.unique.size
}.discretePlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-G.svg)

* * *

See also: fibonacci, fibonacciSequence

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PisanoPeriod.html),
_OEIS_
[1](https://oeis.org/A001175)
[2](https://oeis.org/A066853),
_W_
[1](https://en.wikipedia.org/wiki/Pisano_period)
