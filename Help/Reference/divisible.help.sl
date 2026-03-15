# divisible

- _divisible(n, m)_

Answers `true` if _n_ is divisible by _m_, else `false`.

_divisible_ is typically used to test whether _n_ is divisible by _m_.
_n_ is divisible by _m_ if _n_ is the product of _m_ by an integer.
_divisible(n, m)_ is effectively equivalent to _(n % m) = 0_.

Test whether a number is divisible by two:

```
>>> 10.divisible(2)
true

>>> 10 % 2 = 0
true
```

The number five is not divisible by two:

```
>>> 5.divisible(2)
false

>>> 5 % 2 = 0
false
```

Divisible works over integers:

```
>>> 6.divisible(3)
true

>>> 6 % 3 = 0
true
```

At `Fraction`:

```
>>> 3/2.divisible(1/2)
true

>>> 3/2 % 1/2 = 0
true
```

At `SmallFloat`:

```
>>> 2.pi.divisible(0.5.pi)
true

>>> 2.pi % 0.5.pi = 0
true

>>> 6.sqrt.divisible(2.sqrt)
false

>>> 6.sqrt % 2.sqrt = 0
false
```

At `LargeInteger`:

```
>>> (10L ^ 3000 + 1).divisible(16001L)
true

>>> (10L ^ 3000 + 1) % 16001L = 0L
true
```

Divisible threads elementwise over lists:

```
>>> 1:6.divisible(2)
[false true false true false true]

>>> 1:6 % 2 =.each [0]
[false true false true false true]
```

All integers are divisible by one:

```
>>> [1 .. 13].divisible(1)
13 # [true]
```

The sum of the first few multiples of three or five:

```
>>> 1:999.select { :each |
>>> 	each.divisible(3) | {
>>> 		each.divisible(5)
>>> 	}
>>> }.sum
233168
```

Negative values:

```
>>> 8.divisible(-4)
true

>>> -8.divisible(4)
true

>>> -8.divisible(-4)
true
```

Numbers _k_ such that _⌈√k_ divides _k_,
OEIS [A087811](https://oeis.org/A087811):

```
>>> 1:70.select { :n |
>>> 	n.divisible(n.sqrt.ceiling)
>>> }
[1 2 4 6 9 12 16 20 25 30 36 42 49 56 64]

>>> [2 0 -2 1].linearRecurrence(
>>> 	[1 2 4 6], 15
>>> )
[1 2 4 6 9 12 16 20 25 30 36 42 49 56 64]
```

Smaller numbers are not divisible by large numbers,
although floating point modulo may suggest they are:

```
>>> 233.divisible(133 ^ 133)
false

>>> 233 % (133 ^ 133)
0

>>> 233L % (133L ^ 133L)
233L
```

Numbers not divisible by three,
OEIS [A001651](https://oeis.org/A001651):

```
>>> 1:23.reject { :n | n.divisible(3) }
[1 2 4 5 7 8 10 11 13 14 16 17 19 20 22 23]

>>> [1 1 -1].linearRecurrence([1 2 4], 16)
[1 2 4 5 7 8 10 11 13 14 16 17 19 20 22 23]
```

Matrix plot of divisor table:

~~~spl svg=A
divisible:/2.swap
.table(1:12, 1:60)
.boole
.matrixPlot
~~~

![](sw/spl/Help/Image/divisible-A.svg)

Number of divisors _d_ of _n_ such that _d+1_ is not a divisor of _n_,
OEIS [A137921](https://oeis.org/A137921):

~~~spl svg=B oeis=A137921
1:105.collect { :n |
	divisorSum(n) { :m |
		boole(divisible(n, m + 1).not)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-B.svg)

Smallest number whose square is divisible by _n_,
OEIS [A019554](https://oeis.org/A019554):

~~~spl svg=C oeis=A019554
1:99.collect { :n |
	1:n.detect { :x |
		x.square.divisible(n)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-C.svg)

Least sequence where every term divides the product of its neighbors,
OEIS [A075075](https://oeis.org/A075075):

~~~spl svg=D oeis=A075075
[1 2]
.leastExcludedSequence(201) { :a :n :m |
	(m * a[n - 2]).divisible(a[n - 1])
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-D.svg)

_a(n)_ is the smallest integer not yet in _a_ that is divisible by all non-zero digits of _a(n-1)_,
OEIS [A237851](https://oeis.org/A237851):

~~~spl svg=E oeis=A237851
[1].leastExcludedSequence(200) { :a :n :m |
	a[n - 1].integerDigits
	.select(isPositive:/1)
	.unique
	.allSatisfy { :x |
		m.divisible(x)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-E.svg)

Numbers that are divisible by each non-zero digit,
OEIS [A002796](https://oeis.org/A002796):

~~~spl svg=F oeis=A002796
1:500.select { :n |
	n.integerDigits
	.select(isPositive:/1)
	.unique
	.allSatisfy { :x |
		n.divisible(x)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-F.svg)

Sum previous elements that divide _n_,
OEIS [A269347](https://oeis.org/A269347):

~~~spl svg=G oeis=A269347
let a = [1];
2:55.do { :n |
	let m = n - 1;
	a.add(
		1:m.select { :i |
			n.divisible(a[i])
		}.sum
	)
};
a.log.discretePlot
~~~

![](sw/spl/Help/Image/divisible-G.svg)

Least excluded _m_ such that _m+a(n-1)_ is a multiple of _n_,
OEIS [A099506](https://oeis.org/A099506):

~~~spl svg=H oeis=A099506
[1].leastExcludedSequence(185) { :a :n :m |
	let x = m + a[n - 1];
	x.divisible(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-H.svg)

Least excluded _m_ that is a divisor of the previous term,
or a multiple of the previous term having at least one prime divisor coprime to it,
OEIS [A113552](https://oeis.org/A113552):

~~~spl svg=I oeis=A113552
[1].leastExcludedSequence(59) { :a :n :m |
	let p = a[n - 1];
	p.divisible(m) | {
		m.divisible(p) & {
			m.distinctPrimeFactors
			.anySatisfy { :q |
				q.isCoprime(p)
			}
		}
	}
}.log.discretePlot
~~~

![](sw/spl/Help/Image/divisible-I.svg)

One if _k_ divides _n_ else zero,
OEIS [A051731](https://oeis.org/A051731):

~~~spl svg=J oeis=A051731 set=0,1
1:17.triangularArray { :n :k |
	n.divisible(k).boole
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/divisible-J.svg)

Irregular triangle read by rows in which column _k_ lists ones interleaved with _k-1_ zeros,
and the first element of column _k_ is in row _k(k+1)/2_,
OEIS [A237048](https://oeis.org/A237048):

~~~spl svg=K oeis=A237048 set=0,1
1:24.collect { :n |
	let m = n.inverseTriangularNumber;
	1:m.collect { :k |
		k.isOdd.if {
			n.divisible(k)
		} {
			(n - (k / 2)).divisible(k)
		}.boole
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/divisible-K.svg)

Smallest number _m_ such that _m(m+1)/2_ is divisible by _n_,
OEIS [A011772](https://oeis.org/A011772):

~~~spl svg=L oeis=A011772
1:85.collect { :n |
	1:Infinity.detect { :m |
		(m * (m + 1) / 2).divisible(n)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisible-L.svg)

* * *

See also: %, divisors, even, gcd, mod, quotient, round

Guides: Integer Functions, Predicate Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Divisible.html)

Categories: Math
