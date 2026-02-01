# primeExponents

- _primeExponents(n)_

Prime exponents in the factorization of the integer _n_.

An exponent of `zero` means that the corresponding prime is not a factor of _n_.

```
>>> 700.primeExponents
[2 0 2 1]

>>> ([2 3 5 7] ^ [2 0 2 1]).product
700

>>> (2 * 3 * 5 * 17).primeExponents
[1 1 1 0 0 0 1]
```

Table of exponents of prime factorizations in
OEIS [A025487](https://oeis.org/A025487),
OEIS [A124832](https://oeis.org/A124832):

~~~spl svg=A
OeisEntry('A025487').then { :e |
	e.bFileData
	.first(150)
	.collect(primeExponents:/1)
	.catenate
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/primeExponents-A.svg)

* * *

See also: factorInteger, primeFactors

Guides: Prime Number Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/qco#dyadic)
