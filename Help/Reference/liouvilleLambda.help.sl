# liouvilleLambda

- _liouvilleLambda(n)_

Answer the Liouville lambda function at _n_.
The answer is one whenever the number of prime factors counting multiplicity of _n_ is even,
and negative one otherwise.

Compute the Liouville function at 8 and 9:

```
>>> 8.liouvilleLambda
-1

>>> 9.liouvilleLambda
1
```

Threads over lists,
first few terms,
OEIS [A008836](https://oeis.org/A008836):

```
>>> 1:34.liouvilleLambda
[
	 1 -1 -1  1 -1  1 -1 -1  1  1
	-1 -1 -1  1  1  1 -1 -1 -1 -1
	 1  1 -1  1  1  1 -1 -1 -1 -1
	-1 -1  1  1
]
```

Partial sums,
called Liouville’s function,
OEIS [A002819](https://oeis.org/A002819)

```
>>> 1:34.liouvilleLambda
>>> .prefixSum
[
	    1  0 -1  0 -1  0 -1 -2 -1
	 0 -1 -2 -3 -2 -1  0 -1 -2 -3
	-4 -3 -2 -3 -2 -1  0 -1 -2 -3
	-4 -5 -6 -5 -4
]
```

Calculate directly in terms of `primeOmega`,
implemented as `liouvilleFunction`:

```
>>> 0:34.collect(liouvilleFunction:/1)
[
	 0  1  0 -1  0 -1  0 -1 -2 -1
	 0 -1 -2 -3 -2 -1  0 -1 -2 -3
	-4 -3 -2 -3 -2 -1  0 -1 -2 -3
	-4 -5 -6 -5 -4
]
```

Select integers where the number of prime divisors is odd,
OEIS [A026424](https://oeis.org/A026424):

```
>>> 2:27.select { :n |
>>> 	n.liouvilleLambda = -1
>>> }
[2 3 5 7 8 11 12 13 17 18 19 20 23 27]
```

Numbers _k_ such that the summatory Liouville function is zero,
OEIS [A028488](https://oeis.org/A028488):

```
>>> 1:5000.liouvilleLambda
>>> .prefixSum
>>> .indicesOf(0)
[2 4 6 10 16 26 40 96 586]
```

Values of _L(10^n)_,
OEIS [A090410](https://oeis.org/A090410):

```
>>> 0:4.collect { :n |
>>> 	let m = 10 ^ n;
>>> 	1:m.sum(liouvilleLambda:/1)
>>> }
[1 0 -2 -14 -94]
```

Plot the Liouville lambda sequence for the first 20 numbers:

~~~spl svg=A
1:20.collect(liouvilleLambda:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-A.svg)

Parity of number of primes dividing _n_,
OEIS [A007421](https://oeis.org/A007421):

~~~spl svg=B
1:75.collect { :n |
	(n.liouvilleLambda + 3) / 2
}.stepPlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-B.svg)

Plot Liouville’s function,
OEIS [A002819](https://oeis.org/A002819):

~~~spl svg=C
0:165.liouvilleLambda
.prefixSum
.scatterPlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-C.svg)

Plot least value of _m_ for which Liouville’s function is _-n_,
OEIS [A002053](https://oeis.org/A002053):

~~~spl svg=D
let l = 0:3000.liouvilleLambda.prefixSum;
0:65.collect { :n |
	l.indexOf(-n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-D.svg)

Plot parity of _Ω(n)_,
OEIS [A066829](https://oeis.org/A066829):

~~~spl svg=E
1:65.collect { :n |
	(1 - n.liouvilleLambda) / 2
}.discretePlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-E.svg)

* * *

See also: primeFactors, primeOmega, size

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LiouvilleFunction.html)
[2](https://reference.wolfram.com/language/ref/LiouvilleLambda.html),
_OEIS_
[1](https://oeis.org/A008836)
[2](https://oeis.org/A007421),
_W_
[1](https://en.wikipedia.org/wiki/Liouville_function)
