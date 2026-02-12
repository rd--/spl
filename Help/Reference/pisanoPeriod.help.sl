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

Plot first few terms:

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
