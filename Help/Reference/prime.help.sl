# prime

- _prime(n)_

Answer the _n_--th prime number.  The first prime number is two.

```
>>> 1.prime
2

>>> 5.prime
11

>>> 10.prime
29

>>> 2002.prime
17401

>>> 3579.prime
33413

>>> 100000.prime
1299709
```

The inverse is `primePi`:

```
>>> 33413.primePi
3579
```

Threads over lists,
OEIS [A000040](https://oeis.org/A000040):

```
>>> 1:9.prime
[2 3 5 7 11 13 17 19 23]

>>> (10 ^ 1:3).prime
[29 541 7919]
```

Squares of primes,
OEIS [A001248](https://oeis.org/A001248);

```
>>> 1:9.prime.square
[4 9 25 49 121 169 289 361 529]
```

Mersenne numbers,
OEIS [A001348](https://oeis.org/A001348):

```
>>> 1:8.collect { :n |
>>> 	2 ^ n.prime - 1
>>> }
[3 7 31 127 2047 8191 131071 524287]
```

Prime-indexed primes,
OEIS [A006450](https://oeis.org/A006450)

```
>>> 1:13.collect { :n |
>>> 	n.prime.prime
>>> }
[3 5 11 17 31 41 59 67 83 109 127 157 179]
```

This value is cached (memoized) by the system,
so that subsequent accesses do not require recalculation:

```
>>> system.cachedPrimesList[5]
11

>>> 10001.prime
104743
```

An approximation for `prime`:

```
>>> let n = 148933;
>>> let p = n.prime;
>>> let q = n * (n.log + n.log.log - 1);
>>> (p, q, p - q)
(1999993, 1994024, 5969)
```

Faure’s _A_ function:

```
>>> 0:13.collect { :s |
>>> 	1:s.product { :k |
>>> 		let p = k.prime;
>>> 		(p - 1) / (2 * p.log)
>>> 	}
>>> }.round(0.01)
[
	  1       0.72     0.66     0.82    1.26
	  2.62    6.14    17.33    52.96  185.78
	772.41 3373.99 16818.92 90580.83
]
```

Faure’s _C_ function:

```
>>> 2:13.collect { :s |
>>> 	(s = 2).if {
>>> 		3 / (16 * 2.log.square)
>>> 	} {
>>> 		let q = s.isPrime.if {
>>> 			s
>>> 		} {
>>> 			s.nextPrime
>>> 		};
>>> 		let a = 1 / s.!;
>>> 		let b = (q - 1) / (2 * q.log);
>>> 		a * (b ^ s)
>>> 	}
>>> }.round(1E-5) * 100
[
	39.026 12.569 9.936 2.469 1.865
	 0.411  0.886 0.205 0.043 0.008
	 0.006  0.001
]
```

Products of two successive primes,
OEIS [A006094](https://oeis.org/A006094):

```
>>> 1:10.collect { :n |
>>> 	n.prime * (n + 1).prime
>>> }
[
	  6  15  35  77 143
	221 323 437 667 899
]
```

Prefix sum of primes,
OEIS [A007504](https://oeis.org/A007504):

```
>>> 1:24.prime.prefixSum
[
	  2   5  10  17  28
	 41  58  77 100 129
	160 197 238 281 328
	381 440 501 568 639
	712 791 874 963
]
```

Plot first fifty primes,
OEIS [A000040](https://oeis.org/A000040):

~~~spl svg=A
1:50.functionPlot(prime:/1)
~~~

![](sw/spl/Help/Image/prime-A.svg)

Generate a path based on the prime sequence:

~~~spl svg=B
1:500.collect { :n |
	n.prime
}.anglePath.Line
~~~

![](sw/spl/Help/Image/prime-B.svg)

Plot the width of the moat of composite numbers surrounding the n-th prime,
OEIS [A046929](https://oeis.org/A046929):

~~~spl svg=C
let k = 65;
1:k.prime
.partition(3, 1)
.collect { :m |
	m.differences.min - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/prime-C.svg)

Plot a permutation of the natural numbers,
OEIS [A243353](https://oeis.org/A243353):

~~~spl svg=D
let f = { :n :i :x |
	(n = 0).if {
		x
	} {
		n.isEven.if {
			f(n / 2, i + 1, x)
		} {
			f((n - 1) / 2, i, x * i.prime)
		}
	}
};
0:250.collect { :n |
	f(n.bitXor((n / 2).floor), 1, 1)
}.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/prime-D.svg)

Prefix sum of primes modulo four minus two,
OEIS [A038698](https://oeis.org/A038698):

~~~spl svg=E
+.foldList(
	0,
	2:267.prime % 4 - 2
).scatterPlot
~~~

![](sw/spl/Help/Image/prime-E.svg)

Plot of triangle _(n,k)_ indicating if the _k_-th prime is a square modulo the _n_-th prime,
OEIS [A060038](https://oeis.org/A060038):

~~~spl svg=F
2:17.collect { :n |
	let m = n - 1;
	let p = n.prime;
	let r = p.quadraticResidues;
	1:m.collect { :k |
		r.includes(k.prime).not.boole
	}
}.triangularArrayPlot
~~~

![](sw/spl/Help/Image/prime-F.svg)

Excess of _3n-1_ primes over _3n+1_ primes,
OEIS [A112632](https://oeis.org/A112632):

~~~spl svg=G
let m = 150;
let a = List(m, 1);
3:150.collect { :n |
	let x = n.prime % 6 = 1;
	a[n] := a[n - 1] + x.if { -1 } { 1 }
};
a.differences.discretePlot
~~~

![](sw/spl/Help/Image/prime-G.svg)

Size of sea of composite numbers surrounding _n_-th prime,
OEIS [A046930](https://oeis.org/A046930):

~~~spl svg=H
1:150.collect { :n |
	(n + 2).prime - n.prime - 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/prime-H.svg)

Plot triangular array of means of two odd primes,
OEIS [A065305](https://oeis.org/A065305):

~~~spl svg=I
2:17.triangularArray { :n :k |
	(n.prime + k.prime) / 2
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/prime-I.svg)

The Goldbach permutation,
OEIS [A065306](https://oeis.org/A065306):

~~~spl svg=J
let a = 2:23.triangularArray { :n :k |
	(n.prime + k.prime) / 2
}.catenate;
let b = a.deleteDuplicates - 2;
a.scatterPlot
~~~

![](sw/spl/Help/Image/prime-J.svg)

Plot least _k_ such that sum of first _k_ primes is _n_ times a prime,
OEIS [A045985](https://oeis.org/A045985):

~~~spl svg=K
let m = 15000;
let p = 1:m.prime.prefixSum;
let t = [1:m, p].transpose;
1:250.collect { :n |
	t.detect { :x |
		(x[2] / n).isPrime
	}.first
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/prime-K.svg)

Plot _a(n)+a(n-1)=p(n)_,
OEIS [A036467](https://oeis.org/A036467):

~~~spl svg=L
0:200.collect { :n |
	2:n.sum { :k |
		k.prime * (-1 ^ (k + 1))
	} + 1
}.abs.scatterPlot
~~~

![](sw/spl/Help/Image/prime-L.svg)

Plot _Σ{i=0…n-1}-1^i*p(n-i)_,
OEIS [A008347](https://oeis.org/A008347):

~~~spl svg=M
-.swap.foldList(0, 1:200.prime).scatterPlot
~~~

![](sw/spl/Help/Image/prime-M.svg)

Plot Cald’s sequence,
OEIS [A006509](https://oeis.org/A006509):

~~~spl svg=N
let y = [1];
1.toDo(135) { :n |
	let b = y.last;
	let p = y.size.prime;
	let x = (
		b > p & {
			y.includes(b - p).not
		}
	).if {
		b - p
	} {
		y.includes(b + p).if {
			0
		} {
			b + p
		}
	};
	y.add(x)
};
y.discretePlot
~~~

![](sw/spl/Help/Image/prime-N.svg)

Plot inverse Moebius transform of primes,
OEIS [A007445](https://oeis.org/A007445):

~~~spl svg=O
1:150.collect { :n |
	n.divisorSum(prime:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/prime-O.svg)

Squares of primes (_e_),
or products of pairs of consecutive primes (_o_),
OEIS [A033476](https://oeis.org/A033476),
also
OEIS [A057602](https://oeis.org/A057602) without leading two:

~~~spl svg=P
let p = 1:25.prime;
let q = p.partition(2, 1);
let e = p ^ 2;
let o = q.collect(product:/1);
e.riffle(o).scatterPlot
~~~

![](sw/spl/Help/Image/prime-P.svg)

* * *

See also: indexOfPrime, isPrime, nextPrime, primesList, primesUpTo

Guides: Prime Number Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=ithprime),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Prime.html),
_OEIS_
[1](https://oeis.org/A000040)
[2](https://oeis.org/A046929)
[3](https://oeis.org/A243353)
[4](https://oeis.org/A001348)
[5](https://oeis.org/A006450)
[6](https://oeis.org/A006094)
[7](https://oeis.org/A045985),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.generate.prime),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Integer.html#-nthPrime)

Categories: Math
