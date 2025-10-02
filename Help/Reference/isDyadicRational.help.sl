# isDyadicRational

- _isDyadicRational(n/d)_

Answer `true` if _d_ is a power of two, else `false`.

At `Fraction`:

```
>>> 3/16.isDyadicRational
true

>>> 2/3.isDyadicRational
false
```

At `SmallFloat`:

```
>>> 3.isDyadicRational
true

>>> 2.pi.isDyadicRational
false
```

Generate a sequence of dyadic rationals over _(0,x)_ with precision _2ⁿ_.

```
>>> let x = 1;
>>> let n = 3;
>>> let m = 2 ^ n;
>>> [0 .. x * m].collect { :k |
>>> 	k \ m
>>> }
[0 1/8 1/4 3/8 1/2 5/8 3/4 7/8 1/1]
```

* * *

See also: denominator, Fraction, isPowerOfTwo, minkowskiQuestionMark

Guides: Integer Functions, Mathematical Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Dyadic_rational)
