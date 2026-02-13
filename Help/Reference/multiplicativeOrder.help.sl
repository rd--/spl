# multiplicativeOrder

- _multiplicativeOrder(k, n)_

Answer the multiplicative order of _k_ modulo _n_,
defined as the smallest integer _m_ such that _(k^m)%n=1_.

If _n_ is `one` answer _n_:

```
>>> 7.multiplicativeOrder(1)
1
```

`multiplicativeOrder` answers `nil` if there is no integer satisfying the necessary conditions:

```
>>> 1:4.collect { :n |
>>> 	1:10.collect { :k |
>>> 		k.multiplicativeOrder(n)
>>> 	}
>>> }
[
	1 1 1 1 1 1 1 1 1 1;
	1 nil 1 nil 1 nil 1 nil 1 nil;
	1 2 nil 1 2 nil 1 2 nil 1;
	1 nil 2 nil 1 nil 2 nil 1 nil
]
```

The multiplicative order of 5 modulo 8:

```
>>> 5.multiplicativeOrder(8)
2

>>> (5 ^ 2) % 8
1

>>> 5.powerMod(2, 8)
1
```

Compute using integers:

```
>>> 5.multiplicativeOrder(7)
6

>>> -5.multiplicativeOrder(7)
3
```

For nonzero integers _k_ and _n_, `multiplicativeOrder` exists if and only if _k_ and _n_ are coprime:

```
>>> 10.isCoprime(21)
true

>>> 10.multiplicativeOrder(21)
6

>>> 21.multiplicativeOrder(10)
1
```

However, 10 and 22 are not coprime:

```
>>> 10.multiplicativeOrder(22)
nil
```

`eulerPhi` divides `multiplicativeOrder`:

```
>>> 12.eulerPhi
4

>>> 5.multiplicativeOrder(12)
2

>>> 4.divisible(2)
true
```

The answer is always positive:

```
>>> 5.multiplicativeOrder(3)
2

>>> -5.multiplicativeOrder(3)
1
```

Find the smallest integer such that _5 ^ m % 7_ is either 2, 3, or 4:

```
>>> 5.multiplicativeOrder(7, [2 3 4])
2
```

Find which of the remainders above was matched:

```
>>> 5.powerMod(2, 7)
4

>>> 5.multiplicativeOrder(7, [4])
2
```

Solve the discrete log problem with _5^m%7=4_:

```
>>> 5.multiplicativeOrder(7, [4])
2

>>> 5 ^ 2 % 7
4
```

