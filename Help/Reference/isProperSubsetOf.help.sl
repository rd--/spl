# isProperSubsetOf

- _isProperSubsetOf(aCollection, anotherCollection)_

Answer `true` if _anotherCollection_ is a proper subset of _aCollection_.

```
>>> [1 3 5].isProperSubsetOf([1 3 5 7])
true
```

A list is not a proper subset of itself:

```
>>> [1 3 5].isProperSubsetOf([1 3 5])
false
```

* * *

See also: isSubsetOf

Categories: Testing
