# factorInteger

- _factorInteger(n)_

Answer the a two column matrix of the prime factors of _n_,
each associated with its exponent.
The answer is sorted by factor.

```
>>> 36.factorInteger
[2 2; 3 2]

>>> (2 ^ 2) * (3 ^ 2)
36

>>> 120.factorInteger
[2 3; 3 1; 5 1]

>>> (2 ^ 3) * (3 ^ 1) * (5 ^ 1)
120

>>> factorInteger(2000)
[2 4; 5 3]

>>> 7.!.factorInteger
[2 4; 3 2; 5 1; 7 1]

>>> 20.!.factorInteger
[
	 2 18;
	 3  8;
	 5  4;
	 7  2;
	11  1;
	13  1;
	17  1;
	19  1
]

>>> (3 ^ 51).factorInteger
[
	          2 28;
	          3  2;
	          7  1;
	      11491  1;
	11082704099  1
]
```

Factor prime:

```
>>> factorInteger(65537)
[[65537 1]]
```

A prime power has one prime factor:

```
>>> 25.factorInteger
[[5 2]]
```

For negative numbers, the item _-1 -> 1_ is included in the list of factors:

```
>>> -120.factorInteger
[-1 1; 2 3; 3 1; 5 1]
```

At `Fraction` the prime factors of the denominator are given with negative exponents.

```
>>> 3/8.factorInteger
[2 -3; 3 1]

>>> 225/224.factorInteger
[2 -5; 3 2; 5 2; 7 -1]

>>> 1/25.factorInteger
[[5 -2]]
```

Every positive integer can be represented as a product of prime factors:

```
>>> 60.factorInteger
[2 2; 3 1; 5 1]
```

A unit factor:

```
>>> -60.factorInteger
[-1 1; 2 2; 3 1; 5 1]
```

Threads over lists:

```
>>> [11 101 1001].factorInteger
[
	11 1:;
	101 1:;
	7 1; 11 1; 13 1
]
```

Use `factorInteger` to test for prime powers:

```
>>> 2401.factorInteger.size = 1
true
```

Use `factorInteger` to find all prime divisors of a number:

```
>>> 2434500.factorInteger.collect(first:/1)
[2 3 5 541]
```

The prime factorization of a prime number is itself:

```
>>> 11.factorInteger
[[11 1]]
```

Compute the original number from a factorization:

```
>>> 120.factorInteger
[2 3; 3 1; 5 1]

>>> [2 3; 3 1; 5 1].collect { :x |
>>> 	x[1] ^ x[2]
>>> }.product
120
```

`divisors` gives the list of divisors including prime divisors:

```
>>> 20.divisors.select(isPrime:/1)
[2 5]

>>> 20.factorInteger
[2 2; 5 1]
```

`primeNu` gives the number of distinct prime factors:

```
>>> 10.!.factorInteger
[2 8; 3 4; 5 2; 7 1]

>>> 10.!.primeNu
4
```

Coprime numbers have no prime factors in common:

```
>>> 20.isCoprime(39)
true

>>> 20.factorInteger
[2 2; 5 1]

>>> 39.factorInteger
[3 1; 13 1]
```

At zero and negative one and one:

```
>>> 0.factorInteger
[[0 1]]

>>> 1.factorInteger
[[1 1]]

>>> -1.factorInteger
[[-1 1]]
```

Calculate number of divisors:

```
>>> (24.factorInteger.column(2) + 1)
>>> .product
8

>>> 0.divisorSigma(24)
8
```

