# isComposite

- _isComposite(n)_

Answer `true` if the integer _n_ is _not_ prime, else `false`.

Test whether a number is composite:

```
>>> 4.isComposite
true
```

The number thirteen is not composite:

```
>>> 13.isComposite
false
```

Test for large integers:

```
>>> (10L ^ 3000 + 1).isComposite
true
```

Threads over lists:

```
>>> 1:6.isComposite
[false false false true false true]

>>> [2 3 0 6 10].isComposite.boole
[0 0 0 1 1]

>>> 0:24.isComposite.boole
[
	0 0 0 0 1 0 1 0 1 1
	1 0 1 0 1 1 1 0 1 0
	1 1 1 0 1
]
```

At negative integers:

```
>>> [-7 -9].isComposite
[false true]
```

At `zero` and `one`:

```
>>> [0 1].isComposite
[true true]
```

Select first few terms:

```
>>> 1:14.select(isComposite:/1)
[4 6 8 9 10 12 14]
```

The distribution of Gaussian composite numbers:

~~~spl png=A
{ :a :b |
	a.j(b).isComposite.boole
}.table(1:100, 1:100).Bitmap
~~~

![](sw/spl/Help/Image/isComposite-A.png)

Plot smallest number _m_ such that _2*m-p_ is composite for the first _n_ primes,
OEIS [A051169](https://oeis.org/A051169):

~~~spl svg=B
let k = 30;
let p = 1:k.prime;
1:k.collect { :n |
	1:50000.detect { :x |
		p.take(n).allSatisfy { :y |
			(2 * x - y).isComposite
		}
	}
}.log.stepPlot
~~~

![](sw/spl/Help/Image/isComposite-B.svg)

* * *

See also: isGaussianPrime, isPrime

Guides: Integer Functions, Predicate Functions, Prime Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CompositeQ.html),
_OEIS_
[1](https://oeis.org/A002808)
[2](https://oeis.org/A051169),
_W_
[1](https://en.wikipedia.org/wiki/Composite_number)

Categories: Arithmetic
