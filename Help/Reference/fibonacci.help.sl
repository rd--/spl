# fibonacci

- _fibonacci(n, x=1)_

Answer the _n_-th Fibonacci number, _F(n)_.

The eighth Fibonacci number:

```
>>> 8.fibonacci
21

>>> 8.fibonacci(2)
408
```

At integer values:

```
>>> 3.fibonacci
2

>>> 3.fibonacci(2)
5
```

At non-integer real values:

```
>>> (15 / 17).fibonacci
0.95652

>>> (15 / 17).fibonacci(2)
0.92096

>>> 5.8.fibonacci
7.26639

>>> 5.8.fibonacci(3)
283.483
```

Value at `zero`:

```
>>> 1.fibonacci(0)
1

>>> 0.fibonacci
0
```

At negative `one`:

```
>>> -1.fibonacci
1

>>> -1.fibonacci(1)
1
```

Values at fixed points:

```
>>> 1:5.collect { :x |
>>> 	fibonacci(3, x)
>>> }
[2 5 10 17 26]
```

Threads over lists:

```
>>> 1:20.fibonacci
[
	1 1 2 3 5
	8 13 21 34 55
	89 144 233 377 610
	987 1597 2584 4181 6765
]

>>> [-1, 1 .. 13].fibonacci
[1 1 2 5 13 34 89 233]
```

Fibonomial coefficients:

```
>>> { :n :k |
>>> 	1:k.collect { :j |
>>> 		(n + j - k).fibonacci
>>> 		/
>>> 		j.fibonacci
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

The sequence of _F(n)%m_ is periodic with respect to _n_ for a fixed natural number _m_:

```
>>> 0:15.collect { :n |
>>> 	let m = n + 16;
>>> 	(m.fibonacci - n.fibonacci) % 7
>>> }
16 # [0]
```

With _x=2_ answers the Pell numbers,
OEIS [A000129](https://oeis.org/A000129):

```
>>> 0:15.collect { :n |
>>> 	fibonacci(n, 2)
>>> }
[
	     0    1     2     5    12
	    29   70   169   408   985
	  2378 5741 13860 33461 80782
	195025
]
```

With _x=3_,
OEIS [A006190](https://oeis.org/A006190):

```
>>> 0:13.collect { :n |
>>> 	fibonacci(n, 3)
>>> }
[
	    0      1      3      10      33
	  109    360   1189    3927   12970
	42837 141481 467280 1543321
]
```

With _x=4_,
OEIS [A001076](https://oeis.org/A001076):

```
>>> 0:13.collect { :n |
>>> 	fibonacci(n, 4)
>>> }
[
	     0       1       4       17    72
	   305    1292    5473    23184 98209
	416020 1762289 7465176 31622993
]
```

With _x=5_,
OEIS [A052918](https://oeis.org/A052918)

```
>>> 1:13.collect { :n |
>>> 	fibonacci(n, 5)
>>> }
[
	1 5 26 135 701
	3640 18901 98145 509626 2646275
	13741001 71351280 370497401
]
```

The Hosoya triangle,
OEIS [A058071](https://oeis.org/A058071):

```
>>> 1:11.triangularArray { :n :k |
>>> 	fibonacci(k)
>>> 	*
>>> 	fibonacci(n - k + 1)
>>> }
[
	 1;
	 1  1;
	 2  1  2;
	 3  2  2  3;
	 5  3  4  3  5;
	 8  5  6  6  5  8;
	13  8 10  9 10  8 13;
	21 13 16 15 15 16 13 21;
	34 21 26 24 25 24 26 21 34;
	55 34 42 39 40 40 39 42 34 55;
	89 55 68 63 65 64 65 63 68 55 89
]
```

First few terms of
OEIS [A001060](https://oeis.org/A001060):

```
>>> 0:11.collect { :n |
>>> 	(n + 4).fibonacci
>>> 	-
>>> 	(n - 1).fibonacci
>>> }
[2 5 7 12 19 31 50 81 131 212 343 555]
```

The closed form is implemented using approximate floating point constants and functions,
and is accurate only to the 75th term:

```
>>> let n = 75;
>>> (0 .. n - 1).fibonacci = n.fibonacciSequence
true

>>> 76.fibonacci
3416454622906708

>>> 77.fibonacciSequence.last
3416454622906707L
```

The variant `fibonacciNumber` consults a cached table and is accurate:

```
>>> 76.fibonacciNumber
3416454622906707L

>>> 175.fibonacciNumber
1672445759041379840132227567949787325L
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 2).functionPlot(fibonacci:/1)
~~~

![](sw/spl/Help/Image/fibonacci-A.svg)

Plot modulo seven,
period is sixteen,
OEIS [A105870](https://oeis.org/A105870):

~~~spl svg=B
(0:35.fibonacci % 7)
.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-B.svg)

Fibonacci numbers modulo ten
period is sixty,
OEIS [A003893](https://oeis.org/A003893):

~~~spl svg=C
(1:75.fibonacci % 10)
.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-C.svg)

Plot Fibonacci modulo _n_,
OEIS [A002708](https://oeis.org/A002708):

~~~spl svg=D
1:75.collect { :n |
	n.fibonacci % n
}.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacci-D.svg)

Log plot of positive and negative Fibonacci numbers:

~~~spl svg=E
(-10 -- 10).functionPlot { :x |
	(x.fibonacci.abs + 1).log
}
~~~

![](sw/spl/Help/Image/fibonacci-E.svg)

Plot over a larger subset of the reals:

~~~spl svg=F
(-7.5 -- 7.5).functionPlot(
	fibonacci:/1
)
~~~

![](sw/spl/Help/Image/fibonacci-F.svg)

Plot with _n=0.5_:

~~~spl svg=G
(-10 -- 10).functionPlot { :x |
	fibonacci(0.5, x)
}
~~~

![](sw/spl/Help/Image/fibonacci-G.svg)

Plot the Fibonacci polynomial for various orders:

~~~spl svg=H
(-2 -- 2).functionPlot(
	1:4.collect { :n |
		{ :x |
			fibonacci(n, x)
		}
	}
)
~~~

![](sw/spl/Help/Image/fibonacci-H.svg)

* * *

See also: binetsFormula, fibonacciPolynomial, fibonacciSequence, fibonacciSequenceUpTo, goldenRatio, lucasNumber

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Fibonacci.html),
_OEIS_
[1](https://oeis.org/A000045)
[2](https://oeis.org/A001605)
[3](https://oeis.org/A105870),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.fibonacci),
_W_
[1](https://en.wikipedia.org/wiki/Fibonacci_sequence)
