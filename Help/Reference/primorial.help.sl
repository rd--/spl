# primorial

- _primorial(n)_

Answer the _n_-th primorial number,
the product of the first _n_ primes.

```
>>> primorial(4)
210

>>> [2 3 5 7].product
210

>>> primorial(1)
2

>>> 11.primorial
200560490130

>>> 11.primesList.product
200560490130
```

The first few terms:

```
>>> 1:9.collect(primorial:/1)
[
	2 6 30 210 2310
	30030 510510 9699690 223092870
]
```

* * *

See also: euclidNumber, factorial, primePi

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Primorial.html)
_OEIS_
[1](https://oeis.org/A002110)
_W_
[1](https://en.wikipedia.org/wiki/Primorial),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.generate.primorial)
