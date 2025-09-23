# isProperSubset

- _isProperSubset(c₁, c₂)_

Answer `true` if the collection _c₂_ is a proper subset of the collection _c₁_.

```
>>> [1 3 5].isProperSubset([1 3 5 7])
true
```

A list is not a proper subset of itself:

```
>>> [1 3 5].isProperSubset([1 3 5])
false
```

* * *

See also: isSubset

Guides: Set Functions

Categories: Testing
