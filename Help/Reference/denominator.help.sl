# denominator

- _denominator(aNumber)_

Answer the denominator of a _Fraction_ or 1 for an _Integer_.

```
>>> 2/3.denominator
3

>>> 2.denominator
1
```

At negative fractions the `denominator` is positive:

```
>>> -3/4.denominator
4

>>> -3/4.numerator
-3

>>> Fraction(3, -4).denominator
4
```

Threads over lists:

```
>>> [4/6 5/7].denominator
[3 7]
```

* * *

See also: Fraction, numerator

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Denominator.html)
[2](https://reference.wolfram.com/language/ref/Denominator.html),
_Smalltalk_
5.6.3.1

Categories: Arithmetic
