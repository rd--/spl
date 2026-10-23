# normalFraction

- _normalFraction(n/d)_

Convert the fraction _n/d_ to normal form.

```
>>> let n = uncheckedFraction(2, 4);
>>> (
>>> 	n.components,
>>> 	n.normalFraction.components
>>> )
([2 4], [1 2])
```

The normal form of a `Fraction` with a unit denominator is a `Fraction`:

```
>>> 3/1.normalFraction
3/1

>>> 3/1.normalFraction.isFraction
true

>>> 3.isFraction
false
```

Fractions are ordinarily normalized by construction.

```
>>> (
>>> 	Fraction(2, 4).components,
>>> 	2/4.components
>>> )
([1 2], [1 2])
```

* * *

See also: Fraction, Integer

Guides: Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Normal.html)
