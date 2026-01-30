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

Plot the sequence varying _m_:

~~~spl svg=A
(1, 3 .. 100).collect { :m |
	100.jacobiSymbol(m)
}.discretePlot
~~~

![](sw/spl/Help/Image/jacobiSymbol-A.svg)

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

![](sw/spl/Help/Image/jacobiSymbol-B.png)

Plot triangle in which _n_-th row gives quadratic non-residues modulo the _n_-th prime,
OEIS [A063988](https://oeis.org/A063988):

~~~spl svg=C
2:12.collect { :n |
	let p = n.prime;
	let q = p - 1;
	1:q.select { :m |
		jacobiSymbol(m, p) = -1
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/jacobiSymbol-C.svg)

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
