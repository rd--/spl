# normalized

- _normalized(aFraction)_

Answer the normalized form of _aFraction_.

```
>>> let n = ReducedFraction(2, 4);
>>> (n.asList, n.normalized.asList)
([2 4], [1 2])
```

Fractions are ordinarily normalized by construction.

```
>>> (Fraction(2, 4).asList, 2/4.asList)
([1 2], [1 2])
```

* * *

See also: Fraction, reduced

Categories: Converting
