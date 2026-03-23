# boole

- _boole(b)_

Answer 1 if the boolean value _b_ is `true` and 0 if it is `false`.

```
>>> [false.boole, true.boole]
[0 1]
```

Threads over lists, convert a list of truth values to integers:

```
>>> [true false true true false].boole
[1 0 1 1 0]
```

One and thereafter _4n_,
OEIS [A008574](https://oeis.org/A008574):

```
>>> 0:13.collect { :n |
>>> 	(4 * n) + (n = 0).boole
>>> }
[1 4 8 12 16 20 24 28 32 36 40 44 48 52]
```

Convert a table of boolean values for plotting:

~~~spl svg=A
{ :a :b |
	((a ^ b) + 3).isPrime
}.table(1:30, 1:10).boole.matrixPlot
~~~

![](Help/Image/boole-A.svg)

The inverse of `boole` is `asBoolean`:

```
>>> [1 0 1 1 0].collect(asBoolean:/1)
[true false true true false]
```

It is an error if _b_ is not a `Boolean`:

```
>>> { 'false'.boole }.hasError
true

>>> { 0.boole }.hasError
true
```

The characteristic function of `one`,
OEIS [A063524](https://oeis.org/A063524):

```
>>> 0:19.collect { :n | (n = 1).boole }
[0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
```

Triangle read by rows,
_k_ if _k_ is a divisor of _n_ else zero,
OEIS [A127093](https://oeis.org/A127093):

~~~spl svg=B oeis=A127093
1:14.triangularArray { :n :k |
	k * n.divisible(k).boole
}.catenate.discretePlot
~~~

![](Help/Image/boole-B.svg)

Number of partitions of _n_ into three squares,
allowing part zero,
OEIS [A000164](https://oeis.org/A000164):

~~~spl svg=C oeis=A000164
1:115.collect { :n |
	let m = n.integerSquareRoot;
	0:m.sum { :i |
		0:i.sum { :j |
			0:j.sum { :k |
				let p = [i j k] ^ 2;
				(p.sum = n).boole
			}
		}
	}
}.scatterPlot
~~~

![](Help/Image/boole-C.svg)

A sum of sums of products of _n-x+1_ for coprime _x_,
OEIS [A115004](https://oeis.org/A115004):

~~~spl svg=D oeis=A115004
1:40.collect { :n |
	1:n.sum { :i |
		1:n.sum { :j |
			(n - i + 1)
			*
			(n - j + 1)
			*
			i.isCoprime(j).boole
		}
	}
}.discretePlot
~~~

![](Help/Image/boole-D.svg)

Triangle of sum of sums of _(n+1-i)(k+1-j)_ for coprime _i,j_,
OEIS [A320541](https://oeis.org/A320541)

~~~spl svg=D oeis=A320541
1:10.triangularArray { :n :k |
	1:n.sum { :i |
		1:k.sum { :j |
			(n + 1 - i)
			*
			(k + 1 - j)
			*
			i.isCoprime(j).boole
		}
	}
}.catenate.discretePlot
~~~

![](Help/Image/boole-E.svg)

* * *

See also: asBit, asBoolean, asInteger

Guides: Boolean Functions, Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IversonBracket.html)
[2](https://mathworld.wolfram.com/CharacteristicFunction.html)
[3](https://reference.wolfram.com/language/ref/Boole.html),
_W_
[1](https://en.wikipedia.org/wiki/Iverson_bracket)
[2](https://en.wikipedia.org/wiki/Indicator_function)

Categories: Converting
