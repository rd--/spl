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

At _n=-2_,
OEIS [A188510](https://oeis.org/A188510):

```
>>> 0:15.collect { :m |
>>> 	-2.kroneckerSymbol(m)
>>> }
[
	0 1 0 1 0 -1 0 -1
	0 1 0 1 0 -1 0 -1
]
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

Number of different partitions of _n_ into parts of -3 different kinds,
OEIS [A010816](https://oeis.org/A010816):

~~~spl svg=C
0:200.collect { :n |
	let m = 8 * n + 1;
	m.divisors.size.isOdd.if {
		let y = m.sqrt;
		y * -4.kroneckerSymbol(y)
	} {
		0
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-C.svg)

From Euler’s pentagonal theorem,
OEIS [A010815](https://oeis.org/A010815):

~~~spl svg=D
0:200.collect { :n |
	let m = (24 * n + 1).sqrt;
	m.isInteger.if {
		12.kroneckerSymbol(m)
	} {
		0
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-D.svg)

Plot Glaisher’s J numbers,
OEIS [A002325](https://oeis.org/A002325):

~~~spl svg=E
1:150.collect { :n |
	n.divisors.sum { :d |
		-8.kroneckerSymbol(d)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-E.svg)

Plot _|a_4(n)|_,
OEIS [A033715](https://oeis.org/A033715):

~~~spl svg=F
0:103.collect { :n |
	(n < 1).if {
		(n = 0).boole
	} {
		2 * n.divisorSum { :m |
			-2.kroneckerSymbol(m)
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-F.svg)

Plot unique cusp form of weight two for congruence group _Γ1(11)_,
OEIS [A006571](https://oeis.org/A006571):

~~~spl svg=G
let f = { :p :e |
	let a0 = 1;
	let a1 = 0 - (0 .. p - 1).sum { :x |
		kroneckerSymbol(
			[
				4 * x.cube,
				-4 * x.square,
				1
			].sum,
			p
		)
	};
	let y = a1;
	2.toDo(e) { :i |
		let x = (y * a1) - (p * a0);
		a0 := a1;
		a1 := x
	};
	a1
};
1:100.collect { :n |
	n.factorInteger.product { :x |
		(x[1] = 1).if {
			1
		} {
			f(x[1], x[2])
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-G.svg)

* * *

See also: jacobiSymbol, legendreSymbol

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KroneckerSymbol.html)
[2](https://reference.wolfram.com/language/ref/KroneckerSymbol.html),
_W_
[1](https://en.wikipedia.org/wiki/Kronecker_symbol)
