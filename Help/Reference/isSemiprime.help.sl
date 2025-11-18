# isSemiprime

- _isSemiprime(n)_

Predicate to decide if _n_ is a semiprime number,
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
