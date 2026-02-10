# primeNu

- _primeNu(x)_

Answer the number of distinct prime factors of _x_.

```
>>> 24.primeNu
2

>>> 24.distinctPrimeFactors
[2 3]

>>> 105.primeNu
3

>>> 105.distinctPrimeFactors
[3 5 7]
```

Compute for large integers:

```
>>> 50L.!.primeNu
15
```

`primeNu` is an additive function:

```
>>> (9 * 40).primeNu
9.primeNu + 40.primeNu
```

`primeNu` gives `one` for a prime power:

```
>>> 49.isPrimePower
true

>>> 49.primeNu
1
```

First few terms,
OEIS [A001221](https://oeis.org/A001221):

```
>>> 1:100.collect(primeNu:/1)
[
	0 1 1 1 1 2 1 1 1 2 1 2 1 2 2 1 1 2 1 2
	2 2 1 2 1 2 1 2 1 3 1 1 2 2 2 2 1 2 2 2
	1 3 1 2 2 2 1 2 1 2 2 2 1 2 2 2 2 2 1 3
	1 2 2 1 2 3 1 2 2 3 1 2 1 2 2 2 2 3 1 2
	1 2 1 3 2 2 2 2 1 3 2 2 2 2 2 2 1 2 2 2
]
```

The number of unitary divisors,
OEIS [A034444](https://oeis.org/A034444):

```
>>> 1:110.collect { :n |
>>> 	2 ^ n.primeNu
>>> }
[
	1 2 2 2 2 4 2 2 2 4 2 4 2 4 4 2 2 4 2 4
	4 4 2 4 2 4 2 4 2 8 2 2 4 4 4 4 2 4 4 4
	2 8 2 4 4 4 2 4 2 4 4 4 2 4 4 4 4 4 2 8
	2 4 4 2 4 8 2 4 4 8 2 4 2 4 4 4 4 8 2 4
	2 4 2 8 4 4 4 4 2 8 4 4 4 4 4 4 2 4 4 4
	2 8 2 4 8 4 2 4 2 8
]
```

Plot the `primeNu` sequence for the first 100 numbers:

~~~spl svg=A
1:100.functionPlot(primeNu:/1)
~~~

![](sw/spl/Help/Image/primeNu-A.svg)

Plot rational knots of determinant _2n+1_,
counting chiral pairs twice,
OEIS [A089266](https://oeis.org/A089266):

~~~spl svg=B
1:200.collect { :n |
	let m = (2 * n + 1);
	let a = m.eulerPhi;
	let b = 2 ^ m.primeNu;
	(a + b) / 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeNu-B.svg)

Plot barriers,
OEIS [A005236](https://oeis.org/A005236):

~~~spl svg=C
2:150.select { :n |
	let m = n - 1;
	1:m.allSatisfy { :x |
		x + x.primeNu <= n
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/primeNu-C.svg)

Plot `lcm` of all divisors _d_ of _n_ such that _d+1_ is a prime power,
OEIS [A049073](https://oeis.org/A049073):

~~~spl svg=D
1:65.collect { :n |
	n.divisors.select { :d |
		(d + 1).primeNu = 1
	}.lcm
}.stepPlot
~~~

![](sw/spl/Help/Image/primeNu-D.svg)

* * *

See also: distinctPrimeFactors, factorInteger, gcd, isPrime, isPrimePower, isSquareFree, primeOmega

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DistinctPrimeFactors.html)
[2](https://reference.wolfram.com/language/ref/PrimeNu.html),
_OEIS_
[1](https://oeis.org/A001221)
[2](https://oeis.org/A034444)
[3](https://oeis.org/A089266),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.factor_.primenu),
_W_
[1](https://en.wikipedia.org/wiki/Prime_omega_function)

Categories: Math
