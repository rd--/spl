# atIfAbsent

- _atIfAbsent(c, k, f:/0)_

Answer the element in the collection _c_ at the key _k_.
If the key is absent, answer the result of evaluating the no argument block _f_.

```
>>> 1:5.atIfAbsent(3) { nil }
3

>>> 1:5.atIfAbsent(9) { nil }
nil
```

* * *

See also: at, atIfPresent, atIfPresentIfAbsent

References:
_Smalltalk_
5.7.2.3
5.7.8.5

Categories: Accessing
