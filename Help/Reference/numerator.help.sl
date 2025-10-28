# numerator

- _numerator(n/d)_

Answer the numerator _n_ of a `Fraction` _n/d_,
or the identity for an `Integer`.

```
>>> 2/3.numerator
2

>>> 2.numerator
2
```

At negative fractions the `numerator` is negative:

```
>>> -3/4.numerator
-3

>>> -3/4.denominator
4

>>> Fraction(3, -4).numerator
-3
```

Threads over lists:

```
>>> [4/6 5/7].numerator
[2 5]
```

* * *

See also: denominator, Fraction, isFraction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Numerator.html)
[2](https://reference.wolfram.com/language/ref/Numerator.html),
_Smalltalk_
5.6.3.2,
_W_
[1](https://en.wikipedia.org/wiki/Fraction)

Categories: Arithmetic
