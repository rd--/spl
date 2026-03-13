# moebiusMu

- _moebiusMu(n)_

Answer Möbius function _μ(n)_,
the sum of the primitive _n_-th roots of unity.

Compute the Möbius function at ten and eleven:

```
>>> 10.moebiusMu
1

>>> 11.moebiusMu
-1

>>> (13 * 7 * 5).moebiusMu
-1
```

Depends only of the prime signature of _n_:

```
>>> [24 375].collect(moebiusMu:/1)
[0 0]

>>> [24 375].collect(primeSignature:/1)
[3 1; 3 1]
```

First few terms,
threads over lists,
OEIS [A008683](https://oeis.org/A008683):

```
>>> 1:78.moebiusMu
[
	 1 -1 -1  0 -1  1 -1  0  0  1
	-1  0 -1  1  1  0 -1  0 -1  0
	 1  1 -1  0  0  1  0  0 -1 -1
	-1  0  1  1  1  0 -1  1  1  0
	-1 -1 -1  0  0  1 -1  0  0  0
	 1  0 -1  0  1  0  1  1 -1  0
	-1  1  0  0  1 -1 -1  0  1 -1
	-1  0 -1  1  0  0  1 -1
]
```

`moebiusMu` is a multiplicative function:

```
>>> (11 * 23).moebiusMu
11.moebiusMu * 23.moebiusMu
```

Number of _2n_-bead balanced binary necklaces of fundamental period _2n_,
OEIS [A000740](https://oeis.org/A000740):

```
>>> 1:12.collect { :n |
>>> 	n.divisors.sum { :d |
>>> 		let a = (n / d).moebiusMu;
>>> 		let b = 2 ^ (d - 1);
>>> 		a * b
>>> 	}
>>> }
[1 1 3 6 15 27 63 120 252 495 1023 2010]
```

Numbers that are the product of an even number of distinct primes,
OEIS [A030229](https://oeis.org/A030229):

```
>>> 1:50.select { :n | n.moebiusMu = 1 }
[1 6 10 14 15 21 22 26 33 34 35 38 39 46]
```

Number of aperiodic binary strings of length _n_,
OEIS [A027375](https://oeis.org/A027375):

```
>>> 1:11.collect { :n |
>>> 	n.divisorSum { :d |
>>> 		(n / d).moebiusMu * 2 ^ d
>>> 	}
>>> }
[2 2 6 12 30 54 126 240 504 990 2046 4020]
```

Plot the Möbius sequence for the first few terms,
OEIS [A008683](https://oeis.org/A008683):

~~~spl svg=A
1:100.moebiusMu.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-A.svg)

Mertens’s function _M(n)_ sums μ over _1:n_,
OEIS [A002321](https://oeis.org/A002321):

```
>>> 1:81.moebiusMu.prefixSum
[
	 1  0 -1 -1 -2 -1 -2 -2 -2 -1
	-2 -2 -3 -2 -1 -1 -2 -2 -3 -3
	-2 -1 -2 -2 -2 -1 -1 -1 -2 -3
	-4 -4 -3 -2 -1 -1 -2 -1  0  0
	-1 -2 -3 -3 -3 -2 -3 -3 -3 -3
	-2 -2 -3 -3 -2 -2 -1  0 -1 -1
	-2 -1 -1 -1  0 -1 -2 -2 -1 -2
	-3 -3 -4 -3 -3 -3 -2 -3 -4 -4
	-4
]
```

Plot the first few terms of Mertens’s function,
OEIS [A002321](https://oeis.org/A002321):

~~~spl svg=B
1:250.moebiusMu.prefixSum.linePlot
~~~

![](sw/spl/Help/Image/moebiusMu-B.svg)

Numbers such that Mertens’s function is zero,
OEIS [A028442](https://oeis.org/A028442):

```
>>> 1:150.moebiusMu
>>> .prefixSum.indicesOf(0)
[2 39 40 58 65 93 101 145 149 150]
```

Moebius transform applied twice to the sequence one then zero,
OEIS [A007427](https://oeis.org/A007427):

```
>>> 1:81.collect { :n |
>>> 	n.divisorSum { :d |
>>> 		let a = moebiusMu(d);
>>> 		let b = moebiusMu(n / d);
>>> 		a * b
>>> 	}
>>> }
[
	 1 -2 -2  1 -2  4 -2  0  1  4
	-2 -2 -2  4  4  0 -2 -2 -2 -2
	 4  4 -2  0  1  4  0 -2 -2 -8
	-2  0  4  4  4  1 -2  4  4  0
	-2 -8 -2 -2 -2  4 -2  0  1 -2
	 4 -2 -2  0  4  0  4  4 -2  4
	-2  4 -2  0  4 -8 -2 -2  4 -8
	-2  0 -2  4 -2 -2  4 -8 -2  0
	 0
]
```

Number of primitive asymmetric rhythm cycles having no nontrivial shift automorphism,
OEIS [A006575](https://oeis.org/A006575):

```
>>> 1:27.collect { :n |
>>> 	n.divisorSum { :i |
>>> 		(bitAnd(i, 1) = 1).if {
>>> 			moebiusMu(i)
>>> 			*
>>> 			(3 ^ (n / i) - 1)
>>> 		} {
>>> 			0
>>> 		}
>>> 	} / (2 * n)
>>> }
[
	1 2 4 10 24 60 156 410 1092 2952
	8052 22140 61320 170820 478288
	1345210 3798240 10761660 30585828
	87169608 249055976 713205900
	2046590844 5883948540 16945772184
	48882035160 141214767876
]
```

Count nonsingular complex Hermitian matrices,
OEIS [A037227](https://oeis.org/A037227):

~~~spl svg=C
1:102.collect { :n |
	n.divisors.sum { :d |
		(-1^ (d + 1))
		*
		d.moebiusMu
		*
		0.divisorSigma(n / d)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/moebiusMu-C.svg)

A sequence by I.Gutkovskiy,
OEIS [A318583](https://oeis.org/A318583):

~~~spl svg=D
let a:/1 = { :n |
	(n <= 2).if {
		1
	} {
		(n - 2).divisors.sum { :d |
			a(d)
			*
			((n - 2) / d).moebiusMu
		}
	}
}.memoize(true);
1:175.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/moebiusMu-D.svg)

Dirichlet inverse of sigma function,
OEIS [A046692](http://oeis.org/A046692):

~~~spl svg=E
1:200.collect { :n |
	let k = 0;
	1.toDo(n) { :d |
		(n % d = 0).ifTrue {
			let a = d.moebiusMu;
			let b = (n / d).moebiusMu;
			k := k + (d * a * b)
		}
	};
	k
}.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-E.svg)

A unform length walk where turn angles are given by the Möbius function:

~~~spl svg=F
let m = 1:500.collect(moebiusMu:/1);
(m * 1/3.pi).anglePath.linePlot
~~~

![](sw/spl/Help/Image/moebiusMu-F.svg)

Plot Moebius function applied to divisors of _n_,
OEIS [A225817](https://oeis.org/A225817):

~~~spl svg=G
1:23.collect { :n |
	n.divisors.collect(moebiusMu:/1)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-G.svg)

Plot number of transformation groups of order _n_,
OEIS [A000113](https://oeis.org/A000113):

~~~spl svg=H
1:135.collect { :n |
	let i = n.integerExponent(2);
	let j = n.integerExponent(3);
	let a = n.divisors.sum { :d |
		d.moebiusMu ^ 2 / d
	};
	let b = 2 ^ 3.min(i // 2);
	let c = 3 ^ (1 < j).boole;
	n * a / (b * c)
}.scatterPlot
~~~

![](sw/spl/Help/Image/moebiusMu-H.svg)

Dedekind ψ function,
OEIS [A001615](https://oeis.org/A001615):

~~~spl svg=I
1:69.collect { :n |
	n * n.divisorSum { :d |
		d.moebiusMu ^ 2 / d
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-I.svg)

The truncated Mertens function,
OEIS [A088004](https://oeis.org/A088004):

~~~spl svg=J
1:81.collect { :n |
	n.moebiusMu + n.isPrime.boole
}.prefixSum.stepPlot
~~~

![](sw/spl/Help/Image/moebiusMu-J.svg)

Mertens conjectured that _|M(n)|<√(n)_,
now known to be false,
OEIS [A059571](https://oeis.org/A059571):

~~~spl svg=K
1:85.collect { :n |
	n.sqrt.floor - 1:n.moebiusMu.sum.abs
}.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-K.svg)

_μ(n/k)_ if _k_ divides _n_ else zero,
OEIS [A054525](https://oeis.org/A054525):

~~~spl svg=L oeis=A054525 set=-1,0,1
1:17.triangularArray { :n :k |
	n.divisible(k).if {
		(n / k).moebiusMu
	} {
		0
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-L.svg)

_μ(n)×n_,
OEIS [A055615](https://oeis.org/A055615):

~~~spl svg=M
let n = 1:85;
(n.moebiusMu * n).discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-M.svg)

* * *

See also: isSquareFree, liouvilleLambda, primeSignature

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MoebiusFunction.html)
[2](https://mathworld.wolfram.com/MertensFunction.html)
[3](https://reference.wolfram.com/language/ref/MoebiusMu.html),
_OEIS_
[1](https://oeis.org/A008683)
[2](https://oeis.org/A002321)
[3](https://oeis.org/A006575),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.mobius),
_W_
[1](https://en.wikipedia.org/wiki/M%C3%B6bius_function)
[2](https://en.wikipedia.org/wiki/Mertens_function)

Unicode: U+03BC μ Greek Small Letter Mu

Categories: Math
