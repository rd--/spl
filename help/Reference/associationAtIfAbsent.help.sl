# associationAtIfAbsent

- _associationAtIfAbsent(aDictionary, key, aBlock:/0)_

Answer the association with the given _key_ at _aDictionary_.
If key is not found, return the result of evaluating _aBlock_.

```
>>> (x: 1, y: 2).associationAtIfAbsent('y') { nil }
('y' -> 2)

>>> (x: 1, y: 2).associationAtIfAbsent('z') { nil }
nil
```

* * *

See also: associationAt, atIfAbsent

Categories: Accessing
