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

* * *

See also: %, divisors, even, gcd, mod, quotient, round

Guides: Integer Functions, Predicate Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Divisible.html)

Categories: Math
