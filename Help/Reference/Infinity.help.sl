# Infinity

`Infinity` is a numeric constant.

`Infinity` is a number:

```
>>> Infinity.isNumber
true
```

`Infinity` may be signed:

```
>>> +Infinity.isPositive
true

>>> -Infinity.isNegative
true
```

In particular, `Infinity` is a `SmallFloat`:

```
>>> Infinity.isSmallFloat
true
```

`Infinity` is not finite:

```
>>> Infinity.isFinite
false
```

_∞×0_, `zero` times `Infinity`, is not a number:

```
>>> (Infinity * 0).isNaN
true
```

Neither is _∞-∞_:

```
>>> (Infinity - Infinity).isNaN
true
```

_∞±n_ is ∞:

```
>>> Infinity + 1
Infinity

>>> Infinity - 1
Infinity
```

Arithmetic:

```
>>> 1 / Infinity
0

>>> Infinity * Infinity
Infinity

>>> ((2 * Infinity) - Infinity).isNaN
true
```

Predicates:

```
>>> (10 ^ 100) < Infinity
true
```

Mathematical functions at infinities:

```
>>> -Infinity.exp
0

>>> Infinity.exp
Infinity
```

Infinity answers of mathematical functions:

```
>>> 0.log
-Infinity

>>> 0.gamma
Infinity
```

Smallest prime not dividing _n_,
OEIS [A053669](https://oeis.org/A053669):

~~~spl svg=A
1:65.collect { :n |
	1:Infinity.detect { :k |
		n.gcd(k.prime) = 1
	}.prime
}.discretePlot
~~~

![](sw/spl/Help/Image/Infinity-A.svg)

Least number coprime to _n_ and _n+1_,
OEIS [A053670](https://oeis.org/A053670):

~~~spl svg=B
1:65.collect { :n |
	2:Infinity.detect { :k |
		k.isCoprime(n) & {
			k.isCoprime(n + 1)
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/Infinity-B.svg)

Least number coprime to _n_, _n+1_ and _n+2_,
OEIS [A053671](https://oeis.org/A053671):

~~~spl svg=C
1:65.collect { :n |
	5:Infinity.detect { :k |
		[0 1 2].allSatisfy { :i |
			k.isCoprime(n + i)
		}
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/Infinity-C.svg)

* * *

See also: e, inf, NaN, pi

Guides: Mathematical Constants

References:
_Mathematica_
[1](http://mathworld.wolfram.com/Infinity.html)
[2](https://mathworld.wolfram.com/DirectedInfinity.html)
[3](https://reference.wolfram.com/language/ref/Infinity.html)
[4](https://reference.wolfram.com/language/ref/DirectedInfinity.html)
[5](https://reference.wolfram.com/language/ref/ComplexInfinity.html),
_W_
[1](https://en.wikipedia.org/wiki/Infinity)

Unicode: U+221E ∞ Infinity
