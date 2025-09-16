# isSumProductNumber

- _isSumProductNumber(n, b=10)_

Answer `true` if _n_ is a sum-product number in base _b_.

In base ten:

```
>>> 1:200.select(isSumProductNumber:/1)
[1 135 144]
```

In base eleven:

```
>>> 1:3000.select { :x |
>>> 	x.isSumProductNumber(11)
>>> }
[11r1 11r253 11r419 11r2189]
```

* * *

See also: *, integerDigits, product, sum

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Sum-ProductNumber.html),
_OEIS_
[1](http://oeis.org/A038369),
_W_
[1](https://en.wikipedia.org/wiki/Sum-product_number)
