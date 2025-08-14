# fibonacciWord

- _fibonacciWord(n)_

Answer the _n_-th letter in the infinite Fibonacci word.

Calculate the first one hundred elements:

```
>>> 1:100.collect(fibonacciWord:/1)
[
	0 1 0 0 1 0 1 0 0 1
	0 0 1 0 1 0 0 1 0 1
	0 0 1 0 0 1 0 1 0 0
	1 0 0 1 0 1 0 0 1 0
	1 0 0 1 0 0 1 0 1 0
	0 1 0 1 0 0 1 0 0 1
	0 1 0 0 1 0 0 1 0 1
	0 0 1 0 1 0 0 1 0 0
	1 0 1 0 0 1 0 0 1 0
	1 0 0 1 0 1 0 0 1 0
]
```

Threads over lists, derive the binary complement of the Fibonacci word:

```
>>> 1 - 1:20.fibonacciWord
[
	1 0 1 1 0 1 0 1 1 0
	1 1 0 1 0 1 1 0 1 0
]
```

A Fibonacci word is palindromic excepting last two terms:

```
>>> 1:13.fibonacciWord
[0 1 0 0 1 0 1 0 0 1 0 0 1]

>>> let n = 8.fibonacci;
>>> let w = 1:n.fibonacciWord.first(n - 2);
>>> (n, w = w.reversed)
(21, true)
```

The Fibonacci word can be generated using a substitution system,
at the seventh step thirty-four terms have been generated:

```
>>> [0 -> [0 1], 1 -> [0]]
>>> .substitutionSystem([0], 7)
>>> .last
[
	0 1 0 0 1 0 1 0 0 1
	0 0 1 0 1 0 0 1 0 1
	0 0 1 0 0 1 0 1 0 0
	1 0 0 1
]

>>> ['0' -> '01', '1' -> '0']
>>> .substitutionSystem('0', 6)
[
	'0'
	'01'
	'010'
	'01001'
	'01001010'
	'0100101001001'
	'010010100100101001010'
]
```

The size of each sucessive word is the Fibonacci sequence:

```
>>> [0 -> [0 1], 1 -> [0]]
>>> .substitutionSystem([0], 7)
>>> .collect(size:/1)
[1 2 3 5 8 13 21 34]
```

It can also be specified as a locally catenative sequence:

```
>>> [0; 0 1]
>>> .locallyCatenativeSequence([1 2], 6)
>>> .last
[
	0 1 0 0 1 0 1 0 0 1
	0 0 1 0 1 0 0 1 0 1
	0 0 1 0 0 1 0 1 0 0
	1 0 0 1
]

>>> [0; 0 1]
>>> .locallyCatenativeSequence([1 2], 6)
>>> .collect(size:/1)
[1 2 3 5 8 13 21 34]
```

Recurrence plot:

~~~spl svg=A
1:13.fibonacciWord
.recurrenceMatrix(1, 1, 'Manhattan', 0.1)
.matrixPlot
~~~

![](sw/spl/Help/Image/fibonacciWord-A.svg)

Plot the tenth Fibonacci word:

~~~spl svg=B
1:55.collect(fibonacciWord:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/fibonacciWord-B.svg)

Plot Fourier transform of the tenth Fibonacci word:

~~~spl svg=C
1:55.collect(fibonacciWord:/1)
.fourier
.abs
.discretePlot
~~~

![](sw/spl/Help/Image/fibonacciWord-C.svg)

* * *

See also: fibonacci, locallyCatenativeSequence, rabbitConstant, substitutionSystem, tribonacciWord

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RabbitSequence.html),
_OEIS_
[1](https://oeis.org/A003849)
[2](https://oeis.org/A005614),
_W_
[1](https://en.wikipedia.org/wiki/Fibonacci_word)
