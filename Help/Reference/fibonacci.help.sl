# fibonacci

- _fibonacci(n, x=1)_

Answer the generalised Fibonacci number _F𐞪(n)_,
where _n_ may be any real number.
Where _n_ is an integer answers _F(n)_.

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
>>> 0:9.collect { :x |
>>> 	fibonacci(3, x)
>>> }
[1 2 5 10 17 26 37 50 65 82]
```

Threads over lists.
First few terms,
OEIS [A000045](https://oeis.org/A000045)
and OEIS [A000045](https://oeis.org/A000071):

```
>>> 1:20.fibonacci
[
	1 1 2 3 5
	8 13 21 34 55
	89 144 233 377 610
	987 1597 2584 4181 6765
]

>>> 1:13.fibonacci - 1
[0 0 1 2 4 7 12 20 33 54 88 143 232]
```

Odd terms from _-1_:

```
>>> [-1, 1 .. 13].fibonacci
[1 1 2 5 13 34 89 233]
```

Fibonomial coefficients,
OEIS [A010048](https://oeis.org/A010048):

```
>>> 1:7.triangularArray { :n :k |
>>> 	1:k.collect { :j |
>>> 		(n + j - k).fibonacci
>>> 		/
>>> 		j.fibonacci
>>> 	}.product
>>> }
[
	 1;
	 1   1;
	 2   2   1;
	 3   6   3   1;
	 5  15  15   5   1;
	 8  40  60  40   8   1;
	13 104 260 260 104  13   1
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

Fibonacci entry points,
OEIS [A001177](https://oeis.org/A001177):

```
>>> 1:69.collect { :n |
>>> 	let k = 1;
>>> 	{ k.fibonacci % n != 0 }.whileTrue {
>>> 		k := k + 1
>>> 	};
>>> 	k
>>> }
[
	 1  3  4  6  5 12  8 6  12 15
	10 12  7 24 20 12  9 12 18 30
	 8 30 24 12 25 21 36 24 14 60
	30 24 20  9 40 12 19 18 28 30
	20 24 44 30 60 24 16 12 56 75
	36 42 27 36 10 24 36 42 58 60
	15 30 24 48 35 60 68 18 24
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

Leonardo numbers,
OEIS [A001595](https://oeis.org/A001595):

```
>>> 0:13.collect { :n |
>>> 	2 * (n + 1).fibonacci - 1
>>> }
[1 1 3 5 9 15 25 41 67 109 177 287 465 753]
```

The closed form is implemented using approximate floating point constants and functions,
and is accurate only to the 75th term.
For positive integer values where _x=1_ `fibonacci` is equivalent to `fibonacciNumber`,
which consults a cached table, is accurate, and may answer a `LargeInteger`:

```
>>> 76.fibonacci
3416454622906708

>>> 175.fibonacci
1672445759041379840132227567949787325L
```

The golden triangle,
OEIS [A180662](https://oeis.org/A180662):

```
>>> 0:10.triangularArray { :n :k |
>>> 	[k, k + 1].fibonacci.product
>>> }
[
	0;
	0 1;
	0 1 2;
	0 1 2 6;
	0 1 2 6 15;
	0 1 2 6 15 40;
	0 1 2 6 15 40 104;
	0 1 2 6 15 40 104 273;
	0 1 2 6 15 40 104 273 714;
	0 1 2 6 15 40 104 273 714 1870;
	0 1 2 6 15 40 104 273 714 1870 4895
]
```

Numbers having three ones in their base-phi representation,
OEIS [A104626](https://oeis.org/A104626):

```
>>> 4:12.collect { :n |
>>> 	fibonacci(2 * n - [3 5]).sum + 1
>>> }
[8 19 48 124 323 844 2208 5779 15128]
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

Plot number of representations of _n_ as a sum of distinct Fibonacci numbers,
OEIS [A000119](https://oeis.org/A000119):

~~~spl svg=I
1:150.collect { :n |
	let a = Polynomial([0: 1, n: n]);
	let m = 2;
	let f = m.fibonacci;
	{ f <= n }.whileTrue {
		a := a * Polynomial([0: 1, f: 1]);
		m := m + 1;
		f := m.fibonacci
	};
	a.coefficientList.at(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacci-I.svg)

Plot the number of ways to express _n_ as the sum of an odd prime, a positive Fibonacci number and twice a positive Fibonacci number,
OEIS [A155114](https://oeis.org/A155114):

~~~spl svg=J
let pq = { :m |
	m > 2 & { m.isPrime }
};
1:99.collect { :n |
	let a = 2 * 2.max(n / 2).log(2);
	2:a.collect { :x |
		let b = 2 * x.fibonacci;
		let c = 2 * 2.max(n - b).log(2);
		2:c.collect { :y |
			pq(n - b - y.fibonacci).boole
		}.sum
	}.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-J.svg)

Plot smallest positive Fibonacci number divisible by _n_,
OEIS [A047930](https://oeis.org/A047930):

~~~spl svg=K
let x = 1:250.fibonacci;
1:100.collect { :n |
	x.detect { :x |
		x.divisible(n)
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacci-K.svg)

Plot modulo twelve,
period is twenty-four,
OEIS [A089911](https://oeis.org/A089911):

~~~spl svg=L
(0:47.fibonacci % 12)
.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-L.svg)

* * *

See also: binetsFormula, fibonacciEntryPoint, fibonacciNumber, fibonacciPolynomial, fibonacciSequence, goldenRatio, lucasNumber

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Fibonacci.html),
_OEIS_
[1](https://oeis.org/A000045)
[2](https://oeis.org/A001605)
[3](https://oeis.org/A105870)
[4](https://oeis.org/A010048)
[5](https://oeis.org/A000071)
[6](https://oeis.org/A001595)
[7](https://oeis.org/A155114),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.fibonacci),
_W_
[1](https://en.wikipedia.org/wiki/Fibonacci_sequence)
