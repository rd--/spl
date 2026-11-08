# normalFraction

- _normalFraction(n/d)_

Convert the fraction _n/d_ to normal form.

```
>>> let n = uncheckedFraction(2L, 4L);
>>> (
>>> 	n.components,
>>> 	n.normalFraction.components
>>> )
([2 4], [1 2])
```

Fractions are ordinarily normalized by construction.

```
>>> (
>>> 	Fraction(2, 4).components,
>>> 	2/4.components
>>> )
([1 2], [1 2])
```

A `Fraction` may be an integer:

```
>>> 3/1.normalFraction
3/1

>>> 3/1.isFraction
true
```

* * *

See also: Fraction, Integer

Guides: Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Normal.html)
