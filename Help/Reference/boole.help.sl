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

Convert a table of boolean values for plotting:

~~~spl svg=A
{ :a :b |
	((a ^ b) + 3).isPrime
}.table(1:30, 1:10).boole.matrixPlot
~~~

![](sw/spl/Help/Image/boole-A.svg)

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

![](sw/spl/Help/Image/boole-B.svg)

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

![](sw/spl/Help/Image/boole-C.svg)

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
