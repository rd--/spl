# associationAtIfAbsent

- _associationAtIfAbsent(d, k, f/0)_

Answer the association with the given key _k_ at the dictionary _d_.
If key is not found, answer the result of evaluating the no-argument block _f_.

```
>>> (x: 1, y: 2)
>>> .associationAtIfAbsent('y') { nil }
('y' -> 2)

>>> (x: 1, y: 2)
>>> .associationAtIfAbsent('z') { nil }
nil
```

* * *

See also: associationAt, atIfAbsent

Guides: Dictionary Functions

Categories: Accessing
