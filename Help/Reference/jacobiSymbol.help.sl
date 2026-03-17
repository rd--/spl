# jacobiSymbol

- _jacobiSymbol(n, m)_

Answer the Jacobi symbol for _n/m_,
where _m_ is a positive odd integer.

Follows the normal convention for the empty product:

```
>>> 3.jacobiSymbol(1)
1
```

Compute Jacobi symbols:

```
>>> jacobiSymbol(10, 5)
0

>>> 45.jacobiSymbol(77)
-1

>>> (1 .. 10).collect { :n |
>>> 	(1, 3 .. n).collect { :m |
>>> 		jacobiSymbol(n, m)
>>> 	}
>>> }
[
	1;
	1;
	1 0;
	1 1;
	1 -1 0;
	1 0 1;
	1 1 -1 0;
	1 -1 -1 1;
	1 0 1 1 0;
	1 1 0 -1 1
]

>>> [2 3 5 7 11].collect { :n |
>>> 	n.jacobiSymbol(3)
>>> }
[-1, 0, -1, 1, -1]

>>> jacobiSymbol(45, 77)
-1

>>> jacobiSymbol(60, 121)
1

>>> 7.jacobiSymbol(45)
-1

>>> 1001.jacobiSymbol(9907)
-1

>>> 19.jacobiSymbol(45)
1

>>> 8.jacobiSymbol(21)
-1

>>> 5.jacobiSymbol(21)
1

>>> 5.jacobiSymbol(5)
0
```

With negative first argument:

```
>>> [1 3 5 7].collect { :m |
>>> 	-3.jacobiSymbol(m)
>>> }
[1 0 -1 1]
```

Find Euler–Jacobi pseudoprimes,
OEIS [A047713](https://oeis.org/A047713):

```
>>> 1:5000.select { :m |
>>> 	m.gcd(2) = 1 & {
>>> 		m.isPrime.not & {
>>> 			2.jacobiSymbol(m)
>>> 			=
>>> 			((2 ^ ((m - 1) / 2)) % m)
>>> 		}
>>> 	}
>>> }
[561 1105 1729 1905 2047]
```

Threads element-wise over lists:

```
>>> [2 3 5 7 11].jacobiSymbol(3)
[-1 0 -1 1 -1]
```

Legendre symbol _(n,17)_,
OEIS [A011584](https://oeis.org/A011584):

```
>>> 0:18.jacobiSymbol(17)
[0 1 1 -1 1 -1 -1 -1 1 1 -1 -1 -1 1 -1 1 1 0 1]
```

Inert rational primes in _Q(√3)_,
OEIS [A003630](https://oeis.org/A003630):

```
>>> 2:27.prime.select { :p |
>>> 	3.jacobiSymbol(p) = -1
>>> }
[5 7 17 19 29 31 41 43 53 67 79 89 101 103]
```

Squares modulo _23_,
OEIS [A010385](https://oeis.org/A010385):

```
>>> 0:22.select { :n |
>>> 	n.jacobiSymbol(23) != -1
>>> }
[0 1 2 3 4 6 8 9 12 13 16 18]
```

Squares modulo _43_,
OEIS [A010404](https://oeis.org/A010404):

```
>>> 0:42.select { :n |
>>> 	n.jacobiSymbol(43) != -1
>>> }
[
	 0  1  4  6  9 10 11 13 14 15
	16 17 21 23 24 25 31 35 36 38
	40 41
]
```

Plot the sequence varying _m_:

~~~spl svg=A
(1, 3 .. 100).collect { :m |
	100.jacobiSymbol(m)
}.discretePlot
~~~

![](Help/Image/jacobiSymbol-A.svg)

Successive differences modulo two:

~~~spl png=B
let k = 100;
let j = differences:/1.nestList(
	jacobiSymbol((1L .. k), 77),
	k
);
(j  % 2)
.padRight([k + 1, k + 1], 0)
.Bitmap
~~~

![](Help/Image/jacobiSymbol-B.png)

Triangle in which _n_-th row gives quadratic non-residues modulo the _n_-th prime,
OEIS [A063988](https://oeis.org/A063988):

~~~spl svg=C oeis=A063988
2:12.collect { :n |
	let p = n.prime;
	let q = p - 1;
	1:q.select { :m |
		jacobiSymbol(m, p) = -1
	}
}.catenate.scatterPlot
~~~

![](Help/Image/jacobiSymbol-C.svg)

Legendre symbol _(n,17)_,
OEIS [A011584](https://oeis.org/A011584):

~~~spl svg=D oeis=A011584
0:85.jacobiSymbol(17).discretePlot
~~~

![](Help/Image/jacobiSymbol-D.svg)

Legendre symbol _(n,29)_,
OEIS [A011587](https://oeis.org/A011587):

~~~spl svg=E oeis=A011587
0:85.jacobiSymbol(29).discretePlot
~~~

![](Help/Image/jacobiSymbol-E.svg)

* * *

See also: factorInteger, kroneckerSymbol, legendreSymbol

References:
_Mathematica_
[1](https://mathworld.wolfram.com/JacobiSymbol.html)
[2](https://reference.wolfram.com/language/ref/JacobiSymbol.html),
_OEIS_
[1](https://oeis.org/A047713)
[2](https://oeis.org/A063988),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.jacobi_symbol),
_W_
[1](https://en.wikipedia.org/wiki/Jacobi_symbol)
