# atIfAbsent

- _atIfAbsent(aCollection, aKey, aBlock:/0)_

Answer the element in _aCollection_ at _aKey_.
If the key is absent, answer the result of evaluating _aBlock_.

```
>>> 1:5.atIfAbsent(3) { nil }
3

>>> 1:5.atIfAbsent(9) { nil }
nil
```

* * *

See also: at, atIfPresent

References:
_Smalltalk_
5.7.2.3
5.7.8.5

Categories: Accessing
