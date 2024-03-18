# normalized

- _normalized(aFraction)_

Answer the normalized form of _aFraction_.

```
>>> let n = ReducedFraction(2, 4);
>>> (n.asTuple, n.normalized.asTuple)
((2, 4), (1, 2))
```

Fractions are ordinarily normalized anby construction.

```
>>> (Fraction(2, 4).asTuple, 2/4.asTuple)
((1, 2), (1, 2))
```

* * *

See also: Fraction, reduced

Categories: Converting
