# inverseBinomialTransform

- _inverseBinomialTransform(f:/1)_
- _inverseBinomialTransform([x₁ x₂ …])_

Answer the inverse binomial transform of the unary function _f_ or the integer sequence _x_.

Inverse binomial transform of _(3^n+1)/2_,
OEIS [A011782](https://oeis.org/A011782):

```
>>> ((3 ^ 0:11) + 1 / 2)
>>> .inverseBinomialTransform
[1 1 2 4 8 16 32 64 128 256 512 1024]
```

* * *

See also: binomialTransform

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BinomialTransform.html),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_transform)
