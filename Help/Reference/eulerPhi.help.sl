# eulerPhi

- _eulerPhi(n)_

Answer the Euler totient function.
Also known as the Euler totient function or phi function.
Counts positive integers up to _n_ that are relatively prime to _n_.

Compute the Euler totient function:

```
>>> 10.eulerPhi
4

>>> 17400.eulerPhi
4480
```

Negative numbers:

```
>>> -10.eulerPhi
4
```

Threads over lists:

```
>>> [2 4 5 6 7 35].eulerPhi
[1 2 4 2 6 24]
```

Length of the _nth_-order Farey sequence can be expressed in terms of `eulerPhi`,
c.f. OEIS [A002088](https://oeis.org/A002088):

```
>>> 1:15.collect { :k | 1:k.eulerPhi.sum + 1 }
[2 3 5 7 11 13 19 23 29 33 43 47 59 65 73]
```

EulerPhi is non-negative:

```
>>> 0.eulerPhi
0
```

For any square-free number _n_,
the totient of _n_ is equal to the `product` of the totients of each factor of _n_:

```
>>> 1023.eulerPhi
(3.eulerPhi * 11.eulerPhi * 31.eulerPhi)
```

Plot the sequence:

~~~spl svg=A
1:50.functionPlot(eulerPhi:/1)
~~~

![](sw/spl/Help/Image/eulerPhi-A.svg)

Plot the cumulative `sum` of `eulerPhi`:

~~~spl svg=B
1:50.eulerPhi.prefixSum.linePlot
~~~

![](sw/spl/Help/Image/eulerPhi-B.svg)

Plot the first few terms of [A018804](https://oeis.org/A018804),
Pillais arithmetical function:

~~~spl svg=C
{ :n |
	(n < 1).if {
		0
	} {
		n.divisors.collect { :d |
			d.eulerPhi / d
		}.sum * n
	}
}.table(1:99).discretePlot
~~~

![](sw/spl/Help/Image/eulerPhi-C.svg)

Plot [A046644](https://oeis.org/A046644):

~~~spl svg=D
let a = { :n |
	n.divisors.collect { :d |
		n * d.eulerPhi / d
	}.sum
};
let d = { :n |
	n.divisors.allButFirstAndLast
};
let f = { :n |
	(n = 1).if {
		1
	} {
		1/2 * (
			a(n) - d(n).collect { :d |
				f(d) * f(n / d)
			}.sum
		)
	}
};
1:99.collect { :n |
	f(n).denominator
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-D.svg)

* * *

See also: divisors, factorInteger, gcd, lcm, powerMod

Guides: Integer Sequences

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/TotientFunction.html)
[2](https://reference.wolfram.com/language/ref/EulerPhi.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/eulerphi.html),
_OEIS_
[1](https://oeis.org/A002088)
[2](https://oeis.org/A018804)

Categories: Math
