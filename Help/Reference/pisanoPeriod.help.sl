# pisanoPeriod

- _pisanoPeriod(n)_

Answer the Pisano period of _n_,
the period of the Fibonacci sequence when considered modulo _n_.

Specific values:

```
>>> 25.pisanoPeriod
100

>>> 110.pisanoPeriod
60
```

Pisano period,
threads over lists,
first few terms,
OEIS [A001175](https://oeis.org/A001175):

```
>>> 1:67.pisanoPeriod
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

The first 144 Pisano periods:

```
>>> 1:144.pisanoPeriod
[
	1 3 8 6 20 24 16 12 24 60 10 24
	28 48 40 24 36 24 18 60 16 30 48 24
	100 84 72 48 14 120 30 48 40 36 80 24
	76 18 56 60 40 48 88 30 120 48 32 24
	112 300 72 84 108 72 20 48 72 42 58 120
	60 30 48 96 140 120 136 36 48 240 70 24
	148 228 200 18 80 168 78 120 216 120 168 48
	180 264 56 60 44 120 112 48 120 96 180 48
	196 336 120 300 50 72 208 84 80 108 72 72
	108 60 152 48 76 72 240 42 168 174 144 120
	110 60 40 30 500 48 256 192 88 420 130 120
	144 408 360 36 276 48 46 240 32 210 140 24
]
```

Pisano periods of Fibonacci numbers:

```
>>> 1:24.fibonacci.pisanoPeriod
[
	1 1 3 8 20 12 28 16 36 20
	44 24 52 28 60 32 68 36 76 40
	84 44 92 48
]
```

Relation to `isCoprime` and `lcm`:

```
>>> 8.isCoprime(11)
true

>>> (8 * 11).pisanoPeriod
60

>>> [8 11].pisanoPeriod.lcm
60
```

Prime powers rule (conjecture):

```
>>> 17.isPrime
true

>>> (17 ^ 4).pisanoPeriod
176868

>>> (17 ^ (4 - 1)) * 17.pisanoPeriod
176868
```

Pisano period of large integers:

```
>>> (2 ^ 31 + 2).pisanoPeriod
46200

>>> 1_230_000.pisanoPeriod
15_000

>>> (2L ^ 63 - 1).pisanoPeriod
168775327381163780L
```

The Fibonacci sequence modulo three has period eight,
OEIS [A082115](https://oeis.org/A082115):

```
>>> 3.pisanoPeriod
8

>>> (8 * 2).fibonacciSequence % 3
[
	0 1 1 2 0 2 2 1
	0 1 1 2 0 2 2 1
]

>>> 8.moduloFibonacciSequence(3)
[0 1 1 2 0 2 2 1]
```

The Fibonacci sequence modulo four has period six,
OEIS [A079343](https://oeis.org/A079343):

```
>>> 4.pisanoPeriod
6

>>> (6 * 2).fibonacciSequence % 4
[
	0 1 1 2 3 1
	0 1 1 2 3 1
]

>>> 6.moduloFibonacciSequence(4)
[0 1 1 2 3 1]
```

The Fibonacci sequence modulo five has period twenty,
OEIS [A082116](https://oeis.org/A082116):

```
>>> 5.pisanoPeriod
20

>>> (20 * 2).fibonacciSequence % 5
[
	0 1 1 2 3 0 3 3 1 4 0 4 4 3 2 0 2 2 4 1
	0 1 1 2 3 0 3 3 1 4 0 4 4 3 2 0 2 2 4 1
]

>>> 20.moduloFibonacciSequence(5)
[0 1 1 2 3 0 3 3 1 4 0 4 4 3 2 0 2 2 4 1]
```

The Fibonacci sequence modulo eight has period twelve,
OEIS [A079344](https://oeis.org/A079344):

```
>>> 8.pisanoPeriod
12

>>> (12 * 2).fibonacciSequence % 8
[
	0 1 1 2 3 5 0 5 5 2 7 1
	0 1 1 2 3 5 0 5 5 2 7 1
]

>>> 12.moduloFibonacciSequence(8)
[0 1 1 2 3 5 0 5 5 2 7 1]

>>> (12.fibonacciSequence % 8).unique
[0 1 2 3 5 7]
```

The Fibonacci sequence modulo eleven has period ten,
OEIS [A105955](https://oeis.org/A105955):

```
>>> 11.pisanoPeriod
10

>>> (10 * 2).fibonacciSequence % 11
[
	0 1 1 2 3 5 8 2 10 1
	0 1 1 2 3 5 8 2 10 1
]

>>> 10.moduloFibonacciSequence(11)
[0 1 1 2 3 5 8 2 10 1]
```

`findRepeat` agrees with `pisanoPeriod`:

```
>>> 1:67.allSatisfy { :n |
>>> 	let m = n.pisanoPeriod;
>>> 	let k = m * 2 + 1;
>>> 	let x = 1:k.fibonacci;
>>> 	let r = (x % n).findRepeat;
>>> 	(r.size = m)
>>> }
true
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
OEIS [A079343](https://oeis.org/A079343) for _n=4_,
OEIS [A082116](https://oeis.org/A082116) for _n=5_,
OEIS [A082117](https://oeis.org/A082117) for _n=6_,
OEIS [A105870](https://oeis.org/A105870) for _n=7_,
OEIS [A079344](https://oeis.org/A079344) for _n=8_,
OEIS [A007887](https://oeis.org/A007887) for _n=9_,
OEIS [A003893](https://oeis.org/A003893) for _n=10_,
OEIS [A105955](https://oeis.org/A105955) for _n=11_,
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

Sum of the terms of the Pisano period mod _n_,
OEIS [A214300](https://oeis.org/A214300):

```
>>> 1:14.collect { :m |
>>> 	let k = m.pisanoPeriod;
>>> 	(k.fibonacciSequence % m).sum
>>> }
[
	0 2 9 8 40
	66 49 32 99 280
	33 108 156 322
]
```

Fibonacci winding number,
the number of _mod n_ operations in one cycle of the Fibonacci sequence modulo _n_,
OEIS [A088551](https://oeis.org/A088551):

```
>>> 2:27.collect { :n |
>>> 	let p = n.pisanoPeriod;
>>> 	1:p.sum { :k |
>>> 		k.fibonacci % n
>>> 	} / n
>>> }
[
	 1  3  2  8 11  7  4 11 28  3
	 9 12 23 19  9 16 11  7 28  5
	12 23  9 48 40 35
]
```

Pisano periods for primes: period of Fibonacci numbers _mod prime(n)_,
OEIS [A060305](https://oeis.org/A060305):

```
>>> 1:59.prime.pisanoPeriod
[
	3 8 20 16 10
	28 36 18 48 14
	30 76 40 88 32
	108 58 60 136 70
	148 78 168 44 196
	50 208 72 108 76
	256 130 276 46 148
	50 316 328 336 348
	178 90 190 388 396
	22 42 448 456 114
	52 238 240 250 516
	176 268 270 556
]
```

Number of zeros in fundamental period of Fibonacci numbers _mod n_,
OEIS [A001176](https://oeis.org/A001176):

```
>>> 1:105.collect { :m |
>>> 	let k = m.pisanoPeriod;
>>> 	let a = k.fibonacciSequence % m;
>>> 	a.occurrencesOf(0)
>>> }
[
	1 1 2 1 4 2 2 2 2 4 1 2 4 2 2 2 4 2 1 2
	2 1 2 2 4 4 2 2 1 2 1 2 2 4 2 2 4 1 2 2
	2 2 2 1 2 2 2 2 2 4 2 2 4 2 2 2 2 1 1 2
	4 1 2 2 4 2 2 2 2 2 1 2 4 4 2 1 2 2 1 2
	2 2 2 2 4 2 2 2 4 2 2 2 2 2 2 2 4 2 2 2
	1 2 2 2 2
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

The Fibonacci sequence modulo 110 has period 60,
the sequence visits 24 of the 110 residues:

```
>>> 110.pisanoPeriod
60

>>> (60.fibonacciSequence % 110).unique
[
	0 1 2 3 5
	8 13 21 34 47
	52 54 55 56 57
	58 60 63 68 76
	89 102 107 109
]
```

The Fibonacci sequence modulo 22 has period 30,
the second column of the two-partition of the sequence is a palindrome,
this is not unusual (Haek 2008):

```
>>> 22.pisanoPeriod
30

>>> let a = 30.fibonacciSequence % 22;
>>> a.partition(2).transpose
[
	0 1 3 8 21 11 12 3 19 10 11 1 14 19 21;
	1 2 5 13 12 1 13 16 13 1 12 13 5 2 1
]
```

A palindrome at the Fibonacci sequence modulo 84:

```
>>> 84.pisanoPeriod
48

>>> let a = 48.fibonacciSequence % 84;
>>> a.partition(2).column(2)
[
	1 2 5 13 34 5 65 22 1 65 26 13
	13 26 65 1 22 65 5 34 13 5 2 1
]
```

Leonardo logarithm of _n_,
OEIS [A001179](https://oeis.org/A001179):

```
>>> let ll = { :x :k |
>>> 	(x = 1).if {
>>> 		k
>>> 	} {
>>> 		ll(x // 5, k + 1)
>>> 	}
>>> };
>>> let a = Map { :n |
>>> 	(n = 1).if {
>>> 		0
>>> 	} {
>>> 		let p = n.pisanoPeriod;
>>> 		(p = n).if {
>>> 			ll(p // 24, 1)
>>> 		} {
>>> 			a[p]
>>> 		}
>>> 	}
>>> };
>>> a[1 .. 72]
[
	0 1 1 1 2 1 1 1 1 2 2 1 1 1 2 1 1 1 1 2
	1 2 1 1 3 1 1 1 1 2 2 1 2 1 2 1 1 1 1 2
	2 1 2 2 2 1 1 1 1 3 1 1 1 1 2 1 1 1 1 2
	2 2 1 1 2 2 1 1 1 2 2 1
]
```

Integers k such that the Pisano period of _k_ equals _2(k+1)_,
OEIS [A071774](https://oeis.org/A071774):

```
>>> 1:400.select { :k |
>>> 	let n = 2 * (k + 1);
>>> 	k.pisanoPeriod = n
>>> }
[
	3 7 13 17 23
	37 43 53 67 73
	83 97 103 127 137
	157 163 167 173 193
	197 223 227 257 277
	283 293 313 317 337
	367 373 383 397
]
```

Pisano periods,
OEIS [A001175](https://oeis.org/A001175):

~~~spl svg=A oeis=A001175
1:200.pisanoPeriod.scatterPlot
~~~

![](Help/Image/pisanoPeriod-A.svg)

Number of different residues for the Fibonacci numbers modulo _n_,
OEIS [A066853](https://oeis.org/A066853):

~~~spl svg=B oeis=A066853
1:125.collect { :n |
	let k = n.pisanoPeriod;
	let f = k.fibonacciSequence;
	(f % n).nub.size
}.discretePlot
~~~

![](Help/Image/pisanoPeriod-B.svg)

First differences of Pisano periods:

~~~spl svg=C
1:43.pisanoPeriod.differences
.discretePlot
~~~

![](Help/Image/pisanoPeriod-C.svg)

Fixed point of Pisano period _n_,
OEIS [A235249](https://oeis.org/A235249):

~~~spl svg=D oeis=A235249
1:65.collect { :n |
	pisanoPeriod/1
	.fixedPoint(n, =)
}.stepPlot.log
~~~

![](Help/Image/pisanoPeriod-D.svg)

Table of the fundamental Pisano period of the Fibonacci sequence modulo _n_,
OEIS [A161553](https://oeis.org/A161553):

~~~spl svg=E oeis=A161553
1:13.collect { :m |
	let k = m.pisanoPeriod;
	k.fibonacciSequence % m
}.catenate.scatterPlot
~~~

![](Help/Image/pisanoPeriod-E.svg)

Number of missing residues in Fibonacci sequence modulo _n_,
OEIS [A118965](https://oeis.org/A118965):

~~~spl svg=F oeis=A118965
1:85.collect { :m |
	let k = m.pisanoPeriod;
	[0 .. m - 1].complement(
		(k.fibonacciSequence % m)
		.unique
	).size
}.discretePlot
~~~

![](Help/Image/pisanoPeriod-F.svg)

Number of distinct residues in Fibonacci sequence modulo _p(n)_,
OEIS [A137750](https://oeis.org/A137750):

~~~spl svg=G oeis=A137750
1:85.prime.collect { :m |
	let k = m.pisanoPeriod;
	(k.fibonacciSequence % m)
	.unique.size
}.discretePlot
~~~

![](Help/Image/pisanoPeriod-G.svg)

Fibonacci winding number,
the number of _mod n_ operations in one cycle of the Fibonacci sequence modulo _n_,
OEIS [A088551](https://oeis.org/A088551):

~~~spl svg=H
2:77.collect { :n |
	let p = n.pisanoPeriod;
	1:p.sum { :k |
		k.fibonacci % n
	} / n
}.discretePlot
~~~

![](Help/Image/pisanoPeriod-H.svg)

State space visualization of the Pisano period for _n=5_:

~~~spl svg=I
let n = 5;
let k = n.pisanoPeriod;
((k + 2).fibonacciSequence % n)
.partition(2, 1)
.pathPlot
~~~

![](Help/Image/pisanoPeriod-I.svg)

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

Further Reading: Burr 1971
