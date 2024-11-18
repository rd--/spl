# silverRatio

- _silverRatio(aNumber)_

Answer _aNumber_ × the silver ratio, usually written as δs or λ or σ.

```
>>> 1.silverRatio
2.4142
```

δs is the square root of two plus one:

```
>>> 1.silverRatio
(2.sqrt + 1)
```

The silver ratio is the `metallicMean` of two:

```
>>> 2.metallicMean
2.4142
```

The `reciprocal` of δs is its `fractionPart`:

```
>>> 1.silverRatio.reciprocal
1.silverRatio.fractionPart
```

As a continued fraction:

```
>>> 1.silverRatio.continuedFraction(20)
(2 # 20)
```

* * *

See also: e, silverAngle, metallicMean, pi, plasticRatio, supersilverRatio

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SilverRatio.html),
_Oeis_
[1](https://oeis.org/A014176),
_W_
[1](https://en.wikipedia.org/wiki/Silver_ratio)

Categories: Math, Constant
