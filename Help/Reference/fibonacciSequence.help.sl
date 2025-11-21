# fibonacciSequence

- _fibonacciSequence(n)_

Answer a `List` of the first _n_ Fibonacci numbers:

First few terms,
OEIS [A000045](https://oeis.org/A000045):

```
>>> 20.fibonacciSequence
[
	   1    1    2    3    5
	   8   13   21   34   55
	  89  144  233  377  610
	 987 1597 2584 4181
	6765
]
```

The limit ratio between consecutive terms is the golden ratio:

```
>>> 6765 / 4181
1.goldenRatio
```

C.f. `fibonacci`:

```
>>> 1:20.collect(fibonacci:/1)
[
	   1    1    2    3    5
	   8   13   21   34   55
	  89  144  233  377  610
	 987 1597 2584 4181
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

>>> (23 + 1)
>>> .fibonacciSequence
>>> .drop(23 + 1 - 3)
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
OEIS [A001605](https://oeis.org/A001605):

```
>>> let k = 50;
>>> let f = k.fibonacciSequence;
>>> 1:k.select { :i |
>>> 	f[i].isPrime
>>> }
[3 4 5 7 11 13 17 23 29 43 47]
```

The one-hundredth Fibonacci number:

```
>>> 100.fibonacciSequence.last
354224848179261915075L
```

Closed form, see also `binetsFormula`:

```
>>> ((1.goldenRatio ^ [1 .. 13]) / 5.sqrt).round
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


Plot Fibonacci modulo _n_,
OEIS [A002708](https://oeis.org/A002708):

~~~spl svg=A
let n = 200;
(n.fibonacciSequence % (1 .. 200))
.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacciSequence-A.svg)

* * *

See also: binetsFormula, fibonacci, fibonacciWord, goldenRatio, linearRecurrence, pellNumbers

Guides: Integer Sequence Functions, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FibonacciNumber.html)
[2](https://mathworld.wolfram.com/FibonacciQ-Matrix.html),
_OEIS_
[1](https://oeis.org/A000045)
[2](https://oeis.org/A005478)
[3](https://oeis.org/A001605),
_W_
[1](https://en.wikipedia.org/wiki/Fibonacci_sequence)

Categories: Math, Sequence
