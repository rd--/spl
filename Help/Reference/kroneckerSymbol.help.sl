# kroneckerSymbol

- _kroneckerSymbol(n, m)_

Answer the Kronecker symbol for _n/m_,
also known as the Jacobi symbol or Legendre symbol.

```
>>> kroneckerSymbol(17, 6)
-1

>>> kroneckerSymbol:/2.table(1:5, 1:5)
[
	1  1  1  1  1;
	1  0 -1  0 -1;
	1 -1  0  1 -1;
	1  0  1  0  1;
	1 -1 -1  1  0
]

>>> kroneckerSymbol:/2
>>> .table(1:10, 1:4)
>>> .transpose
[
	1  1  1  1  1  1  1  1  1  1;
	1  0 -1  0 -1  0  1  0  1  0;
	1 -1  0  1 -1  0  1 -1  0  1;
	1  0  1  0  1  0  1  0  1  0
]

>>> kroneckerSymbol(10, 13)
1

>>> [2 3 5 7 11].collect { :n |
>>> 	n.kroneckerSymbol(6)
>>> }
[0 0 1 1 1]

>>> kroneckerSymbol:/2.table(1:10, 1:10)
[
	1  1  1  1  1  1  1  1  1  1;
	1  0 -1  0 -1  0  1  0  1  0;
	1 -1  0  1 -1 -0 -1 -1  0  1;
	1  0  1  0  1  0  1  0  1  0;
	1 -1 -1  1  0  1 -1 -1  1 -0;
	1  0  0  0  1  0 -1  0  0  0;
	1  1  1  1 -1  1  0  1  1 -1;
	1  0 -1  0 -1  0  1  0  1  0;
	1  1  0  1  1  0  1  1  0  1;
	1  0  1  0  0  0 -1  0  1  0
]
```

Zero for non-coprime integers:

```
>>> kroneckerSymbol(9, 12)
0

>>> isCoprime(9, 12)
false
```

Completely multiplicative function for each argument:

```
>>> let a = kroneckerSymbol(3 * 4, 7);
>>> let b = kroneckerSymbol(3, 7);
>>> let c = kroneckerSymbol(4, 7);
>>> (a, b * c)
(-1, -1)

>>> let a = kroneckerSymbol(3, 9 * 7);
>>> let b = kroneckerSymbol(3, 9);
>>> let c = kroneckerSymbol(3, 7);
>>> (a, b * c)
(0, 0)
```

Compute real Dirichlet characters modulo _k_ for odd integers _k_:

```
>>> 0:4.collect { :n |
>>> 	kroneckerSymbol(n, 5)
>>> }
[0 1 -1 -1 1]
```

At specific values:

```
>>> kroneckerSymbol(1, 5)
1

>>> kroneckerSymbol(3, 8)
-1

>>> kroneckerSymbol(15, 22)
1

>>> kroneckerSymbol(21, 7)
0

>>> kroneckerSymbol(5, 31)
1

>>> kroneckerSymbol(31, 5)
1

>>> kroneckerSymbol(7, 19)
1

>>> kroneckerSymbol(19, 7)
-1

>>> kroneckerSymbol(323, 455625)
1

>>> kroneckerSymbol(0, 12)
0

>>> kroneckerSymbol(0, 1)
1

>>> kroneckerSymbol(12, 0)
0

>>> kroneckerSymbol(1, 0)
1

>>> kroneckerSymbol(-1, 5)
1

>>> kroneckerSymbol(1, -5)
1

>>> kroneckerSymbol(-1, -5)
-1

>>> kroneckerSymbol(6, 7)
-1

>>> kroneckerSymbol(-1, -7)
1

>>> kroneckerSymbol(-6, -7)
-1
```

Quadratic residues and nonresidues:

```
>>> 1:22.select { :x |
>>> 	kroneckerSymbol(x, 23) = 1
>>> }
[1 2 3 4 6 8 9 12 13 16 18]

>>> 1:22.select { :x |
>>> 	kroneckerSymbol(x, 23) = -1
>>> }
[5 7 10 11 14 15 17 19 20 21 22]
```

Plot:

~~~spl svg=A
kroneckerSymbol:/2
.table(-7:7, -7:7)
.arrayPlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-A.svg)

Plot theta series of planar hexagonal lattice _A2_,
OEIS [A004016](https://oeis.org/A004016):

~~~spl svg=B
1:73.collect { :n |
	(n = 1).if {
		1
	} {
		6 * n.divisorSum { :x |
			x.kroneckerSymbol(3)
		}
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-B.svg)

* * *

See also: jacobiSymbol, legendreSymbol

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KroneckerSymbol.html)
[2](https://reference.wolfram.com/language/ref/KroneckerSymbol.html),
_W_
[1](https://en.wikipedia.org/wiki/Kronecker_symbol)
