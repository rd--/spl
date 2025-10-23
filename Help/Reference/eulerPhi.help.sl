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

>>> 1:23.eulerPhi
[
	 1  1  2  2  4  2  6  4  6  4
	10  4 12  6  8  8 16  6 18  8
	12 10 22
]
```

Length of the _nth_-order Farey sequence can be expressed in terms of `eulerPhi`,
c.f. OEIS [A002088](https://oeis.org/A002088):

```
>>> 1:15.collect { :k |
>>> 	1:k.eulerPhi.sum + 1
>>> }
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

Sequence of _φ(φ(n))_:

```
>>> 1:72.collect { :n |
>>> 	n.eulerPhi.eulerPhi
>>> }
[
	 1  1  1  1  2  1  2  2  2  2
	 4  2  4  2  4  4  8  2  6  4
	 4  4 10  4  8  4  6  4 12  4
	 8  8  8  8  8  4 12  6  8  8
	16  4 12  8  8 10 22  8 12  8
	16  8 24  6 16  8 12 12 28  8
	16  8 12 16 16  8 20 16 20  8
	24  8
]
```

Numbers _k_ such that _φ(k)_ divides _k_,
OEIS [A007694](https://oeis.org/A007694):

```
>>> 1:200.select { :x |
>>> 	x.divisible(x.eulerPhi)
>>> }
[
	  1   2   4   6   8
	 12  16  18  24  32
	 36  48  54  64  72
	 96 108 128 144 162
	192
]
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

Guides: Integer Sequence Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/TotientFunction.html)
[2](https://reference.wolfram.com/language/ref/EulerPhi.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/eulerphi.html),
_OEIS_
[1](https://oeis.org/A000010)
[2](https://oeis.org/A002088)
[3](https://oeis.org/A018804)
[4](https://oeis.org/A010554),
_W_
[1](https://en.wikipedia.org/wiki/Euler%27s_totient_function)

Unicode: U+03C6 φ Greek Small Letter Phi

Categories: Math
