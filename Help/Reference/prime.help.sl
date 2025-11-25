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

Plot first fifty primes:

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
[5](https://oeis.org/A006450),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.generate.prime),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Integer.html#-nthPrime)

Categories: Math
