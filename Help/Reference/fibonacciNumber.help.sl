# fibonacciNumber

- _fibonacciNumber(n)_

Answer the Fibonacci number _F(n)_.

Threads over lists:

```
>>> 0:20.fibonacciNumber
[
	0 1 1 2 3
	5 8 13 21 34
	55 89 144 233 377
	610 987 1597 2584 4181
	6765
]
```

Plot Fibonacci modulo _n_,
OEIS [A002708](https://oeis.org/A002708):

~~~spl svg=A
0:250.collect { :n |
	n.fibonacciNumber % n
}.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacciNumber-A.svg)

Fibonacci numbers modulo twenty-five,
period is one-hundred:

~~~spl svg=B
(0:200.fibonacciNumber % 25)
.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacciNumber-B.svg)

* * *

See also: fibonacci, fibonacciSequence, lucasNumber, pellNumber

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Fibonacci.html),
_OEIS_
[1](https://oeis.org/A000045),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.fibonacci),
_W_
[1](https://en.wikipedia.org/wiki/Fibonacci_sequence)
