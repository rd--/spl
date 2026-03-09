# previousPrime

- _previousPrime(n)_

Answer the greatest prime number less than the integer _n_.

Compute the last prime before 50:

```
>>> 50.previousPrime
47
```

The prime before 2,338,714:

```
>>> 2338714.previousPrime
2338703
```

If _n_ is prime, answer the prime with index one less:

```
>>> 1000.previousPrime
997

>>> 997.previousPrime
991

>>> (991.primePi, 997.primePi)
(167, 168)
```

Threads over lists,
OEIS [A007917](https://oeis.org/A007917):

```
>>> 3:23.previousPrime
[
	 2  3  3  5  5  7  7  7  7 11
	11 13 13 13 13 17 17 19 19 19
	19
]
```

Least nonnegative _m_ such that _n!-m_ is prime,
OEIS [A033933](https://oeis.org/A033933):

```
>>> 3:15.collect { :n |
>>> 	let m = n.!;
>>> 	m - m.previousPrime
>>> }
[1 1 7 1 1 31 13 11 13 1 23 1 47]
```

Plot prime instigated arithmetic series,
OEIS [A064924](https://oeis.org/A064924):

~~~spl svg=A
2:250.collect { :n |
	n.isPrime.if {
		n
	} {
		let p = n.previousPrime;
		p * (n - p + 1)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/previousPrime-A.svg)

Ordinal transform of the next prime function,
calculated as _n-f(n)+1_ for composite _n_,
OEIS [A175851](https://oeis.org/A175851):

~~~spl svg=B
1:250.collect { :n |
	n.isComposite.if {
		n - n.previousPrime + 1
	} {
		1
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/previousPrime-B.svg)

Numerators of rational valued sequence whose Dirichlet convolution with itself yields the ordinal transform of the next prime function,
OEIS [A317830](https://oeis.org/A317830):

~~~
let a = Map { :n |
	n.isComposite.if {
		n - n.previousPrime + 1L
	} {
		1L
	}
};
let f = Dictionary { :n |
	(n = 1).if {
		1
	} {
		let p = n.divisors.sum { :d |
			(1 < d & { d < n }).if {
				f[d] * f[n / d]
			} {
				0
			}
		};
		(a[n] - p) / 2
	}
};
f[1:115].numerator.logScale.discretePlot
~~~

![](sw/spl/Help/Image/previousPrime-C.svg)

* * *

See also: isPrime, nextPrime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PreviousPrime.html)
_OEIS_
[1](https://oeis.org/A007917)
