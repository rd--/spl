# asSmallFloat

- _asSmallFloat(aFraction | aLargeInteger | aSmallFloat)_

In the `Fraction` case, answer the nearest `SmallFloat`:

```
>>> 1/4.asSmallFloat
0.25
```

In the `LargeInteger` case:

```
>>> 23n.asSmallFloat
23

>>> (2n ^ 54).asSmallFloat
18014398509481984

>>> (2n ^ 99).asSmallFloat
6.33825E29
```

In the `SmallFloat` case answer _identity_:

```
>>> 23.asSmallFloat
23

>>> 1.pi.asSmallFloat
1.pi
```

* * *

See also: Fraction, LargeInteger, SmallFloat

Categories: Converting