Calculate list of full reptend primes,
primes with primitive root ten,
OEIS [A001913](https://oeis.org/A001913):

```
>>> 1:50.prime.select { :n |
>>> 	10.multiplicativeOrder(n)
>>> 	=
>>> 	(n - 1)
>>> }
[
	  7  17  19  23  29
	 47  59  61  97 109
	113 131 149 167 179
	181 193 223 229
]
```

Primes with small primitive roots,
OEIS
[A001122](https://oeis.org/A001122),
[A019334](https://oeis.org/A019334),
[A019335](https://oeis.org/A019335),
[A019336](https://oeis.org/A019336),
[A019337](https://oeis.org/A019337),
[A019338](https://oeis.org/A019338),
[A019339](https://oeis.org/A019339):

```
>>> [2 3 5 6 7 11].collect { :p |
>>> 	1:17.prime.select { :n |
>>> 		multiplicativeOrder(p, n)
>>> 		=
>>> 		(n - 1)
>>> 	}
>>> }
[
	3 5 11 13 19 29 37 53 59;
	2 5 7 17 19 29 31 43 53;
	2 3 7 17 23 37 43 47 53;
	11 13 17 41 59;
	2 5 11 13 17 23 41;
	2 3 13 17 23 29 31 41 47 59
]
```

Period of decimal representation of _1/n_,
OEIS [A007732](https://oeis.org/A007732):

```
>>> 1:90.collect { :n |
>>> 	let a = 2 ^ n.integerExponent(2);
>>> 	let b = 5 ^ n.integerExponent(5);
>>> 	let c = n / a / b;
>>> 	10.multiplicativeOrder(c)
>>> }
[
	1   1  1  1  1  1  6  1  1  1
	2   1  6  6  1  1 16  1 18  1
	6   2 22  1  1  6  3  6 28  1
	15  1  2 16  6  1  3 18  6  1
	5   6 21  2  1 22 46  1 42  1
	16  6 13  3  2  6 18 28 58  1
	60 15  6  1  6  2 33 16 22  6
	35  1  8  3  1 18  6  6 13  1
	 9  5  41 6 16 21 28  2 44  1
]
```

Short period primes,
the decimal expansion of _1/p_ has period less than _p-1_, but greater than zero,
OEIS [A006559](https://oeis.org/A006559):

```
>>> 1:89.prime.select { :p |
>>> 	[2 5].includes(p).if {
>>> 		false
>>> 	} {
>>> 		10.multiplicativeOrder(p)
>>> 		<
>>> 		(p - 1)
>>> 	}
>>> }
[
	  3  11  13  31  37
	 41  43  53  67  71
	 73  79  83  89 101
	103 107 127 137 139
	151 157 163 173 191
	197 199 211 227 239
	241 251 271 277 281
	283 293 307 311 317
	331 347 349 353 359
	373 397 401 409 421
	431 439 443 449 457
]
```

Number of cyclotomic cosets of _2%(2n+1)_,
OEIS [A006694](https://oeis.org/A006694):

```
>>> 0:99.collect { :n |
>>> 	(2 * n + 1).divisors.sum { :d |
>>> 		d.eulerPhi
>>> 		/
>>> 		2.multiplicativeOrder(d)
>>> 	} - 1
>>> }
[
	0  1  1  2  2  1  1  4  2  1
	5  2  2  3  1  6  4  5  1  4
	2  3  7  2  4  7  1  4  4  1
	1 12  6  1  5  2  8  7  5  2
	4  1 11  4  8  9 13  4  2  7
	1  2 14  1  3  4  4  5 11  8
	2  7  3 18 10  1  9 10  2  1
	5  4  6  9  1 10 12 13  3  4
	8  1 13  2  2 11  1  8  4  1
	1  4  6  7 19  2  2 19  1  2
]
```

Plot the sequence with a fixed modulus:

~~~spl svg=A
1:50.functionPlot { :k |
	k.multiplicativeOrder(7) ? { 0 }
}
~~~

![](sw/spl/Help/Image/multiplicativeOrder-A.svg)

Plot the sequence, varying the modulus:

~~~spl svg=B
1:22.functionPlot { :n |
	7.multiplicativeOrder(n) ? { 0 }
}
~~~

![](sw/spl/Help/Image/multiplicativeOrder-B.svg)

Plot order of ten modulo _n_,
OEIS [A084680](https://oeis.org/A084680):

~~~spl svg=C
1:96.collect { :n |
	n.isCoprime(10).if {
		10.multiplicativeOrder(n)
	} {
		0
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-C.svg)

Plot number of different cycles of digits in the decimal expansions of reciprocals of primes,
OEIS [A006556](https://oeis.org/A006556):

~~~spl svg=D
4:150.prime.collect { :n |
	(n - 1) / 10.multiplicativeOrder(n)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-D.svg)

Plot shuffling _2n_ cards,
OEIS [A002139](https://oeis.org/A002139):

~~~spl svg=E
1:200.collect { :n |
	let m = 2 * n - 1;
	let x = 2.multiplicativeOrder(m);
	(x = m.eulerPhi).if {
		let [p, k] = m.factorInteger.first;
		(x + 1) * (p ^ (k - 1)).eulerPhi
	} {
		x.lcm(x + 1)
	}
}.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-E.svg)

Plot _(Σ(R(p(n))) - μ(p(n)-1))/p(n)_,
OEIS [A088145](https://oeis.org/A088145):

~~~spl svg=F
let m = 43;
let a = 1:m.collect { :n |
	let p = n.prime;
	let k = p - 1;
	1:k.select { :i |
		i.multiplicativeOrder(p) = k
	}
};
1:m.collect { :n |
	let k = a[n].size;
	let p = n.prime;
	(1:k.sum { :i |
		a[n][i]
	} - (p - 1).moebiusMu) / p
}.discretePlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-F.svg)

* * *

See also: %, carmichaelLambda, eulerPhi, powerMod, primitiveRootList

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DiscreteLogarithm.html)
[2](https://reference.wolfram.com/language/ref/MultiplicativeOrder.html),
_OEIS_
[1](https://oeis.org/A001913)
[2](https://oeis.org/A007732)
[3](https://oeis.org/A006694),
_W_
[1](https://en.wikipedia.org/wiki/Multiplicative_order)
[2](https://en.wikipedia.org/wiki/Discrete_logarithm)
