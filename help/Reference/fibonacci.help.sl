# fibonacci

- _fibonacci(n)_

Answer the _n_-th Fibonacci number, _F(n)_.

The eighth Fibonacci number:

```
>>> 8.fibonacci
21
```

Real valued input:

```
>>> (15 / 17).fibonacci
0.95652
```

Value at `zero`:

```
>>> 0.fibonacci
0
```

Threads over lists:

```
>>> 1:20.fibonacci
[1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765]
```

Fibonomial coefficients:

```
>>> { :n :k |
>>> 	1:k.collect { :j |
>>> 		(n + j - k).fibonacci / j.fibonacci
>>> 	}.product
>>> }.table(1:7, 1:7)
[
	 1   0   0   0   0  0 0;
	 1   1   0   0   0  0 0;
	 2   2   1   0   0  0 0;
	 3   6   3   1   0  0 0;
	 5  15  15   5   1  0 0;
	 8  40  60  40   8  1 0;
	13 104 260 260 104 13 1
]
```

Plot over a subset of the reals:

~~~
(-2 -- 2).subdivide(500).fibonacci.plot
~~~

The sequence of _F(n) % m_ is periodic with respect to _n_ for a fixed natural number _m_:

~~~
(0:35.fibonacci % 7).discretePlot
~~~

Fibonacci numbers modulo 10:

~~~
(1:100.fibonacci % 10).plot
~~~

Plot Fibonacci modulo _n_:

~~~
1:200.collect { :n |
	n.fibonacci % n
}.plot
~~~

Log plot of positive and negative Fibonacci numbers:

~~~
(-10 -- 10).subdivide(500).collect { :x |
	(x.fibonacci.abs + 1).log
}.plot
~~~

* * *

See also: fibonacciSequence, goldenRatio

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Fibonacci.html),
_OEIS_
[1](https://oeis.org/A000045),
_W_
[1](https://en.wikipedia.org/wiki/Fibonacci_sequence)
