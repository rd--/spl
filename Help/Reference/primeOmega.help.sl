# primeOmega

- _primeOmega(n)_

Answer the number of prime factors counting multiplicities in the integer _n_.

```
>>> 12.primeOmega
3

>>> 30.primeOmega
3
```

Compute for large integers:

```
>>> 30L.!.primeOmega
59
```

Threads over lists:

```
>>> [4 12 24].primeOmega
[2 3 4]
```

`primeOmega` is a completely additive function:

```
>>> (24 * 40).primeOmega
24.primeOmega + 40.primeOmega
```

`primeOmega` gives the exponent for a prime power:

```
>>> (7 ^ 5).isPrimePower
true

>>> (7 ^ 5).primeOmega
5
```

`primeOmega` and `primeNu` are equivalent when the argument is square-free:

```
>>> 165.isSquareFree
true

>>> 165.primeOmega
165.primeNu
```

First few terms,
OEIS [A001222](https://oeis.org/A001222):

```
>>> 1:100.collect(primeOmega:/1)
[
	0 1 1 2 1 2 1 3 2 2 1 3 1 2 2 4 1 3 1 3
	2 2 1 4 2 2 3 3 1 3 1 5 2 2 2 4 1 2 2 4
	1 3 1 3 3 2 1 5 2 3 2 3 1 4 2 4 2 2 1 4
	1 2 3 6 2 3 1 3 2 3 1 5 1 2 3 3 2 3 1 5
	4 2 1 4 2 2 2 4 1 4 2 3 2 2 2 6 1 3 3 4
]
```

Plot the `primeOmega` sequence for the first 100 numbers:

~~~spl svg=A
(1:100).functionPlot(primeOmega:/1)
~~~

![](sw/spl/Help/Image/primeOmega-A.svg)

* * *

See also: factorInteger, isPrimePower, primeNu

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PrimeOmega.html),
_OEIS_
[1](https://oeis.org/A001222),
_W_
[1](https://en.wikipedia.org/wiki/Prime_omega_function)
