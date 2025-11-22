# pisanoPeriod

- _pisanoPeriod(n)_

Answer the Pisano period of _n_,
the period of the Fibonacci sequence when considered modulo _n_.

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
	1 1 2 3 5 0 5 5 2 7 1 0
	1 1 2 3 5 0 5 5 2 7 1 0
]
```

Plot first few terms:

~~~spl svg=A
1:200.collect(pisanoPeriod:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-A.svg)

* * *

See also: fibonacci, fibonacciSequence

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PisanoPeriod.html),
_OEIS_
[1](https://oeis.org/A001175),
_W_
[1](https://en.wikipedia.org/wiki/Pisano_period)
