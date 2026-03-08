# leastPrimeFactor

- _leastPrimeFactor(n)_

Answer the least prime factor for the integers _n_.

Specific values:

```
>>> 5329.leastPrimeFactor
73

>>> 140737488355327.leastPrimeFactor
2351

>>> 59862819377.leastPrimeFactor
4513
```

At `one`:

```
>>> 1.leastPrimeFactor
1

>>> 1.isPrime
false

>>> 1.isComposite
false
```

Confirm `leastPrimeFactor` agrees with `primeFactors` up to _k_:

```
>>> let k = 100;
>>> 2:k.allSatisfy { :n |
>>> 	n.leastPrimeFactor
>>> 	=
>>> 	n.primeFactors.first
>>> }
true
```

Least prime factors of integers up to one hundred,
threads over lists,
OEIS [A020639](https://oeis.org/A020639):

```
>>> 1:100.leastPrimeFactor
[
	 1  2  3  2  5  2  7  2  3  2
	11  2 13  2  3  2 17  2 19  2
	 3  2 23  2  5  2  3  2 29  2
	31  2  3  2  5  2 37  2  3  2
	41  2 43  2  3  2 47  2  7  2
	 3  2 53  2  5  2  3  2 59  2
	61  2  3  2  5  2 67  2  3  2
	71  2 73  2  3  2  7  2 79  2
	 3  2 83  2  5  2  3  2 89  2
	 7  2  3  2  5  2 97  2  3  2
]
```

Euclid-Mullin sequence,
OEIS [A000945](https://oeis.org/A000945):

```
>>> let f = Map { :n |
>>> 	(n = 1).if {
>>> 		2
>>> 	} {
>>> 		let m = n - 1;
>>> 		(
>>> 			1:m.product { :i |
>>> 				f[i]
>>> 			} + 1
>>> 		).leastPrimeFactor
>>> 	}
>>> };
>>> f[1:8]
[2 3 7 43 13 53 5 6221671]
```

Seieve of Eratosthenes arranged as an array,
OEIS [A083221](https://oeis.org/A083221):

```
>>> let k = 8;
>>> 1:k.collect { :n |
>>> 	let p = n.prime;
>>> 	p:Infinity.detect(k) { :x |
>>> 		x.leastPrimeFactor = p
>>> 	}
>>> }
[
	  2   4   6   8  10  12  14  16;
	  3   9  15  21  27  33  39  45;
	  5  25  35  55  65  85  95 115;
	  7  49  77  91 119 133 161 203;
	 11 121 143 187 209 253 319 341;
	 13 169 221 247 299 377 403 481;
	 17 289 323 391 493 527 629 697;
	 19 361 437 551 589 703 779 817
]
```

Maximum divisor of _n_,
OEIS [A032742](https://oeis.org/A032742):

```
>>> 1:19.collect { :n |
>>> 	n / n.leastPrimeFactor
>>> }
[1 1 1 2 1 3 1 4 3 5 1 6 1 7 5 8 1 9 1]
```

Largest difference between consecutive divisors of _n_,
OEIS [A060681](https://oeis.org/A060681):

```
>>> 1:19.collect { :n |
>>> 	n - (n / n.leastPrimeFactor)
>>> }
[0 1 2 2 4 3 6 4 6 5 10 6 12 7 10 8 16 9 18]
```

Log-scale plot of the least prime factors of the integers from two up to one hundred,
OEIS [A020639](https://oeis.org/A020639):

~~~spl svg=A
2:100.leastPrimeFactor
.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-A.svg)

_a(n)=(p%4)*a(n/p)_,
OEIS [A065338](https://oeis.org/A065338):

~~~spl svg=B
let a = Map { :n |
	(n = 1).if {
		1
	} {
		let p = n.leastPrimeFactor;
		(p % 4) * a[n / p]
	}
};
a[1:65].discretePlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-B.svg)

_π(L(n))_,
OEIS [A055396](https://oeis.org/A055396):

~~~spl svg=C
1:85.leastPrimeFactor
.primePi
.discretePlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-C.svg)

Number of times the smallest prime factor of _n_ is the smallest prime factor for numbers _≤n_,
OEIS [A078898](https://oeis.org/A078898):

~~~spl svg=D
let m = 100;
let l = 1:m.leastPrimeFactor;
1:m.collect { :n |
	l.take(n).occurrencesOf(l[n])
}.discretePlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-D.svg)

Seieve of Eratosthenes arranged as an array,
read by antidigaonals,
OEIS [A083221](https://oeis.org/A083221):

~~~spl svg=E
let k = 12;
let a = 1:k.collect { :n |
	let p = n.prime;
	Range(p, Infinity, p).detect(k) { :x |
		x.leastPrimeFactor = p
	}
};
let b = [];
1:k.sum.antidiagonalIndicesDo { :i :j |
	b.add(a[i][j])
};
b.discretePlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-E.svg)

Maximum divisor of _n_,
OEIS [A032742](https://oeis.org/A032742):

~~~spl svg=F
2:85.collect { :n |
	n / n.leastPrimeFactor
}.discretePlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-F.svg)

Largest difference between consecutive divisors of _n_,
OEIS [A060681](https://oeis.org/A060681):

~~~spl svg=G
1:200.collect { :n |
	n - (n / n.leastPrimeFactor)
}.scatterPlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-G.svg)

* * *

See also: factorInteger, leastPrimeFactorList, prime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LeastPrimeFactor.html),
_OEIS_
[1](https://oeis.org/A020639),
_W_
[1](https://en.wikipedia.org/wiki/Integer_factorization)
