# eulerPhi

- _eulerPhi(n)_

Answer the Euler totient function,
written _φ(n)_.
Also known as the Euler totient function or φ function.
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

First few terms,
OEIS [A000010](https://oeis.org/A000010):

```
>>> 1:23.eulerPhi
[
	 1  1  2  2  4  2  6  4  6  4
	10  4 12  6  8  8 16  6 18  8
	12 10 22
]
```

Sum of totient function,
called the totient summatory function,
OEIS [A002088](https://oeis.org/A002088):

```
>>> 0:14.collect { :k |
>>> 	1:k.eulerPhi.sum
>>> }
[0 1 2 4 6 10 12 18 22 28 32 42 46 58 64]
```

Offset by one gives the length of the _nth_-order Farey sequence,
OEIS [A005728](https://oeis.org/A005728):

```
>>> 0:14.collect { :k |
>>> 	1:k.eulerPhi.sum
>>> } + 1
[1 2 3 5 7 11 13 19 23 29 33 43 47 59 65]
```

Euler phi is non-negative:

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

Count a class of asymmetric rhythm cycles equivalence classes,
OEIS [A115114](https://oeis.org/A115114):

```
>>> 1:27.collect { :n |
>>> 	n.divisors.sum { :d |
>>> 		let o = d.isOdd.boole;
>>> 		let m = 3 ^ (n / d);
>>> 		eulerPhi(2 * d)
>>> 		+
>>> 		(o * eulerPhi(d) * m)
>>> 	} / (2 * n)
>>> }
[
	2 3 6 11 26 63 158 411 1098 2955
	8054 22151 61322 170823 478318
	1345211 3798242 10761723 30585830
	87169619 249056138 713205903
	2046590846 5883948951 16945772210
	48882035163 141214768974
]
```

Numbers for which _φ(n)_ is a power of two,
OEIS [A003401](https://oeis.org/A003401):

```
>>> 1:99.select { :n |
>>> 	n.eulerPhi.log(2).isInteger
>>> }
[
	 1  2  3  4  5  6  8 10 12 15
	16 17 20 24 30 32 34 40 48 51
	60 64 68 80 85 96
]
```

Minimum numbers whose φ of φ are multiples of the _n_-th prime,
OEIS [A167766](https://oeis.org/A167766):

```
>>> 1:7.collect { :n |
>>> 	let p = n.prime;
>>> 	let k = 1;
>>> 	let x = nil;
>>> 	{
>>> 		k := k + 1;
>>> 		x := k.prime;
>>> 		x.eulerPhi.eulerPhi % p = 0
>>> 	}.whileFalse;
>>> 	x
>>> }
[5 19 23 59 47 107 479]
```

The prime powers _p^m_ where _m>=2_,
OEIS [A025475](https://oeis.org/A025475):

```
>>> 1:256.select { :n |
>>> 	n.isPrime.not & {
>>> 		n % (n - n.eulerPhi) = 0
>>> 	}
>>> }
[
	  4   8   9  16  25
	 27  32  49  64  81
	121 125 128 169 243
	256
]
```

Number of pairs _(x,y)_ in _1:n_ with at least one common factor,
OEIS [A185670](https://oeis.org/A185670):

```
>>> 1 + 1:23.collect { :n |
>>> 	n - n.eulerPhi - 1
>>> }.prefixSum
[
	 0  0  0  1  1  4  4  7  9 14
	14 21 21 28 34 41 41 52 52 63
	71 82 82
]
```

Numbers _m_ such that _φ(m)_ and _τ(m)_ divide _m_,
OEIS [A235353](https://oeis.org/A235353):

```
>>> 1:300.select { :n |
>>> 	let a = n.eulerPhi;
>>> 	let b = 0.divisorSigma(n);
>>> 	n % a = 0 & { n % b = 0 }
>>> }
[1 2 8 12 18 24 36 72 96 108 128 288]
```

Denominators in canonical bijection from positive integers to positive rationals _≤1_,
OEIS [A038567](http://oeis.org/A038567):

```
>>> 0:21.collect { :n |
>>> 	let k = 0;
>>> 	{
>>> 		1:k.eulerPhi.sum <= n
>>> 	}.whileTrue {
>>> 		k := k + 1
>>> 	};
>>> 	k
>>> }
[1 2 3 3 4 4 5 5 5 5 6 6 7 7 7 7 7 7 8 8 8 8]
```

Plot the first few terms,
OEIS [A000010](https://oeis.org/A000010):

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
		n.divisorSum { :d |
			d.eulerPhi / d
		} * n
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

Plot [A076512](https://oeis.org/A076512):

~~~spl svg=E
1:86.collect { :n |
	let phi = n.eulerPhi.asFraction;
	((n - phi) / phi).denominator
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-E.svg)

Plot the degree of the classical modular polynomial,
OEIS [A118778](https://oeis.org/A118778):

~~~spl svg=F
1:250.collect { :n |
	let s = 0;
	n.divisors.do { :a |
		(a.square > n).ifTrue {
			let b = gcd(a, n / a);
			let c = eulerPhi(b) / b;
			s := s + (2 * a * c)
		}
	};
	n.sqrt.isInteger.ifTrue {
		s := s + eulerPhi(n.sqrt)
	};
	s
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-F.svg)

Plot the number of iterations of _φ(x)_ at _n_ needed to reach one,
OEIS [A003434](https://oeis.org/A003434):

~~~spl svg=G
1:105.collect { :n |
	eulerPhi:/1
	.nestWhileList(n) { :x |
		x != 1
	}.size - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-G.svg)

Smallest _x_ such that _x%φ(x)=n_,
OEIS [A234642](https://oeis.org/A234642):

~~~spl svg=H
0:43.collect { :n |
	let x = 0;
	{
		x := x + 1;
		x % x.eulerPhi = n
	}.whileFalse;
	x
}.discretePlot
~~~

![](sw/spl/Help/Image/eulerPhi-H.svg)

Plot iterations of φ needed to reach one starting at _n_,
OEIS [A049108](https://oeis.org/A049108):

~~~spl svg=I
1:105.collect { :n |
	eulerPhi:/1
	.nestWhileList(n) { :x |
		x != 1
	}.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-I.svg)

Plot cototient function,
OEIS [A051953](https://oeis.org/A051953):

~~~spl svg=J
1:200.collect { :n |
	n - n.eulerPhi
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-J.svg)

* * *

See also: divisors, factorInteger, gcd, lcm, powerMod, totientSummatoryFunction

Guides: Integer Sequence Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/TotientFunction.html)
[2](https://mathworld.wolfram.com/TotientSummatoryFunction.html)
[3](https://reference.wolfram.com/language/ref/EulerPhi.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/eulerphi.html),
_OEIS_
[1](https://oeis.org/A000010)
[2](https://oeis.org/A002088)
[3](https://oeis.org/A018804)
[4](https://oeis.org/A010554)
[5](https://oeis.org/A115114)
[6](https://oeis.org/A005728)
[7](https://oeis.org/A118778),
_W_
[1](https://en.wikipedia.org/wiki/Euler%27s_totient_function)
[2](https://en.wikipedia.org/wiki/Totient_summatory_function)

Unicode: U+03C6 φ Greek Small Letter Phi

Categories: Math
