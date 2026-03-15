# primeNu

- _primeNu(x)_

Answer the number of distinct prime factors of _x_,
usually written _ω(x)_.

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

The `primeNu` sequence for the first 100 numbers,
OEIS [A001221](https://oeis.org/A001221):

~~~spl svg=A oeis=A001221
1:100.functionPlot(primeNu:/1)
~~~

![](sw/spl/Help/Image/primeNu-A.svg)

Rational knots of determinant _2n+1_,
counting chiral pairs twice,
OEIS [A089266](https://oeis.org/A089266):

~~~spl svg=B oeis=A089266
1:200.collect { :n |
	let m = (2 * n + 1);
	let a = m.eulerPhi;
	let b = 2 ^ m.primeNu;
	(a + b) / 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeNu-B.svg)

Barriers for _ω(n)_,
OEIS [A005236](https://oeis.org/A005236):

~~~spl svg=C oeis=A005236
2:150.select { :n |
	let m = n - 1;
	1:m.allSatisfy { :x |
		x + x.primeNu <= n
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/primeNu-C.svg)

`lcm` of all divisors _d_ of _n_ such that _d+1_ is a prime power,
OEIS [A049073](https://oeis.org/A049073):

~~~spl svg=D oeis=A049073
1:65.collect { :n |
	n.divisors.select { :d |
		(d + 1).primeNu = 1
	}.lcm
}.stepPlot
~~~

![](sw/spl/Help/Image/primeNu-D.svg)

Count of non-unitary divisors of _n_,
OEIS [A048105](https://oeis.org/A048105):

~~~spl svg=E oeis=A048105
1:100.collect { :n |
	0.divisorSigma(n) - (2 ^ n.primeNu)
}.discretePlot
~~~

![](sw/spl/Help/Image/primeNu-E.svg)

Number of ways of writing _n_ as _p*q_ where _p<=q_ and _gcd(p,q)=1_,
OEIS [A007875](https://oeis.org/A007875):

~~~spl svg=F oeis=A007875
1:65.collect { :n |
	(2 ^ n.primeNu).eulerPhi
}.stepPlot
~~~

![](sw/spl/Help/Image/primeNu-F.svg)

Least size of generators for multiplicative group of integers modulo _n_,
OEIS [A046072](https://oeis.org/A046072):

~~~spl svg=G oeis=A046072
3:102.collect { :n |
	n.primeNu + n.isOdd.if {
		0
	} {
		(n / 4).isInteger.not.if {
			-1
		} {
			(n / 8).isInteger.not.if {
				0
			} {
				1
			}
		}
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/primeNu-G.svg)

_ω(n)=1_,
OEIS [A069513](https://oeis.org/A069513):

~~~spl svg=H oeis=A069513
2:85.collect { :n |
	(n.primeNu = 1).boole
}.discretePlot
~~~

![](sw/spl/Help/Image/primeNu-H.svg)

_ω(n)≤1_,
OEIS [A010055](https://oeis.org/A010055):

~~~spl svg=I oeis=A010055
2:85.collect { :n |
	(n.primeNu <= 1).boole
}.discretePlot
~~~

![](sw/spl/Help/Image/primeNu-I.svg)

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

Unicode: U+03C9 ω Greek Small Letter Omega

Categories: Math
