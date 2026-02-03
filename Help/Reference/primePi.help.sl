# primePi

- _primePi(n)_

Answer the number of primes less than or equal to the integer _n_.

Compute the number of primes up to 15 and 100:

```
>>> 15.primePi
6

>>> primePi(25)
9

>>> 100.primePi
25

>>> 104729.primePi
10000
```

Threads over lists:

```
>>> [3 5 17 25].primePi
[2 3 7 9]
```

Rational numbers:

```
>>> 7/2.primePi
2
```

Real numbers:

```
>>> 15.25.primePi
6
```

The first few terms,
OEIS [A000720](https://oeis.org/A000720):

```
>>> 1:23.primePi
[
	0 1 2 2 3 3 4 4 4 4
	5 5 6 6 6 6 7 7 8 8
	8 8 9
]
```

Count the prime numbers up to 9999 & 99999:

```
>>> 9999.primePi
1229

>>> 66161.primePi
6604

>>> 99999.primePi
9592
```

Variant sequence that is zero if _n_ is not prime,
OEIS [A049084](https://oeis.org/A049084):

```
>>> 1:28.collect { :n |
>>> 	n.isPrime.boole * n.primePi
>>> }
[
	0 1 2 0 3 0 4 0 0 0
	5 0 6 0 0 0 7 0 8 0
	0 0 9 0 0 0 0 0
]
```

Enumeration of all finite weakly increasing sequences of positive integers,
OEIS [A112798](https://oeis.org/A112798):

```
>>> 2:28.collect { :n |
>>> 	n.primeFactors.primePi
>>> }
[
	1;
	2;
	1 1;
	3;
	1 2;
	4;
	1 1 1;
	2 2;
	1 3;
	5;
	1 1 2;
	6;
	1 4;
	2 3;
	1 1 1 1;
	7;
	1 2 2;
	8;
	1 1 3;
	2 4;
	1 5;
	9;
	1 1 1 2;
	3 3;
	1 6;
	2 2 2;
	1 1 4
]
```

The sum of the partitions in the above sequence,
OEIS [A056239](https://oeis.org/A056239):

```
>>> 1:91.collect { :n |
>>> 	n.primeFactors.primePi.sum
>>> }
[
	 0  1  2  2  3  3  4  3  4  4
	 5  4  6  5  5  4  7  5  8  5
	 6  6  9  5  6  7  6  6 10  6
	11  5  7  8  7  6 12  9  8  6
	13  7 14  7  7 10 15  6  8  7
	 9  8 16  7  8  7 10 11 17  7
	18 12  8  6  9  8 19  9 11  8
	20  7 21 13  8 10  9  9 22  7
	 8 14 23  8 10 15 12  8 24  8
	10
]
```

The smallest number _m_ such that the _m_-th prime has the _n_-th prime decimal digits,
very rapidly exceeds limit of `prime` (the fifth entry is 455,052,512),
OEIS [A064489](https://oeis.org/A064489):

```
>>> 1:4.collect { :n |
>>> 	primePi(nextPrime(10 ^ (n.prime - 1)))
>>> }
[5 26 1230 78499]
```

Plot the prime counting function:

~~~spl svg=A
1:60.collect(primePi:/1).discretePlot
~~~

![](sw/spl/Help/Image/primePi-A.svg)

Plot unary-encoded compressed factorization of natural numbers,
OEIS [A156552](https://oeis.org/A156552):

~~~spl svg=B
(2 .. 150).collect { :n |
	n.primeFactors
	.withIndexCollect { :p :i |
		let a = 1L << (p.primePi - 1);
		a << (i - 1)
	}.sum
}.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-B.svg)

Step plot of sequence by K.A. Rasmussen,
OEIS [A056239](https://oeis.org/A056239):

~~~spl svg=C
1:111.collect { :n |
	n.primeFactors.primePi.sum
}.stepPlot
~~~

![](sw/spl/Help/Image/primePi-C.svg)

Log scatter plot of a sequence by K. Matylla,
OEIS [A135141](https://oeis.org/A135141):

~~~spl svg=D
let a = { :n |
	(n = 1).if {
		1
	} {
		n.isPrime.if {
			2 * a(n.primePi)
		} {
			2 * a(n - 1 - n.primePi) + 1
		}
	}
};
1:200.collect(a:/1).log.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-D.svg)

Count distinct rooted trees obtained from the tree with Matula-Goebel number _n_ by adding one edge,
OEIS [A214567](https://oeis.org/A214567):

~~~spl svg=E
let a = { :n |
	(n = 1).if {
		1
	} {
		n.isPrime.if {
			a(n.primePi) + 1
		} {
			n.distinctPrimeFactors
			.sum { :x |
				a(x) - 1
			} + 1
		}
	}
};
1:150.collect(a:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-E.svg)

Imply Goldbach and Lemoine conjectures,
OEIS [A219055](https://oeis.org/A219055):

~~~spl svg=F
1:100.collect { :n |
	let m = n % 2;
	let o = ((n - 1) / (2 + m)).primePi;
	1:o.sum { :k |
		let p = k.prime;
		(
			(p + 6).isPrime & {
				let q = (1 + m) * p;
				(n - q).isPrime & {
					(n - q - 6).isPrime
				}
			}
		).boole
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-F.svg)

Plot triangle of _π(n)+π(k)-π(n+k)_,
OEIS [A212210](https://oeis.org/A212210):

~~~spl svg=G
1:13.triangularArray { :n :k |
	let a = n.primePi;
	let b = k.primePi;
	let c = (n + k).primePi;
	a + b - c
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/primePi-G.svg)

* * *

See also: eulerPhi, nextPrime, primesList, primesUpTo, sieveOfEratosthenes

Guides: Prime Number Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/PrimeCountingFunction.html)
[2](https://reference.wolfram.com/language/ref/PrimePi.html),
_OEIS_
[1](https://oeis.org/A000720)
[2](https://oeis.org/A049084)
[3](https://oeis.org/A156552)
[4](https://oeis.org/A112798)
[5](https://oeis.org/A056239)
[6](https://oeis.org/A135141)
[7](https://oeis.org/A219055),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.generate.primepi),
_W_
[1](https://en.wikipedia.org/wiki/Prime-counting_function)
