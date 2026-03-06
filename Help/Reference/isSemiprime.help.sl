# isSemiprime

- _isSemiprime(n)_

Predicate to decide if _n_ is a semiprime number.

The first few semiprime numbers,
OEIS [A001358](https://oeis.org/A001358)

```
>>> 1:100.select(isSemiprime:/1)
[
	 4  6  9 10 14 15 21 22 25 26
	33 34 35 38 39 46 49 51 55 57
	58 62 65 69 74 77 82 85 86 87
	91 93 94 95
]
```

Semiprimes that are not square numbers are called discrete, distinct, or squarefree semiprimes,
OEIS [A006881](https://oeis.org/A006881):

```
>>> 1:100.select { :n |
>>> 	n.isSemiprime & {
>>> 		n.isSquareFree
>>> 	}
>>> }
[
	 6 10 14 15 21 22 26 33 34 35
	38 39 46 51 55 57 58 62 65 69
	74 77 82 85 86 87 91 93 94 95
]
```

The first few semiprime numbers,
OEIS [A001358](https://oeis.org/A001358)

~~~spl svg=A
1:250.select(isSemiprime:/1).scatterPlot
~~~

![](sw/spl/Help/Image/isSemiprime-A.svg)

The characteristic function of the semiprime numbers,
OEIS [A064911](https://oeis.org/A064911)

~~~spl svg=B
1:115.collect(isSemiprime:/1)
.boole
.discretePlot
~~~

![](sw/spl/Help/Image/isSemiprime-B.svg)

The squarefree semiprimes,
OEIS [A006881](https://oeis.org/A006881):

~~~spl svg=C
1:250.select { :n |
	n.isSemiprime & {
		n.isSquareFree
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/isSemiprime-C.svg)

* * *

See also: isComposite, isPrime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Semiprime.html),
_OEIS_
[1](https://oeis.org/A001358)
[2](https://oeis.org/A006881),
_W_
[1](https://en.wikipedia.org/wiki/Semiprime)
