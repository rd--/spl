# allEqualBy

- _allEqualBy(aCollection, aBlock:/2)_

Answer `true` is all items in _aCollection_ are equal according to _aBlock_.

```
>>> [1 1 1].allEqualBy(=)
true

>>> [1 2 3].allEqualBy(=)
false
```

Do all items compare equal according to `~`:

```
>>> [0 1E-6 1E-9].allEqualBy(~)
true
```

* * *

See also: =, ~, allEqual
