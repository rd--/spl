# fibonacciSequence

- _fibonacciSequence(n)_

Answer a `List` of the first _n_ Fibonacci numbers.
The first entry is for _F(0)_.

First few terms,
OEIS [A000045](https://oeis.org/A000045):

```
>>> 21.fibonacciSequence
[
	   0    1    1    2    3
	   5    8   13   21   34
	  55   89  144  233  377
	 610  987 1597 2584 4181
	6765
]
```

The limit ratio between consecutive terms is the golden ratio:

```
>>> 6765 / 4181
1.goldenRatio
```

C.f. `fibonacci` and `fibonacciNumber`:

```
>>> 0:20.collect(fibonacci:/1)
[
	   0    1    1    2    3
	   5    8   13   21   34
	  55   89  144  233  377
	 610  987 1597 2584 4181
	6765
]
```

The Fibonacci Q-matrix:

```
>>> let q = [1 1; 1 0];
>>> q.matrixPower(23)
[
	46368 28657;
	28657 17711
]

>>> 25.fibonacciSequence
>>> .last(3)
[17711 28657 46368]
```

The first few Fibonacci primes,
OEIS [A005478](https://oeis.org/A005478):

```
>>> 30.fibonacciSequence
>>> .select(isPrime:/1)
[2 3 5 13 89 233 1597 28657 514229]
```

Indices of first few prime Fibonacci numbers,
where _F(0)=0_,
OEIS [A001605](https://oeis.org/A001605):

```
>>> let k = 50;
>>> let f = k.fibonacciSequence;
>>> 1:k.select { :i |
>>> 	f[i].isPrime
>>> } - 1
[3 4 5 7 11 13 17 23 29 43 47]
```

The Fibonacci number _F(100)_:

```
>>> 100.fibonacciNumber
354224848179261915075L

>>> 101.fibonacciSequence.last
354224848179261915075L
```

Closed form, see also `binetsFormula`:

```
>>> let phi = 1.goldenRatio;
>>> ((phi ^ [1 .. 13]) / 5.sqrt).round
[1 1 2 3 5 8 13 21 34 55 89 144 233]
```

The multiplicative dual of the Fibonacci sequence,
OEIS [007660](https://oeis.org/A007660):

```
>>> { :a :n |
>>> 	a[n - 1] * a[n - 2] + 1
>>> }.recurrenceTable([0 0], 13)
[
	0 0 1 1 2 3 7 22 155 3411
	528706 1803416167 953476947989903
]
```

The Fibonacci sequence modulo three,
period is eight,
OEIS [A082115](https://oeis.org/A082115):

```
>>> 16.fibonacciSequence % 3
[
	0 1 1 2 0 2 2 1
	0 1 1 2 0 2 2 1
]

>>> 3.pisanoPeriod
8
```

Plot Fibonacci modulo _n_,
OEIS [A002708](https://oeis.org/A002708):

~~~spl svg=A
let n = 201;
(n.fibonacciSequence % (0 .. 200))
.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacciSequence-A.svg)

* * *

See also: binetsFormula, fibonacci, fibonacciNumber, fibonacciWord, goldenRatio, linearRecurrence, pellSequence

Guides: Integer Sequence Functions, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FibonacciNumber.html)
[2](https://mathworld.wolfram.com/FibonacciQ-Matrix.html),
_OEIS_
[1](https://oeis.org/A000045)
[2](https://oeis.org/A005478)
[3](https://oeis.org/A001605)
[4](https://oeis.org/A082115),
_W_
[1](https://en.wikipedia.org/wiki/Fibonacci_sequence)

Categories: Math, Sequence
