# isIdentity

- _isIdentity(p)_

Answer `true` if the permutation _p_ is the identity permutation,
else `false`.

A permutation with only fixed points (unary cycles):

```
>>> [1; 2; 3].cycles.isIdentity
true
```

An empty cycles list:

```
>>> [].cycles.isIdentity
true
```

* * *

See also: Permutation

Guides: Permutation Functions, Predicate Functions

Categories: Permutations
