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

At `Fraction`:

```
>>> 9/8.primeExponents
[-3 2]

>>> 45/32.primeExponents
[-5 2 1]

>>> 135/124.primeExponents
[-2 3 1 0 0 0 0 0 0 0 -1]
```

Table of exponents of prime factorizations in
OEIS [A025487](https://oeis.org/A025487),
OEIS [A124832](https://oeis.org/A124832):

~~~spl svg=A oeis=A124832
OeisEntry('A025487').then { :e |
	e.bFileSequence
	.first(150)
	.collect(primeExponents:/1)
	.catenate
	.scatterPlot
}
~~~

![](Help/Image/primeExponents-A.svg)

Number of distinct exponents when _n_ is factorized as a product of primes,
OEIS [A071625](https://oeis.org/A071625):

~~~spl svg=B oeis=A071625
1:85.collect { :n |
	n.primeExponents
	.without(0)
	.deleteDuplicates
	.size
}.stepPlot
~~~

![](Help/Image/primeExponents-B.svg)

Maximum exponent in the prime factorization of _n_,
OEIS [A051903](https://oeis.org/A051903):

~~~spl svg=C oeis=A051903
2:85.collect { :n |
	n.primeExponents.max
}.stepPlot
~~~

![](Help/Image/primeExponents-C.svg)

Minimum exponent in the prime factorization of _n_,
OEIS [A051904](https://oeis.org/A051904):

~~~spl svg=D oeis=A051904
2:85.collect { :n |
	n.primeExponents.min
}.stepPlot
~~~

![](Help/Image/primeExponents-D.svg)

Numbers with different exponents in their prime factorizations,
OEIS [A059404](https://oeis.org/A059404):

~~~spl svg=E oeis=A059404
1:200.select { :n |
	let e = n.primeExponents;
	let u = e.without(0).deleteDuplicates;
	u.size > 1
}.discretePlot
~~~

![](Help/Image/primeExponents-E.svg)

Perfect powers of squarefree kernels,
OEIS [A062770](https://oeis.org/A062770):

~~~spl svg=F oeis=A062770
1:85.select { :n |
	let e = n.primeExponents;
	let u = e.without(0).deleteDuplicates;
	u.size = 1
}.discretePlot
~~~

![](Help/Image/primeExponents-F.svg)

* * *

See also: factorInteger, primeFactors, primeSignature

Guides: Prime Number Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/qco#dyadic)
