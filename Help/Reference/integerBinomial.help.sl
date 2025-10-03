# integerBinomial

- _integerBinomial(n, k)_

A specialised variant of `binomial`,
where _n_ and _k_ are integers,
and the answer is a `LargeInteger`,
even if _n_ and _k_ are not.

`binomial` can give large answers for small _n_ and _k_:

```
>>> 8.integerBinomial(5)
56L

>>> 333.integerBinomial(22)
13647019435783910848559925263032560L
```

* * *

See also: binomial

Guides: Combinatorial Functions