Numbers that are the product of two distinct primes,
OEIS [A006881](https://oeis.org/A006881):

```
>>> 2:99.select { :n |
>>> 	n.factorInteger.column(2) = [1 1]
>>> }
[
	 6 10 14 15 21 22 26 33 34 35
	38 39 46 51 55 57 58 62 65 69
	74 77 82 85 86 87 91 93 94 95
]
```

Plot the number of distinct prime factors of the first 100 numbers:

~~~spl svg=A
1:99.functionPlot { :each |
	each.factorInteger.size
}
~~~

![](sw/spl/Help/Image/factorInteger-A.svg)

Plot first few terms of
OEIS [A124859](https://oeis.org/A124859):

~~~spl svg=B
{ :n |
	(n = 1).if {
		1
	} {
		factorInteger(n).product { :x |
			let i = x[1].primePi + 1;
			i.prime ^ x[2]
		}
	}
}.map(1:50).scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-B.svg)

A generalisation of Euler’s totient function,
OEIS [A321029](https://oeis.org/A321029):

~~~spl svg=C
let f = { :p :e |
	(p < 7).if {
		p ^ (e - 1)
	} {
		(p - 5) * (p ^ (e - 1))
	}
};
2:125.collect { :n |
	n.factorInteger.collect { :x |
		f(x[1], x[2])
	}.product
}.scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-C.svg)

Plot the arithmetic derivative of _n_,
OEIS [A003415](https://oeis.org/A003415):

~~~spl svg=D
1:150.collect { :n |
	(n < 2).if {
		0
	} {
		n.abs.factorInteger
		.collect { :x |
			x[2] / x[1]
		}.sum * n
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-D.svg)

A completely multiplicative sequence,
OEIS [A003961](https://oeis.org/A003961):

~~~spl svg=E
let a = { :n |
	(n = 1).if {
		1
	} {
		n.isPrime.if {
			(n.primePi + 1).prime
		} {
			n.factorInteger.product { :x |
				a(x[1]) ^ x[2]
			}
		}
	}
};
1:100.collect(a:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-E.svg)

Replace even exponents with two and odd exponents with one,
OEIS [A066990](https://oeis.org/A066990):

~~~spl svg=F
1:72.collect { :n |
	n.factorInteger.product { :x |
		let [a, b] = x;
		a ^ b.isEven.if { 2 } { 1 }
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/factorInteger-F.svg)

Plot the minimal number _m_ such that the symmetric group _Sm_ has an element of order _n_,
OEIS [A008475](https://oeis.org/A008475):

~~~spl svg=G
2:73.collect { :n |
	n.factorInteger.collect { :f |
		f[1] ^ f[2]
	}.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/factorInteger-G.svg)

Plot the 2-adic valuation of the Hardy-Ramanujan integers,
OEIS [A051282](https://oeis.org/A051282):

~~~spl svg=H
let m = 4000;
let a = [1];
let l = [];
2.toDo(m) { :n |
	let e = n.factorInteger.column(2).sort;
	l.includes(e).ifFalse {
		l.add(e);
		a.add(n)
	}
};
(2 .. a.size).collect { :n |
	a[n].factorInteger[1][2]
}.discretePlot
~~~

![](sw/spl/Help/Image/factorInteger-H.svg)

Plot more terms:

~~~spl svg=I
OeisEntry('A051282').then { :e |
	e.bFileData
	.first(300)
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/factorInteger-I.svg)

Plot the number of triangular numbers modulo _n_,
OEIS [A117484](https://oeis.org/A117484):

~~~spl svg=J
1:175.collect { :n |
	n.factorInteger.product { :f |
		let [p, e] = f;
		(p = 2).if {
			2 ^ e
		} {
			let q = (2 * p + 2);
			(p ^ (e + 1) // q) + 1
		}
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-J.svg)

* * *

See also: divisors, isPrime, primeFactors, primeFactorization, product

Guides: Integer Functions, Prime Number Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeFactorization.html)
[2](https://reference.wolfram.com/language/ref/FactorInteger.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/factor.html),
_OEIS_
[1](https://oeis.org/A006881)
[2](https://oeis.org/A124859)
[3](https://oeis.org/A321029),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.factor_.factorint),
_W_
[1](https://en.wikipedia.org/wiki/Integer_factorization)

Categories: Arithmetic
