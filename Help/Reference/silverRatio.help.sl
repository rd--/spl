# silverRatio

- _silverRatio(n)_

Answer _n_ × the silver ratio, _√2 + 1_, usually written as δs or λ or σ.

```
>>> 1.silverRatio
2.4142
```

δs is the square root of two plus one:

```
>>> 1.silverRatio
2.sqrt + 1
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

The silver ratio is the limiting ratio of consecutive Pell numbers:

```
>>> 19.pellNumber / 18.pellNumber
1.silverRatio
```

* * *

See also: e, metallicMean, pellNumbers, pi, plasticRatio, supersilverRatio

Guides: Integer Sequences, Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SilverRatio.html),
_OEIS_
[1](https://oeis.org/A014176),
_W_
[1](https://en.wikipedia.org/wiki/Silver_ratio)

Categories: Math, Constant
