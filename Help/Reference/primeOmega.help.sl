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

Numbers that are the product of three (not necessarily distinct) primes,
OEIS [A014612](https://oeis.org/A014612):

```
>>> 1:244.select { :n |
>>> 	n.primeOmega = 3
>>> }
[
	  8  12  18  20  27
	 28  30  42  44  45
	 50  52  63  66  68
	 70  75  76  78  92
	 98  99 102 105 110
	114 116 117 124 125
	130 138 147 148 153
	154 164 165 170 171
	172 174 175 182 186
	188 190 195 207 212
	222 230 231 236 238
	242 244
]
```

Numbers with an even number of prime divisors,
OEIS [A028260](https://oeis.org/A028260):

```
>>> 1:23.select { :n |
>>> 	n.primeOmega.isEven
>>> }
[1 4 6 9 10 14 15 16 21 22]
```

Plot the `primeOmega` sequence for the first 100 numbers:

~~~spl svg=A
(1:100).functionPlot(primeOmega:/1)
~~~

![](sw/spl/Help/Image/primeOmega-A.svg)

Plot the number of positive integers less than or equal to _n_,
with the same number of prime factors as _n_,
counted with multiplicity,
OEIS [A058933](https://oeis.org/A058933):

~~~spl svg=B
let m = Map();
let f = { :x |
	let y = m.atIfAbsent(x) { 0 };
	m.atPut(x, y + 1)
};
1:200.collect { :n |
	f(n.primeOmega)
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeOmega-B.svg)

* * *

See also: factorInteger, isPrimePower, primeNu

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PrimeOmega.html),
_OEIS_
[1](https://oeis.org/A001222)
[2](https://oeis.org/A014612)
[3](https://oeis.org/A058933),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.factor_.primeomega),
_W_
[1](https://en.wikipedia.org/wiki/Prime_omega_function)
