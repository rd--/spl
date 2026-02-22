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

Matrix plot of divisor table:

~~~spl svg=A
divisible:/2.swap
.table(1:12, 1:60)
.boole
.matrixPlot
~~~

![](sw/spl/Help/Image/divisible-A.svg)

Plot number of divisors _d_ of _n_ such that _d+1_ is not a divisor of _n_,
OEIS [A137921](https://oeis.org/A137921):

~~~spl svg=B
1:105.collect { :n |
	divisorSum(n) { :m |
		boole(divisible(n, m + 1).not)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-B.svg)

Smallest number whose square is divisible by _n_,
OEIS [A019554](https://oeis.org/A019554):

~~~spl svg=C
1:99.collect { :n |
	1:n.detect { :x |
		x.square.divisible(n)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-C.svg)

Plot least sequence where every term divides the product of its neighbors,
OEIS [A075075](https://oeis.org/A075075):

~~~spl svg=D
let a = [1 2];
2:200.do { :n |
	let x = a[n - 1];
	let y = a[n];
	let z = 1:Infinity.detect { :i |
		a.includes(i).not & {
			(i * x).divisible(y)
		}
	};
	a.add(z)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-D.svg)

Plot _a(n)_ the smallest integer not yet in _a_ that is divisible by all non-zero digits of _a(n-1)_,
OEIS [A237851](https://oeis.org/A237851):

~~~spl svg=E
let a = Map { :n |
	(n = 1).if {
		1
	} {
		let b = a[n - 1];
		1:Infinity.detect { :k |
			a.includes(k).not & {
				b.integerDigits
				.select(isPositive:/1)
				.unique
				.allSatisfy { :x |
					k.divisible(x)
				}
			}
		}
	}
};
a[1:200].scatterPlot
~~~

![](sw/spl/Help/Image/divisible-E.svg)

Plot numbers that are divisible by each non-zero digit,
OEIS [A002796](https://oeis.org/A002796):

~~~spl svg=F
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

~~~spl svg=G
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

* * *

See also: %, divisors, even, gcd, mod, quotient, round

Guides: Integer Functions, Predicate Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Divisible.html)

Categories: Math
