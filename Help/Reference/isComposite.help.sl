# isComposite

- _isComposite(n)_

Answer `true` if the integer _n_ is prime, else `false`.

Test whether a number is composite:

```
>>> 4.isComposite
true
```

The number  is not composite:

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
[true false false true false true]

>>> [2 3 0 6 10].isComposite.boole
[0 0 1 1 1]

>>> 0:24.isComposite.boole
[
	1 1 0 0 1 0 1 0 1 1
	1 0 1 0 1 1 1 0 1 0
	1 1 1 0 1
]
```

The distribution of Gaussian composite numbers:

~~~spl png=A
{ :a :b |
	a.j(b).isComposite.boole
}.table(1:100, 1:100).Bitmap
~~~

![](sw/spl/Help/Image/isComposite-A.png)

* * *

See also: isGaussianPrime, isPrime

Guides: Integer Functions, Prime Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CompositeQ.html),
_OEIS_
[1](https://oeis.org/A002808),
_W_
[1](https://en.wikipedia.org/wiki/Composite_number)

Categories: Arithmetic
