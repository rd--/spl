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
```

Depends only of the prime signature of _n_:

```
>>> [24 375].collect(moebiusMu:/1)
[0 0]

>>> [24 375].collect(primeSignature:/1)
[3 1; 3 1]
```

First few terms,
OEIS [A008683](https://oeis.org/A008683):

```
>>> 1:78.collect(moebiusMu:/1)
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

Plot the Möbius sequence for the first 20 numbers:

~~~spl svg=A
1:20.collect(moebiusMu:/1).discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-A.svg)

Mertens’s function _M(n)_ sums μ over _1:n_:

```
>>> 1:81
>>> .collect(moebiusMu:/1)
>>> .prefixSum
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

Plot the first few terms of Mertens’s function:

~~~spl svg=B
1:250
.collect(moebiusMu:/1)
.prefixSum
.linePlot
~~~

![](sw/spl/Help/Image/moebiusMu-B.svg)

Moebius transform applied twice to the sequence one then zero,
OEIS [A007427](https://oeis.org/A007427):

```
>>> 1:81.collect { :n |
>>> 	divisorSum(n) { :d |
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
>>> 			moebiusMu(i)* (3 ^ (n / i) - 1)
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
_W_
[1](https://en.wikipedia.org/wiki/M%C3%B6bius_function)
[2](https://en.wikipedia.org/wiki/Mertens_function)

Unicode: U+03BC μ Greek Small Letter Mu

Categories: Math
