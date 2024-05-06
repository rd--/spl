# isSubsetOf

- _isSubsetOf(alpha, beta)_ => _includesAllOf(beta, alpha)_

Answer `true` if the first collection is a subset of the second,
the inverse of `includesAllOf` which answers if the second collection is a subset of the first.

_1,3,5_ is a subset of _1,3,5,7_:

```
>>> [1 3 5].isSubsetOf([1 3 5 7])
true
```

* * *

See also: includes, includesAllOf, isProperSubsetOf
