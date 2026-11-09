# integerBinomial

- _integerBinomial(n, k)_

A specialised variant of `binomial`,
where _n_ and _k_ are integers.
The answer may be a `Integer`,
even if _n_ and _k_ are not.

`binomial` can give large answers for small _n_ and _k_:

```
>>> integerBinomial(8, 5)
56

>>> integerBinomial(333, 22)
13647019435783910848559925263032560L
```

* * *

See also: binomial

Guides: Combinatorial Functions, Integer Functions
