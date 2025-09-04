# asSmallFloat

- _asSmallFloat(x)_

Convert a `Fraction` or a `LargeInteger` into a `SmallFloat`.

In the `Fraction` case, answer the nearest `SmallFloat`:

```
>>> 1/4.asSmallFloat
0.25
```

In the `LargeInteger` case:

```
>>> 23L.asSmallFloat
23

>>> (2L ^ 54).asSmallFloat
18014398509481984

>>> (2L ^ 99).asSmallFloat
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
